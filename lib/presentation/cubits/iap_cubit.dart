import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:cloud_functions/cloud_functions.dart';
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

  void initialize() {
    _subscription = _iap.purchaseStream.listen(
      (purchases) {
        for (final purchase in purchases) {
          _handlePurchase(purchase);
        }
      },
      onError: (_) {
        AppSnackbar.showError(
          'An error occurred while processing the purchase.',
        );
      },
    );
  }

  void setPromotionContext({
    required String listingId,
    required String itemType,
  }) {
    emit(state.copyWith(listingId: listingId, itemType: itemType));
  }

  Future<void> purchaseProduct(String productId, BuildContext context) async {
    emit(state.copyWith(isPurchasing: true));
    try {
      final isAvailable = await _iap.isAvailable();
      if (!isAvailable) throw Exception('IAP not available.');

      final response = await _iap.queryProductDetails({productId});
      if (response.notFoundIDs.contains(productId) || response.productDetails.isEmpty) {
        throw Exception('Product not found.');
      }

      final purchaseParam = PurchaseParam(productDetails: response.productDetails.first);

      await _iap.buyConsumable(purchaseParam: purchaseParam);
    } catch (e) {
      AppSnackbar.showSuccess(e.toString());
      emit(state.copyWith(isPurchasing: false));
    }
  }

  Future<void> _handlePurchase(PurchaseDetails purchase) async {
    if (purchase.status == PurchaseStatus.purchased) {
      final iapData = IAPData(
        productId: purchase.productID,
        transactionId: purchase.transactionDate ?? '',
        purchaseToken: purchase.verificationData.serverVerificationData,
        receipt: Platform.isIOS ? purchase.verificationData.localVerificationData : null,
      );

      try {
        if (purchase.productID.contains("featured")) {
          final dto = FeatureListingDto(
            listingId: state.listingId!,
            itemType: state.itemType!,
            goldenTicket: false,
            iapData: iapData,
          );
          await FirebaseFunctions.instance.httpsCallable(featureListingCF).call(dto.toJson());
        } else {
          await FirebaseFunctions.instance.httpsCallable(redeemPurchaseCF).call(iapData.toJson());
        }

        AppSnackbar.showSuccess('Purchase successful!');
      } on FirebaseFunctionsException catch (e) {
        AppSnackbar.showError(
          'Purchase failed: ${e.message ?? "Unknown error"}',
        );
      } finally {
        if (purchase.pendingCompletePurchase) {
          await _iap.completePurchase(purchase);
        }
        emit(state.copyWith(isPurchasing: false));
      }
    } else if (purchase.status == PurchaseStatus.error) {
      AppSnackbar.showError('Purchase failed: ${purchase.error?.message}');
      emit(state.copyWith(isPurchasing: false));
    }
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
