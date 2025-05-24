import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';
import 'package:joplate/presentation/widgets/user_plan_badge.dart';
import 'package:joplate/presentation/widgets/verified_badge.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joplate/data/constants.dart';

class UserListItem extends StatelessWidget {
  final UserProfile user;
  final VoidCallback? onTap;
  final VoidCallback? onFollowPressed;
  final bool isFollowing;
  final bool showPlanBadge;

  const UserListItem({
    super.key,
    required this.user,
    this.onTap,
    this.onFollowPressed,
    this.isFollowing = false,
    this.showPlanBadge = false,
  });

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            ProfilePictureWidget(
              imageUrl: user.imageUrl,
              size: 50,
              showUploadButton: false,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                user.displayName,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 4),
                              VerifiedBadge(
                                profile: user,
                                size: 16,
                              ),
                              const SizedBox(width: 6),
                              StreamBuilder<UserPlans>(
                                stream: FirebaseFirestore.instance
                                    .collection(userPlansCollectionId)
                                    .doc(user.id)
                                    .snapshots()
                                    .map((snapshot) => UserPlans.fromJson(snapshot.data()!)),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return const SizedBox.shrink();
                                  }
                                  return UserPlanBadge(
                                    plan: snapshot.data!.plan,
                                    size: 14,
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (onFollowPressed != null)
              ElevatedButton(
                onPressed: onFollowPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFollowing ? const Color(0xFF981C1E) : Colors.white70,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  minimumSize: Size.zero,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                child: Text(
                  isFollowing ? m.common.following : m.common.follow,
                  style: TextStyle(
                    color: isFollowing ? Colors.white : const Color(0xFF981C1E),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
