import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/feature_listing_dto.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'dart:developer' as developer;
import 'iap_state.dart';

@singleton
class IAPCubit extends Cubit<IAPState> {
  IAPCubit() : super(const IAPState()) {
    debugPrint('IAP: IAPCubit constructor called');
    developer.log('IAP: IAPCubit constructor called', name: 'IAPCubit');
  }

  late final StreamSubscription<List<PurchaseDetails>> _subscription;
  final InAppPurchase _iap = InAppPurchase.instance;
  final _analytics = FirebaseAnalytics.instance;

  void initialize() {
    try {
      debugPrint('IAP: Starting initialization...');
      developer.log('IAP: Starting initialization...', name: 'IAPCubit');
      _logIAPInitialized();
      
      debugPrint('IAP: Setting up purchase stream listener...');
      developer.log('IAP: Setting up purchase stream listener...', name: 'IAPCubit');
      _subscription = _iap.purchaseStream.listen(
        (purchases) {
          debugPrint('IAP: Received purchase stream update with ${purchases.length} purchases');
          developer.log('IAP: Received purchase stream update with ${purchases.length} purchases', name: 'IAPCubit');
          for (final purchase in purchases) {
            debugPrint('IAP: Processing purchase: ${purchase.productID}');
            developer.log('IAP: Processing purchase: ${purchase.productID}', name: 'IAPCubit');
            _handlePurchase(purchase);
          }
        },
        onError: (error) {
          debugPrint('IAP: Purchase stream error: $error');
          developer.log('IAP: Purchase stream error: $error', name: 'IAPCubit', error: error);
          _logIAPError('purchase_stream_error', error.toString());
          AppSnackbar.showError(
            'An error occurred while processing the purchase.',
          );
        },
      );
      debugPrint('IAP: Initialization completed successfully');
      developer.log('IAP: Initialization completed successfully', name: 'IAPCubit');
    } catch (e, stackTrace) {
      debugPrint('IAP: Error during initialization: $e\n$stackTrace');
      developer.log(
        'IAP: Error during initialization',
        name: 'IAPCubit',
        error: e,
        stackTrace: stackTrace,
      );
      _logIAPError('initialization_error', e.toString());
    }
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
    developer.log('IAP: Starting purchase for product: $productId', name: 'IAPCubit');
    _logPurchaseStarted(productId);
    emit(state.copyWith(isPurchasing: true));
    try {
      final isAvailable = await _iap.isAvailable();
      developer.log('IAP: Store available: $isAvailable', name: 'IAPCubit');
      
      if (!isAvailable) {
        developer.log('IAP: Store not available', name: 'IAPCubit');
        _logIAPError('iap_not_available', 'IAP not available');
        throw Exception('IAP not available.');
      }

      developer.log('IAP: Querying product details for: $productId', name: 'IAPCubit');
      final response = await _iap.queryProductDetails({productId});
      developer.log(
          'IAP: Product query response - Not found IDs: ${response.notFoundIDs}, Found products: ${response.productDetails.length}',
          name: 'IAPCubit');
      
      if (response.notFoundIDs.contains(productId) || response.productDetails.isEmpty) {
        developer.log('IAP: Product not found in store', name: 'IAPCubit');
        _logIAPError('product_not_found', 'Product not found');
        throw Exception('Product not found.');
      }

      final product = response.productDetails.first;
      developer.log('IAP: Found product - ID: ${product.id}, Title: ${product.title}, Price: ${product.price}',
          name: 'IAPCubit');

      final purchaseParam = PurchaseParam(productDetails: product);
      _logProductDetailsFound(product);

      developer.log('IAP: Initiating purchase...', name: 'IAPCubit');
      await _iap.buyConsumable(purchaseParam: purchaseParam);
      developer.log('IAP: Purchase initiated successfully', name: 'IAPCubit');
    } catch (e) {
      developer.log('IAP: Purchase initiation failed', name: 'IAPCubit', error: e);
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
    developer.log('IAP: Handling purchase - Product: ${purchase.productID}, Status: ${purchase.status}',
        name: 'IAPCubit');
    
    if (purchase.status == PurchaseStatus.purchased) {
      developer.log('IAP: Purchase successful', name: 'IAPCubit');
      _logPurchaseStatus('purchased', purchase);
      
      final iapData = IAPData(
        productId: purchase.productID,
        transactionId: purchase.transactionDate ?? '',
        purchaseToken: purchase.verificationData.serverVerificationData,
        receipt: Platform.isIOS ? purchase.verificationData.localVerificationData : null,
      );
      
      developer.log('IAP: Created IAP data - Transaction ID: ${iapData.transactionId}', name: 'IAPCubit');

      try {
        if (purchase.productID.contains("featured")) {
          developer.log('IAP: Processing featured listing purchase', name: 'IAPCubit');
          _logFeatureListingAttempt(purchase);
          
          final dto = FeatureListingDto(
            listingId: state.listingId!,
            itemType: state.itemType!,
            goldenTicket: false,
            iapData: iapData,
          );
          
          developer.log('IAP: Calling feature listing cloud function', name: 'IAPCubit');
          await FirebaseFunctions.instance.httpsCallable(featureListingCF).call(dto.toJson());
          _logFeatureListingSuccess(purchase);
          developer.log('IAP: Feature listing cloud function call successful', name: 'IAPCubit');
        } else {
          developer.log('IAP: Processing ticket purchase', name: 'IAPCubit');
          _logTicketPurchaseAttempt(purchase);
          
          developer.log('IAP: Calling redeem purchase cloud function', name: 'IAPCubit');
          await FirebaseFunctions.instance.httpsCallable(redeemPurchaseCF).call(iapData.toJson());
          _logTicketPurchaseSuccess(purchase);
          developer.log('IAP: Redeem purchase cloud function call successful', name: 'IAPCubit');
        }

        AppSnackbar.showSuccess('Purchase successful!');
      } on FirebaseFunctionsException catch (e) {
        developer.log('IAP: Cloud function error', name: 'IAPCubit', error: e);
        _logIAPError('cloud_function_error', e.message ?? "Unknown error");
        AppSnackbar.showError(
          'Purchase failed: ${e.message ?? "Unknown error"}',
        );
      } finally {
        if (purchase.pendingCompletePurchase) {
          developer.log('IAP: Completing purchase', name: 'IAPCubit');
          await _iap.completePurchase(purchase);
          _logPurchaseCompleted(purchase);
          developer.log('IAP: Purchase completed', name: 'IAPCubit');
        }
        emit(state.copyWith(isPurchasing: false));
      }
    } else if (purchase.status == PurchaseStatus.error) {
      developer.log('IAP: Purchase error - ${purchase.error?.message}', name: 'IAPCubit', error: purchase.error);
      _logPurchaseStatus('error', purchase);
      AppSnackbar.showError('Purchase failed: ${purchase.error?.message}');
      emit(state.copyWith(isPurchasing: false));
    } else {
      developer.log('IAP: Purchase status: ${purchase.status}', name: 'IAPCubit');
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
