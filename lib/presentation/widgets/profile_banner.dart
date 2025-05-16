import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/buy_tickets_dialog.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';
import 'package:joplate/presentation/utils/user_plan_theme.dart';

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
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
                  final textColor = UserPlanTheme.getTextColor(plan, isDarkMode: isDark);
                  final accentColor = UserPlanTheme.getAccentColor(plan, isDarkMode: isDark);
                  final iconColor = UserPlanTheme.getIconColor(plan, isDarkMode: isDark);
                  final backgroundColor = UserPlanTheme.getBackgroundColor(plan, isDarkMode: isDark);

                  return Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ProfilePictureWidget(
                          imageUrl: profile?.imageUrl,
                          showUploadButton: true,
                          size: 100,
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
                                    profile?.displayName ?? 'Guest',
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
                                      color: accentColor,
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
                                        color: iconColor,
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
                          color: iconColor,
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }
}
