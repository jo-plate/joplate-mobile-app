import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/domain/entities/user_profile.dart';

import 'package:joplate/presentation/routes/router.dart';
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
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 214, 214),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color.fromARGB(255, 180, 37, 27), width: 1),
              ),
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 68,
                        height: 68,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('assets/images/avatar3.jpg'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 153, 31, 22),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Text(
                          'Basic',
                          style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile?.name.isNotEmpty == true ? profile?.name ?? 'Guest' : profile?.displayName ?? 'Guest',
                          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 10),
                        StreamBuilder<UserPlans>(
                            stream: userPlansStream,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              }

                              if (snapshot.hasError) {
                                return const Text('An error occurred');
                              }

                              return Row(
                                children: [
                                  Row(
                                    children: [
                                      const PlanIcon(size: 26, color: Colors.white, borderColor: Colors.black),
                                      const SizedBox(width: 6),
                                      Text((snapshot.data?.tickets ?? 0).toString(),
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  const SizedBox(width: 6),
                                  const Icon(Icons.add_circle_outline, size: 20, color: Color(0xFF981C1E)),
                                  const SizedBox(width: 12),
                                  Row(
                                    children: [
                                      const PlanIcon(size: 30, color: Color(0xFFD4AF37), borderColor: Colors.black),
                                      const SizedBox(width: 6),
                                      Text((snapshot.data?.goldenTickets ?? 0).toString(),
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                  const SizedBox(width: 12),
                                  Row(
                                    children: [
                                      const Icon(Icons.replay, size: 22, color: Color(0xFF981C1E)),
                                      const SizedBox(width: 6),
                                      Text((snapshot.data?.goldenTickets ?? 0).toString(),
                                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, size: 22, color: Colors.brown),
                ],
              ),
            ),
          );
        });
  }
}
