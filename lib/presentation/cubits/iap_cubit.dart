import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/feature_listing_dto.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'iap_state.dart';

@singleton
class IAPCubit extends Cubit<IAPState> {
  IAPCubit() : super(const IAPState());

  late final StreamSubscription<List<PurchaseDetails>> _subscription;
  final InAppPurchase _iap = InAppPurchase.instance;
  final _analytics = FirebaseAnalytics.instance;

  void initialize() {
    _logIAPInitialized();
    _subscription = _iap.purchaseStream.listen(
      (purchases) {
        for (final purchase in purchases) {
          _handlePurchase(purchase);
        }
      },
      onError: (error) {
        _logIAPError('purchase_stream_error', error.toString());
        AppSnackbar.showError(
          'An error occurred while processing the purchase.',
        );
      },
    );
  }

  void _logIAPInitialized() {
    _analytics.logEvent(
      name: 'iap_initialized',
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void setPromotionContext({
    required String listingId,
    required String itemType,
  }) {
    emit(state.copyWith(listingId: listingId, itemType: itemType));
    _logPromotionContextSet(listingId, itemType);
  }

  void _logPromotionContextSet(String listingId, String itemType) {
    _analytics.logEvent(
      name: 'promotion_context_set',
      parameters: {
        'listing_id': listingId,
        'item_type': itemType,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  Future<void> purchaseProduct(String productId, BuildContext context) async {
    _logPurchaseStarted(productId);
    emit(state.copyWith(isPurchasing: true));
    try {
      final isAvailable = await _iap.isAvailable();
      if (!isAvailable) {
        _logIAPError('iap_not_available', 'IAP not available');
        throw Exception('IAP not available.');
      }

      final response = await _iap.queryProductDetails({productId});
      if (response.notFoundIDs.contains(productId) || response.productDetails.isEmpty) {
        _logIAPError('product_not_found', 'Product not found');
        throw Exception('Product not found.');
      }

      final purchaseParam = PurchaseParam(productDetails: response.productDetails.first);
      _logProductDetailsFound(response.productDetails.first);

      await _iap.buyConsumable(purchaseParam: purchaseParam);
    } catch (e) {
      _logIAPError('purchase_initiation_failed', e.toString());
      AppSnackbar.showSuccess(e.toString());
      emit(state.copyWith(isPurchasing: false));
    }
  }

  void _logPurchaseStarted(String productId) {
    _analytics.logEvent(
      name: 'purchase_started',
      parameters: {
        'product_id': productId,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logProductDetailsFound(ProductDetails product) {
    _analytics.logEvent(
      name: 'product_details_found',
      parameters: {
        'product_id': product.id,
        'title': product.title,
        'description': product.description,
        'price': product.price,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  Future<void> _handlePurchase(PurchaseDetails purchase) async {
    if (purchase.status == PurchaseStatus.purchased) {
      _logPurchaseStatus('purchased', purchase);
      final iapData = IAPData(
        productId: purchase.productID,
        transactionId: purchase.transactionDate ?? '',
        purchaseToken: purchase.verificationData.serverVerificationData,
        receipt: Platform.isIOS ? purchase.verificationData.localVerificationData : null,
      );

      try {
        if (purchase.productID.contains("featured")) {
          _logFeatureListingAttempt(purchase);
          final dto = FeatureListingDto(
            listingId: state.listingId!,
            itemType: state.itemType!,
            goldenTicket: false,
            iapData: iapData,
          );
          await FirebaseFunctions.instance.httpsCallable(featureListingCF).call(dto.toJson());
          _logFeatureListingSuccess(purchase);
        } else {
          _logTicketPurchaseAttempt(purchase);
          await FirebaseFunctions.instance.httpsCallable(redeemPurchaseCF).call(iapData.toJson());
          _logTicketPurchaseSuccess(purchase);
        }

        AppSnackbar.showSuccess('Purchase successful!');
      } on FirebaseFunctionsException catch (e) {
        _logIAPError('cloud_function_error', e.message ?? "Unknown error");
        AppSnackbar.showError(
          'Purchase failed: ${e.message ?? "Unknown error"}',
        );
      } finally {
        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
          _logPurchaseCompleted(purchase);
        }
        emit(state.copyWith(isPurchasing: false));
      }
    } else if (purchase.status == PurchaseStatus.error) {
      _logPurchaseStatus('error', purchase);
      AppSnackbar.showError('Purchase failed: ${purchase.error?.message}');
      emit(state.copyWith(isPurchasing: false));
    } else {
      _logPurchaseStatus(purchase.status.toString(), purchase);
    }
  }

  void _logPurchaseStatus(String status, PurchaseDetails purchase) {
    _analytics.logEvent(
      name: 'purchase_status',
      parameters: {
        'status': status,
        'product_id': purchase.productID,
        'transaction_date': purchase.transactionDate ?? '',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logFeatureListingAttempt(PurchaseDetails purchase) {
    _analytics.logEvent(
      name: 'feature_listing_attempt',
      parameters: {
        'product_id': purchase.productID,
        'listing_id': state.listingId ?? '',
        'item_type': state.itemType ?? '',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logFeatureListingSuccess(PurchaseDetails purchase) {
    _analytics.logEvent(
      name: 'feature_listing_success',
      parameters: {
        'product_id': purchase.productID,
        'listing_id': state.listingId ?? '',
        'item_type': state.itemType ?? '',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logTicketPurchaseAttempt(PurchaseDetails purchase) {
    _analytics.logEvent(
      name: 'ticket_purchase_attempt',
      parameters: {
        'product_id': purchase.productID,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logTicketPurchaseSuccess(PurchaseDetails purchase) {
    _analytics.logEvent(
      name: 'ticket_purchase_success',
      parameters: {
        'product_id': purchase.productID,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logPurchaseCompleted(PurchaseDetails purchase) {
    _analytics.logEvent(
      name: 'purchase_completed',
      parameters: {
        'product_id': purchase.productID,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logIAPError(String errorType, String errorMessage) {
    _analytics.logEvent(
      name: 'iap_error',
      parameters: {
        'error_type': errorType,
        'error_message': errorMessage,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }

  void resetPromotionContext() {
    emit(state.copyWith(listingId: null, itemType: null));
  }
}
