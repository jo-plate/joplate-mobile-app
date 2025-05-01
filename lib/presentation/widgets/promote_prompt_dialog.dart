import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';
import 'feature_plan_dialog.dart';

class PromotePromptDialog extends StatefulWidget {
  const PromotePromptDialog({
    super.key,
    required this.listingId,
    required this.itemType,
  });

  final String listingId;
  final ItemType itemType;

  static const Color _bg = Color(0xFFFAFAFA);
  static const Color _accent = Color(0xFF981C1E);
  static const Color _gold = Color(0xFFFFC107);

  @override
  State<PromotePromptDialog> createState() => _PromotePromptDialogState();
}

class _PromotePromptDialogState extends State<PromotePromptDialog> {
  late final Stream<UserPlans> userPlansStream;

  @override
  void initState() {
    super.initState();
    userPlansStream = FirebaseFirestore.instance
        .collection(userPlansCollectionId)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snapshot) => UserPlans.fromJson(snapshot.data()!));
  }

  bool submitting = false;

  Future<void> _useGoldenTicket() async {
    setState(() => submitting = true);

    final dto = {
      'listingId': widget.listingId,
      'itemType': widget.itemType.name,
      'goldenTicket': true,
    };

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(featureListingCF);
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
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            decoration: BoxDecoration(
              color: PromotePromptDialog._bg,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 14,
                  offset: Offset(0, 6),
                )
              ],
            ),
            child: StreamBuilder<UserPlans>(
              stream: userPlansStream,
              builder: (context, snapshot) {
                final plans = snapshot.data;

                final showGoldenSlide = (plans?.goldenTickets ?? 0) > 0;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      showGoldenSlide ? '✨ ترقية مجانية' : 'بيع أسرع!',
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      showGoldenSlide
                          ? 'احصل على 30 يوم من التمييز مقابل تذكرة ذهبية واحدة.'
                          : 'زد ظهور إعلانك 10 مرات.',
                      style: const TextStyle(fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 28),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: PromotePromptDialog._accent,
                              side: const BorderSide(color: PromotePromptDialog._accent),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: () => Navigator.of(context).pop(),
                            child: const Text('إلغاء'),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: FilledButton(
                            style: FilledButton.styleFrom(
                              backgroundColor: PromotePromptDialog._gold,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            onPressed: submitting
                                ? null
                                : () {
                                    if (!showGoldenSlide) {
                                      Navigator.of(context).pop();
                                      showDialog(
                                        context: context,
                                        builder: (_) => FeaturePlanDialog(
                                          listingId: widget.listingId,
                                          itemType: widget.itemType,
                                        ),
                                      );
                                    } else {
                                      _useGoldenTicket();
                                    }
                                  },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (showGoldenSlide) ...[
                                  const PlanIcon(size: 24, color: Color(0xFFD4AF37), borderColor: Colors.black),
                                  const SizedBox(
                                    width: 2,
                                  )
                                ],
                                const Text('ترقية -1 '),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
          const Positioned(
            top: -32,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 32,
              backgroundColor: PromotePromptDialog._gold,
              child: Icon(Icons.rocket_launch_rounded, size: 36, color: PromotePromptDialog._accent),
            ),
          ),
        ],
      ),
    );
  }
}
