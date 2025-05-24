import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/buy_tickets_dialog.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';
import 'package:joplate/presentation/utils/user_plan_theme.dart';
import 'package:joplate/presentation/widgets/user_plan_badge.dart';

class ProfileBanner extends StatefulWidget {
  const ProfileBanner({
    super.key,
    this.clickable = true,
    this.showUploadButton = true,
    this.userId,
    this.onFollowPressed,
    this.showTicketCount = true,
    this.showBadge = true,
  });

  final bool clickable;
  final bool showUploadButton;
  final String? userId;
  final Function(bool isFollowing)? onFollowPressed;
  final bool showTicketCount;
  final bool showBadge;

  @override
  State<ProfileBanner> createState() => _ProfileBannerState();
}

class _ProfileBannerState extends State<ProfileBanner> {
  late final Stream<UserProfile?> userStream;
  late final Stream<UserPlans> userPlansStream;
  late final Stream<int> followersCountStream;
  late final Stream<bool>? followingStatusStream;
  String? _currentUserId;

  @override
  void initState() {
    super.initState();
    _currentUserId = FirebaseAuth.instance.currentUser?.uid;

    final profileId = widget.userId ?? _currentUserId;

    userStream = FirebaseFirestore.instance
        .collection(userProfileCollectionId)
        .doc(profileId)
        .snapshots()
        .map((snapshot) => snapshot.data() == null ? UserProfile.empty() : UserProfile.fromJson(snapshot.data()!));

    userPlansStream = FirebaseFirestore.instance
        .collection(userPlansCollectionId)
        .doc(profileId)
        .snapshots()
        .map((snapshot) => snapshot.exists ? UserPlans.fromJson(snapshot.data()!) : UserPlans.freePlan());

    // Create a stream for followers count
    if (profileId != null) {
      followersCountStream = FirebaseFirestore.instance
          .collection(userProfileCollectionId)
          .where('followingList', arrayContains: profileId)
          .snapshots()
          .map((snapshot) => snapshot.docs.length);

      // Create a stream for following status
      if (_currentUserId != null && profileId != _currentUserId) {
        followingStatusStream = FirebaseFirestore.instance
            .collection(userProfileCollectionId)
            .doc(_currentUserId)
            .snapshots()
            .map((snapshot) {
          if (!snapshot.exists || snapshot.data() == null) return false;
          final data = snapshot.data()!;
          if (data['followingList'] == null) return false;
          final followingList = List<String>.from(data['followingList']);
          return followingList.contains(profileId);
        });
      } else {
        followingStatusStream = null;
      }
    } else {
      // Fallback if no user ID (shouldn't happen in normal usage)
      followersCountStream = Stream.value(0);
      followingStatusStream = null;
    }
  }

  bool _isCurrentUser() {
    return widget.userId == null || widget.userId == _currentUserId;
  }

