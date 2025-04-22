import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';

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
  bool submitting = false;

  final plans = const [
    _Plan(days: 7, price: 9),
    _Plan(days: 14, price: 16),
    _Plan(days: 30, price: 26),
  ];

  Future<void> _activatePlan(_Plan plan) async {
    setState(() => submitting = true);

    final dto = {
      'listingId': widget.listingId,
      'itemType': widget.itemType.name,
      'durationDays': plan.days,
      'amountJOD': plan.price,
    };

    try {
      final callable = FirebaseFunctions.instance.httpsCallable('featureListing');
      await callable.call(dto);

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم تمييز الإعلان بنجاح')),
        );
      }
    } on FirebaseFunctionsException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'فشل الترقية')),
      );
      setState(() => submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kDialogBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CarouselSlider.builder(
              itemCount: plans.length,
              options: CarouselOptions(
                height: 270,
                enlargeCenterPage: true,
                viewportFraction: 0.85,
                onPageChanged: (i, __) => setState(() => current = i),
              ),
              itemBuilder: (_, i, __) => _PlanCard(plan: plans[i]),
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kGold,
                  minimumSize: const Size.fromHeight(50),
                  elevation: 0,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                onPressed: submitting ? null : () => _activatePlan(plans[current]),
                child: submitting
                    ? const CircularProgressIndicator()
                    : const Text(
                        'اجعلها مميزة',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Plan {
  const _Plan({required this.days, required this.price});
  final int days;
  final int price; // JOD
}

class _PlanCard extends StatelessWidget {
  const _PlanCard({required this.plan});
  final _Plan plan;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCardBG,
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: kCardBG,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              plan.days == 7
                  ? 'One Week Featured'
                  : plan.days == 14
                      ? 'Two Weeks Featured'
                      : 'One Month Featured',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 8),
            Text('مدة ${plan.days} يوم', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            Text('JOD', style: TextStyle(fontSize: 14, color: Colors.grey.shade600, letterSpacing: 1.2)),
            Text(
              '${plan.price}',
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w800, color: kAccent),
            ),
          ],
        ),
      ),
    );
  }
}
