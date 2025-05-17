import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';
import 'package:joplate/presentation/widgets/promote_prompt_dialog.dart';

class PromoteListingButton extends StatefulWidget {
  const PromoteListingButton({super.key, required this.listingId, required this.itemType});
  final String listingId;
  final ItemType itemType;

  @override
  State<PromoteListingButton> createState() => _PromoteListingButtonState();
}

class _PromoteListingButtonState extends State<PromoteListingButton> {
  late final Stream<UserPlans> _userPlansStream;

  @override
  void initState() {
    super.initState();
    _userPlansStream = FirebaseFirestore.instance
        .collection(userPlansCollectionId)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return UserPlans.fromJson(snapshot.data()!);
      } else {
        return UserPlans.freePlan();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserPlans>(
        stream: _userPlansStream,
        builder: (context, snapshot) {
          return ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow[900],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                builder: (_) => PromotePromptDialog(listingId: widget.listingId, itemType: widget.itemType),
              );
            },
            label: const Text(
              'Promote Listing',
              style: TextStyle(color: Colors.white),
            ),
            icon: (snapshot.data?.goldenTickets ?? 0) == 0
                ? const Icon(
                    Icons.rocket_launch_outlined,
                    color: Colors.white,
                  )
                : const PlanIcon(size: 26, color: Color(0xFFD4AF37), borderColor: Colors.black),
          );
        });
  }
}
