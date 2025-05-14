import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/domain/entities/user_profile.dart';

import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/buy_tickets_dialog.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';

class ProfileBanner extends StatefulWidget {
  const ProfileBanner({super.key, this.clickable = true});

  final bool clickable;

  @override
  State<ProfileBanner> createState() => _ProfileBannerState();
}

class _ProfileBannerState extends State<ProfileBanner> {
  late final Stream<UserProfile?> userStream;
  late final Stream<UserPlans> userPlansStream;

  @override
  void initState() {
    super.initState();
    userStream = FirebaseFirestore.instance
        .collection(userProfileCollectionId)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((snapshot) => snapshot.data() == null ? UserProfile.empty() : UserProfile.fromJson(snapshot.data()!));

    userPlansStream = FirebaseFirestore.instance
        .collection(userPlansCollectionId)
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .snapshots()
        .map((snapshot) => UserPlans.fromJson(snapshot.data()!));
  }

  @override
  void dispose() {
    userStream.drain();
    super.dispose();
  }

  Color getAccentColor(PlanType plan) {
    switch (plan) {
      case PlanType.gold_plan:
        return const Color(0xFFD4AF37);
      case PlanType.diamond_plan:
        return const Color(0xff152238);
      default:
        return const Color.fromARGB(255, 153, 31, 22);
    }
  }

  Color getBackgroundColor(PlanType plan) {
    switch (plan) {
      case PlanType.gold_plan:
        return const Color(0xFF2D2A1F);
      case PlanType.diamond_plan:
        return const Color.fromARGB(68, 85, 90, 255);
      default:
        return const Color.fromARGB(255, 255, 214, 214);
    }
  }

  Color getTextColor(PlanType plan) {
    switch (plan) {
      case PlanType.gold_plan:
        return const Color(0xFFD4AF37);
      case PlanType.diamond_plan:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: userStream,
        builder: (context, snapshot) {
          final profile = snapshot.data;
          return GestureDetector(
            onTap: () {
              if (widget.clickable) {
                AutoRouter.of(context).push(const AccountRoute());
              }
            },
            child: StreamBuilder<UserPlans>(
                stream: userPlansStream,
                builder: (context, plansSnapshot) {
                  final plan = plansSnapshot.data?.plan ?? PlanType.free_plan;
                  final textColor = getTextColor(plan);
                  return Container(
                    decoration: BoxDecoration(
                      color: getBackgroundColor(plan),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage('assets/images/avatar3.jpg'),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    profile?.name.isNotEmpty == true
                                        ? profile?.name ?? 'Guest'
                                        : profile?.displayName ?? 'Guest',
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600,
                                      color: textColor,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  if ((profile?.isVerified ?? false))
                                    Icon(Icons.verified, color: Colors.blue.shade600)
                                  else if ((profile?.pendingVerification ?? false))
                                    Icon(Icons.verified, color: Colors.grey.shade600),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: getAccentColor(plan),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      plansSnapshot.data?.plan.name ?? PlanType.free_plan.name,
                                      style: const TextStyle(
                                          fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600),
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const PlanIcon(size: 30, color: Colors.white, borderColor: Colors.black),
                                      const SizedBox(width: 6),
                                      Text(
                                        (plansSnapshot.data?.tickets ?? 0).toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 6),
                                  GestureDetector(
                                      onTap: () => showDialog(
                                            context: context,
                                            builder: (_) => const BuyTicketsDialog(),
                                          ),
                                      child: Icon(
                                        Icons.add_circle_outline,
                                        size: 20,
                                        color: getAccentColor(plan),
                                      )),
                                  const SizedBox(width: 12),
                                  Row(
                                    children: [
                                      const PlanIcon(size: 30, color: Color(0xFFD4AF37), borderColor: Colors.black),
                                      const SizedBox(width: 6),
                                      Text(
                                        (plansSnapshot.data?.goldenTickets ?? 0).toString(),
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          color: textColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 22,
                          color: getAccentColor(plan),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
