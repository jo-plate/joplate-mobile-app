import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_profile.dart';

class VerifiedBadge extends StatelessWidget {
  final UserProfile? profile;
  final double size;

  const VerifiedBadge({
    super.key,
    required this.profile,
    this.size = 16,
  });

  @override
  Widget build(BuildContext context) {
    if (profile?.isVerified ?? false) {
      return Icon(
        Icons.verified,
        size: size,
        color: Colors.blue.shade600,
      );
    }

    if (profile?.id == FirebaseAuth.instance.currentUser?.uid && (profile?.pendingVerification ?? false)) {
      return Icon(
        Icons.verified,
        size: size,
        color: Colors.grey.shade600,
      );
    }

    return const SizedBox.shrink();
  }
}
