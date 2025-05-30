import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/user_plan_theme.dart';
import 'package:joplate/presentation/widgets/contact_buttons_row.dart';
import 'package:joplate/presentation/widgets/disclaimer_widget.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';
import 'package:joplate/presentation/widgets/user_plan_badge.dart';
import 'package:joplate/presentation/widgets/verified_badge.dart';

class UserDetailsWidget extends StatefulWidget {
  const UserDetailsWidget({
    super.key,
    required this.userId,
    this.visits,
    this.title,
    this.showVisits = false,
    this.showDisclaimer = false,
  });

  final String userId;
  final int? visits;
  final String? title;
  final bool showVisits;
  final bool showDisclaimer;

  @override
  State<UserDetailsWidget> createState() => _UserDetailsWidgetState();
}

class _UserDetailsWidgetState extends State<UserDetailsWidget> {
  late final Stream<UserProfile> userProfileStream;
  late final Stream<UserPlans> userPlansStream;

  @override
  void initState() {
    super.initState();
    userProfileStream =
        FirebaseFirestore.instance.collection(userProfileCollectionId).doc(widget.userId).snapshots().map((snapshot) {
      return UserProfile.fromSnapshot(snapshot);
    });

    userPlansStream = FirebaseFirestore.instance
        .collection(userPlansCollectionId)
        .doc(widget.userId)
        .snapshots()
        .map((snapshot) => snapshot.exists ? UserPlans.fromJson(snapshot.data()!) : UserPlans.freePlan());
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return StreamBuilder<UserPlans>(
      stream: userPlansStream,
      builder: (context, plansSnapshot) {
        final plan = plansSnapshot.data?.plan ?? PlanType.free_plan;
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Container(
          padding: const EdgeInsets.all(16.0),
          decoration: UserPlanTheme.getSellerContainerStyle(context, plan),
          child: StreamBuilder<UserProfile>(
              stream: userProfileStream,
              builder: (context, snapshot) {
                final userProfile = snapshot.data;
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (userProfile == null) {
                  return const Text('User not found');
                }

                final textColor = UserPlanTheme.getTextColor(plan, isDarkMode: isDark);
                final accentColor = UserPlanTheme.getAccentColor(plan, isDarkMode: isDark);
                final iconColor = UserPlanTheme.getIconColor(plan, isDarkMode: isDark);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.showVisits &&
                        widget.visits != null &&
                        widget.userId != FirebaseAuth.instance.currentUser?.uid) ...[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(text: '${m.home.visits}: '),
                            TextSpan(text: widget.visits.toString()),
                          ],
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (widget.showDisclaimer) ...[
                      DisclaimerWidget(textColor: textColor, iconColor: iconColor),
                      const SizedBox(height: 32),
                    ],
                    if (widget.title != null) ...[
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: accentColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.person_outline,
                              color: iconColor,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            widget.title!,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: textColor,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        enableFeedback: true,
                        onTap: () {
                          AutoRouter.of(context).push(UserProfileRoute(userId: widget.userId));
                        },
                        child: Row(
                          children: [
                            ProfilePictureWidget(
                              imageUrl: userProfile.imageUrl,
                              size: 50,
                              showUploadButton: false,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        userProfile.displayName,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: textColor,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      if (userProfile.isVerified)
                                        VerifiedBadge(
                                          profile: userProfile,
                                          size: 20,
                                        ),
                                      const SizedBox(width: 8),
                                      UserPlanBadge(plan: plan),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: textColor.withOpacity(0.6),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ContactButtonsRow(phoneNumber: userProfile.phonenumber),
                  ],
                );
              }),
        );
      },
    );
  }
}
