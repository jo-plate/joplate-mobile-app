import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/utils/user_plan_theme.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';
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
                  if (showPlanBadge)
                    _buildNameWithPlanBadge(context)
                  else
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            user.displayName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 4),
                        if (user.isVerified)
                          Icon(
                            Icons.verified,
                            size: 16,
                            color: Colors.blue.shade600,
                          ),
                      ],
                    ),
                  // if (user.phonenumber.isNotEmpty) ...[
                  //   const SizedBox(height: 4),
                  //   Text(
                  //     user.,
                  //     style: TextStyle(
                  //       fontSize: 14,
                  //       color: Colors.grey[600],
                  //     ),
                  //   ),
                  // ],
                ],
              ),
            ),
            if (onFollowPressed != null)
              TextButton(
                onPressed: onFollowPressed,
                style: TextButton.styleFrom(
                  backgroundColor: isFollowing ? Colors.grey[200] : Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: Text(
                  isFollowing ? 'Unfollow' : 'Follow',
                  style: TextStyle(
                    color: isFollowing ? Colors.black87 : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildNameWithPlanBadge(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance.collection(userPlansCollectionId).doc(user.id).snapshots(),
      builder: (context, snapshot) {
        PlanType plan = PlanType.free_plan;

        if (snapshot.hasData && snapshot.data!.exists) {
          final data = snapshot.data!.data() as Map<String, dynamic>?;
          if (data != null && data.containsKey('plan')) {
            // Convert string representation to enum
            final planString = data['plan'] as String;
            if (planString == 'gold_plan') {
              plan = PlanType.gold_plan;
            } else if (planString == 'diamond_plan') {
              plan = PlanType.diamond_plan;
            }
          }
        }

        final accentColor = UserPlanTheme.getAccentColor(plan, isDarkMode: isDark);

        return Row(
          children: [
            Flexible(
              child: Text(
                user.displayName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 4),
            if (user.isVerified)
              Icon(
                Icons.verified,
                size: 16,
                color: Colors.blue.shade600,
              ),
            if (plan != PlanType.free_plan) ...[
              const SizedBox(width: 6),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: accentColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  plan.name,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}
