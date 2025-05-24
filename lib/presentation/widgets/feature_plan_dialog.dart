import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/ticket_plan.dart';
import 'package:joplate/presentation/cubits/iap_cubit.dart';
import 'package:joplate/presentation/cubits/iap_state.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/buy_tickets_dialog.dart';

const kAccent = Color(0xFF981C1E);
const kGold = Color(0xFFFFC107);

class FeaturePlanDialog extends StatefulWidget {
  const FeaturePlanDialog({
    super.key,
    required this.listingId,
    required this.itemType,
  });

  final String listingId;
  final ItemType itemType;

  @override
  State<FeaturePlanDialog> createState() => _FeaturePlanDialogState();
}

class _FeaturePlanDialogState extends State<FeaturePlanDialog> {
  int current = 0;
  bool isLoading = true;

  late final Stream<List<TicketPlan>> plansStream;

  @override
  void initState() {
    super.initState();
    plansStream = FirebaseFirestore.instance
        .collection(featuredPlansCollectionId)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TicketPlan.fromJson(doc.data()))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: StreamBuilder<List<TicketPlan>>(
        stream: plansStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CircularProgressIndicator(),
                  const SizedBox(height: 16),
                  Text(m.promote.loading),
                ],
              ),
            );
          }

          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 48),
                  const SizedBox(height: 16),
                  Text(m.common.promotion_failed),
                ],
              ),
            );
          }

          final plans = snapshot.data!;
          if (plans.isEmpty) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.info_outline, color: Colors.blue, size: 48),
                  const SizedBox(height: 16),
                  Text(m.common.no_plans_available),
                ],
              ),
            );
          }

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CarouselSlider.builder(
                itemCount: plans.length,
                options: CarouselOptions(
                  height: 300,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                  autoPlay: true,
                  onPageChanged: (i, __) => setState(() => current = i),
                ),
                itemBuilder: (_, i, __) => TicketCard(
                  plan: plans[i],
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  plans.length,
                  (i) => Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: current == i ? kAccent : kAccent.withOpacity(0.3),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: BlocBuilder<IAPCubit, IAPState>(
                  builder: (context, state) {
                    final isPurchasing = state.isPurchasing;
                    final plan = plans[current];
                    final productId = plan.productId;
                    final isButtonEnabled = !isPurchasing && (productId != null && productId.isNotEmpty);

                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kGold,
                        minimumSize: const Size.fromHeight(50),
                        elevation: 0,
                        textStyle: const TextStyle(color: Colors.white),
                        disabledBackgroundColor: kGold.withOpacity(0.5),
                      ),
                      onPressed: isButtonEnabled
                          ? () {
                              if (productId.isEmpty) {
                                AppSnackbar.showError(m.common.missing_product_id);
                                return;
                              }

                              context.read<IAPCubit>()
                                ..setPromotionContext(
                                  listingId: widget.listingId,
                                  itemType: widget.itemType.name,
                                )
                                ..purchaseProduct(productId, context);
                            }
                          : null,
                      child: isPurchasing
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.0,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(m.promote.purchasing),
                              ],
                            )
                          : Text(
                              m.promote.make_featured,
                              style: const TextStyle(color: Colors.white),
                            ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}
