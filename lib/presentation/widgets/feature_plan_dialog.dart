import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/ticket_plan.dart';
import 'package:joplate/presentation/cubits/iap_cubit.dart';
import 'package:joplate/presentation/cubits/iap_state.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/buy_tickets_dialog.dart';

const kDialogBG = Color.fromARGB(255, 255, 255, 255);
const kCardBG = Color(0xFFFFFFFF);
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

  late final Stream<List<TicketPlan>> plansStream;

  @override
  void initState() {
    super.initState();
    plansStream = FirebaseFirestore.instance
        .collection(featuredPlansCollectionId) // collection name in Firestore
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TicketPlan.fromJson(doc.data()))
            .toList());
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kDialogBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: StreamBuilder<List<TicketPlan>>(
        stream: plansStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final plans = snapshot.data!;
          if (plans.isEmpty) {
            return const Center(child: Text('No plans available.'));
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
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kGold,
                        minimumSize: const Size.fromHeight(50),
                        elevation: 0,
                        textStyle: const TextStyle(color: Colors.white),
                      ),
                      onPressed: state.isPurchasing
                          ? null
                          : () {
                              final plan = plans[current];
                              final productId = plan.productId;
                              if (productId == null || productId.isEmpty) {
                                AppSnackbar.showError('Missing product ID');
                                return;
                              }

                              context.read<IAPCubit>()
                                ..setPromotionContext(
                                  listingId: widget.listingId,
                                  itemType: widget.itemType.name,
                                )
                                ..purchaseProduct(productId, context);
                            },
                      child: state.isPurchasing
                          ? const CircularProgressIndicator()
                          : const Text(
                              'اجعلها مميزة',
                              style: TextStyle(color: Colors.white),
                            ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
