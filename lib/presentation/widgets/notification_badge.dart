import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/routes/router.dart';

class NotificationBadge extends StatelessWidget {
  final VoidCallback? onPressed;

  const NotificationBadge({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseAuth.instance.currentUser != null
          ? FirebaseFirestore.instance
              .collection(userProfileCollectionId)
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection(userNotificationsCollectionId)
              .where('read', isEqualTo: false)
              .snapshots()
          : null,
      builder: (context, snapshot) {
        final count = snapshot.hasData ? snapshot.data!.docs.length : 0;

        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: onPressed ?? () => AutoRouter.of(context).push(const NotificationsRoute()),
              tooltip: 'Notifications',
            ),
            if (count > 0)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF981C1E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    count > 99 ? '99+' : count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
