import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/ticket_plan.dart';
import 'package:joplate/presentation/cubits/iap_cubit.dart';
import 'package:joplate/presentation/cubits/iap_state.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';

const kDialogBG = Color.fromARGB(255, 255, 255, 255);
const kCardBG = Color(0xFFFFFFFF);
const kAccent = Color(0xFF981C1E);
const kGold = Color(0xFFFFC107);

class BuyTicketsDialog extends StatefulWidget {
  const BuyTicketsDialog({super.key});

  @override
  State<BuyTicketsDialog> createState() => _BuyTicketsDialogState();
}

class _BuyTicketsDialogState extends State<BuyTicketsDialog> {
  int current = 0;
  late final Stream<List<TicketPlan>> plansStream;
  final _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    _logDialogOpened();

    plansStream = FirebaseFirestore.instance
        .collection(normalTicketsPackagesCollectionId)
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => TicketPlan.fromJson(doc.data())).toList()
              ..sort((a, b) => a.amount.compareTo(b.amount)));
  }

  void _logDialogOpened() {
    _analytics.logEvent(
      name: 'buy_tickets_dialog_opened',
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logPlanSelected(TicketPlan plan) {
    _analytics.logEvent(
      name: 'ticket_plan_selected',
      parameters: {
        'plan_amount': plan.amount,
        'plan_price': plan.price,
        'product_id': plan.productId ?? '',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logPurchaseAttempt(TicketPlan plan) {
    _analytics.logEvent(
      name: 'ticket_purchase_attempted',
      parameters: {
        'plan_amount': plan.amount,
        'plan_price': plan.price,
        'product_id': plan.productId ?? '',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  void _logPurchaseError(String error) {
    _analytics.logEvent(
      name: 'ticket_purchase_error',
      parameters: {
        'error': error,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kDialogBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
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
              return BlocBuilder<IAPCubit, IAPState>(
                builder: (context, state) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CarouselSlider.builder(
                        itemCount: plans.length,
                        options: CarouselOptions(
                          height: 270,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (i, __) {
                            setState(() => current = i);
                            _logPlanSelected(plans[i]);
                          },
                        ),
                        itemBuilder: (_, i, __) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          child: TicketCard(
                            plan: plans[i],
                            icon: const PlanIcon(
                                size: 32,
                                color: Colors.white,
                                borderColor: Colors.black),
                          ),
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
                              color: current == i
                                  ? kAccent
                                  : kAccent.withOpacity(0.3),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: ElevatedButton(
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
                                    _logPurchaseError("Product ID not found");
                                    AppSnackbar.showError(
                                        "Product ID not found");
                                    return;
                                  }

                                  _logPurchaseAttempt(plan);
                                  context
                                      .read<IAPCubit>()
                                      .purchaseProduct(productId, context);
                                },
                          child: state.isPurchasing
                              ? const CircularProgressIndicator()
                              : const Text(
                                  'اشترِ الآن',
                                  style: TextStyle(color: Colors.white),
                                ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.plan,
    this.icon,
  });

  final TicketPlan plan;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCardBG,
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kCardBG,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (icon != null) 
              icon!,
            const SizedBox(height: 12),
            Text(
              '${plan.amount} Tickets',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'JOD ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  TextSpan(
                    text: '${plan.price}',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: kAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
