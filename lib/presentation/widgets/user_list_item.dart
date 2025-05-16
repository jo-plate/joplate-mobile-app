import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/widgets/profile_picture_widget.dart';

class UserListItem extends StatelessWidget {
  final UserProfile user;
  final VoidCallback? onTap;
  final VoidCallback? onFollowPressed;
  final bool isFollowing;

  const UserListItem({
    super.key,
    required this.user,
    this.onTap,
    this.onFollowPressed,
    this.isFollowing = false,
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
                  Row(
                    children: [
                      Text(
                        user.displayName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
}
