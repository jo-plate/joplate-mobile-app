import 'dart:io' show Platform;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:joplate/domain/entities/plan.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';

class PlanWidget extends StatelessWidget {
  PlanWidget({
    super.key,
    required this.plan,
    this.isSmallCard = false,
  });

  final Plan plan;
  final bool isSmallCard;
  final _analytics = FirebaseAnalytics.instance;

  void _logPlanInteraction() {
    _analytics.logEvent(
      name: 'plan_interaction',
      parameters: {
        'plan_name': plan.displayName,
        'plan_price': plan.price,
        'product_id': plan.productId,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logPurchaseAttempt() {
    _analytics.logEvent(
      name: 'plan_purchase_attempt',
      parameters: {
        'plan_name': plan.displayName,
        'plan_price': plan.price,
        'product_id': plan.productId,
        'platform': Platform.isIOS ? 'ios' : 'android',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logPurchaseError(String error) {
    _analytics.logEvent(
      name: 'plan_purchase_error',
      parameters: {
        'plan_name': plan.displayName,
        'plan_price': plan.price,
        'product_id': plan.productId,
        'error': error,
        'platform': Platform.isIOS ? 'ios' : 'android',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _buyProduct() async {
    _logPurchaseAttempt();

    if (plan.productId.trim().isEmpty) {
      _logPurchaseError('No product ID available');
      AppSnackbar.showError("No product ID available for this platform.");
      return;
    }
    try {
      final isAvailable = await InAppPurchase.instance.isAvailable();
      if (!isAvailable) {
        _logPurchaseError('IAP not available');
        AppSnackbar.showError("In-app purchases not available.");
        return;
      }
    } catch (e) {
      _logPurchaseError('IAP availability check failed: $e');
      debugPrint("❌ IAP Error: $e");
      AppSnackbar.showError("Error checking IAP availability: $e");
      return;
    }

    final response = await InAppPurchase.instance.queryProductDetails({plan.productId});
    if (response.notFoundIDs.isNotEmpty || response.productDetails.isEmpty) {
      _logPurchaseError('Product not found');
      AppSnackbar.showError("Product not found.");
      return;
    }

    final productDetails = response.productDetails.first;
    final purchaseParam = PurchaseParam(productDetails: productDetails);

    InAppPurchase.instance.buyConsumable(purchaseParam: purchaseParam);
  }

  @override
  Widget build(BuildContext context) {
    _logPlanInteraction();
    final isEn = injector<LocalizationCubit>().state.languageCode == "en";
    final m = Localization.of(context);

    return isSmallCard ? _buildSmallCard(context, isEn, m) : _buildLargeCard(context, isEn, m);
  }

  Widget _buildSmallCard(BuildContext context, bool isEn, dynamic m) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [plan.color.withAlpha(170), plan.color.withAlpha(130), plan.color.withAlpha(255)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Center(
              child: PlanIcon(size: 40, color: plan.color),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Text(
                      plan.displayName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  if (plan.price > 0)
                    Expanded(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: plan.price.toDouble().toString(),
                          style: const TextStyle(
                            fontFamily: 'Mandatory',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF981C1E),
                            fontSize: 18.0,
                          ),
                          children: const [
                            TextSpan(
                              text: " / \$",
                              style: TextStyle(
                                fontFamily: 'Mandatory',
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                                fontSize: 14.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  else
                    const Text(
                      "Free",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                  Divider(
                    color: Colors.grey[400],
                    thickness: 1,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Show only the first 2 active perks in small card
                          if (isEn)
                            ...plan.activePerks.take(2).map((perk) => _buildSmallPerk(perk, true))
                          else
                            ...plan.activePerksAr.take(2).map((perk) => _buildSmallPerk(perk, true)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  FilledButton(
                    onPressed: () => _buyProduct(),
                    child: Text(m.iap.purchase),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLargeCard(BuildContext context, bool isEn, dynamic m) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [plan.color.withAlpha(170), plan.color.withAlpha(130), plan.color.withAlpha(255)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PlanIcon(size: 50, color: plan.color),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        plan.displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                        ),
                      ),
                      if (plan.price > 0)
                        RichText(
                          text: TextSpan(
                            text: plan.price.toDouble().toString(),
                            style: const TextStyle(
                              fontFamily: 'Mandatory',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                            children: const [
                              TextSpan(
                                text: " \$",
                                style: TextStyle(
                                  fontFamily: 'Mandatory',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                              )
                            ],
                          ),
                        )
                      else
                        const Text(
                          "Free",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildActivePerks(isEn),
                  _buildDisabledPerks(isEn),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => _buyProduct(),
                    child: Text(m.iap.purchase),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPerk(String perk, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: isActive ? const Color(0xFF981C1E) : Colors.grey,
            size: 26,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              perk,
              style: TextStyle(
                color: isActive ? Colors.black87 : Colors.grey,
                fontSize: 16.0,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSmallPerk(String perk, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: isActive ? const Color(0xFF981C1E) : Colors.grey,
            size: 16,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              perk,
              style: TextStyle(
                color: isActive ? Colors.black87 : Colors.grey,
                fontSize: 12.0,
                fontWeight: isActive ? FontWeight.w500 : FontWeight.w400,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivePerks(bool isEn) {
    if (isEn) {
      if (plan.activePerks.isEmpty) return const SizedBox.shrink();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: plan.activePerks.map((perk) => _buildPerk(perk, true)).toList(),
      );
    } else {
      if (plan.activePerksAr.isEmpty) return const SizedBox.shrink();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: plan.activePerksAr.map((perk) => _buildPerk(perk, true)).toList(),
      );
    }
  }

  Widget _buildDisabledPerks(bool isEn) {
    if (isEn) {
      if (plan.disabledPerks.isEmpty) return const SizedBox.shrink();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: plan.disabledPerks.map((perk) => _buildPerk(perk, false)).toList(),
      );
    } else {
      if (plan.disabledPerksAr.isEmpty) return const SizedBox.shrink();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: plan.disabledPerksAr.map((perk) => _buildPerk(perk, false)).toList(),
      );
    }
  }
}