  Future<void> _followUser(String targetUserId) async {
    if (_currentUserId == null) {
      AppSnackbar.showError('You must be logged in to follow users');
      return;
    }

    // Don't follow yourself
    if (_currentUserId == targetUserId) return;

    try {
      // Direct Firestore update to follow user
      await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId).update({
        'followingList': FieldValue.arrayUnion([targetUserId])
      });

      AppSnackbar.showSuccess('Following user successfully');
    } catch (e) {
      AppSnackbar.showError('Failed to follow user: $e');
    }
  }

  Future<void> _unfollowUser(String targetUserId) async {
    if (_currentUserId == null) {
      AppSnackbar.showError('You must be logged in to unfollow users');
      return;
    }

    try {
      // Direct Firestore update to unfollow user
      await FirebaseFirestore.instance.collection(userProfileCollectionId).doc(_currentUserId).update({
        'followingList': FieldValue.arrayRemove([targetUserId])
      });

      AppSnackbar.showSuccess('Unfollowed user successfully');
    } catch (e) {
      AppSnackbar.showError('Failed to unfollow user: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final m = Localization.of(context);
    return StreamBuilder(
        stream: userStream,
        builder: (context, snapshot) {
          final profile = snapshot.data;
          print(profile?.id);
          return GestureDetector(
            onTap: () {
              if (widget.clickable) {
                if (_isCurrentUser()) {
                  AutoRouter.of(context).push(const AccountRoute());
                } else {
                  // Navigate to user profile
                  AutoRouter.of(context).push(UserProfileRoute(userId: widget.userId!));
                }
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

                  final userId = widget.userId ?? _currentUserId;

                  // Conditionally add follow button
                  Widget? followButton;
                  if (!_isCurrentUser() && _currentUserId != null && followingStatusStream != null) {
                    followButton = StreamBuilder<bool>(
                        stream: followingStatusStream,
                        builder: (context, followingSnapshot) {
                          final isFollowing = followingSnapshot.data ?? false;
                          final isLoading = followingSnapshot.connectionState == ConnectionState.waiting;

                          return ElevatedButton(
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (isFollowing) {
                                      _unfollowUser(userId!);
                                    } else {
                                      _followUser(userId!);
                                    }
                                    widget.onFollowPressed?.call(isFollowing);
                                  },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: isFollowing ? const Color(0xFF981C1E) : Colors.white70,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            ),
                            child: Text(
                              isFollowing ? m.common.following : m.common.follow,
                              style: TextStyle(
                                color: isFollowing ? Colors.white : Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          );
                        });
                  }

                  return Container(
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ProfilePictureWidget(
                              imageUrl: profile?.imageUrl,
                              showUploadButton: widget.showUploadButton && _isCurrentUser(),
                              size: 100,
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          profile?.displayName ?? 'Guest',
                                          style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: textColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      if ((profile?.isVerified ?? false))
                                        Icon(Icons.verified, color: Colors.blue.shade600)
                                      else if ((profile?.pendingVerification ?? false))
                                        Icon(Icons.verified, color: Colors.grey.shade600),
                                      if (widget.showBadge)
                                        UserPlanBadge(plan: plan)
                                    ],
                                  ),
                                  // if (!widget.showTicketCount && plan != PlanType.free_plan) ...[
                                  //   const SizedBox(height: 6),
                                  //   Container(
                                  //     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  //     decoration: BoxDecoration(
                                  //       color: accentColor,
                                  //       borderRadius: BorderRadius.circular(12),
                                  //     ),
                                  //     child: Text(
                                  //       plansSnapshot.data?.plan.name ?? PlanType.free_plan.name,
                                  //       style: const TextStyle(
                                  //         fontSize: 12,
                                  //         color: Colors.white,
                                  //         fontWeight: FontWeight.w600,
                                  //       ),
                                  //       overflow: TextOverflow.ellipsis,
                                  //     ),
                                  //   ),
                                  // ],
                                  const SizedBox(height: 10),
                                  if (widget.showTicketCount)
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
                                        if (_isCurrentUser())
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
                                            const PlanIcon(
                                                size: 30, color: Color(0xFFD4AF37), borderColor: Colors.black),
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
                            followButton ??
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 22,
                                  color: iconColor,
                                ),
                          ],
                        ),

                        // Followers and Following counts
                        const SizedBox(height: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                          decoration: BoxDecoration(
                            color: accentColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              StreamBuilder<int>(
                                  stream: followersCountStream,
                                  builder: (context, snapshot) {
                                    final count = snapshot.hasData ? snapshot.data! : 0;
                                    final isLoading = snapshot.connectionState == ConnectionState.waiting;

                                    return _buildCountColumn(
                                      context,
                                      isLoading ? -1 : count,
                                      'Followers',
                                      textColor,
                                      () {
                                        if (!isLoading && count > 0 && userId != null) {
                                          AutoRouter.of(context).push(FollowersRoute(userId: userId));
                                        }
                                      },
                                    );
                                  }),
                              StreamBuilder<UserProfile?>(
                                  stream: userStream,
                                  builder: (context, snapshot) {
                                    final profile = snapshot.data;
                                    final followingCount = profile?.followingList.length ?? 0;
                                    final isLoading = snapshot.connectionState == ConnectionState.waiting;

                                    return _buildCountColumn(
                                      context,
                                      isLoading ? -1 : followingCount,
                                      'Following',
                                      textColor,
                                      () {
                                        if (!isLoading && followingCount > 0 && userId != null) {
                                          AutoRouter.of(context).push(FollowingRoute(userId: userId));
                                        }
                                      },
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          );
        });
  }

  Widget _buildCountColumn(
    BuildContext context,
    int count,
    String label,
    Color textColor,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            count < 0 ? "..." : count.toString(),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: textColor.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}
