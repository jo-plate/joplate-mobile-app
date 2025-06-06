import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_notifications.dart';
import 'package:joplate/presentation/routes/router.dart';

class NotificationBadge extends StatefulWidget {
  final VoidCallback? onPressed;
  final double iconSize;

  const NotificationBadge({
    super.key,
    this.onPressed,
    this.iconSize = 35,
  });

  @override
  State<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  Stream<UserNotifications>? _notificationsStream;

  @override
  void initState() {
    super.initState();
    if (FirebaseAuth.instance.currentUser != null) {
      _notificationsStream = FirebaseFirestore.instance
          .collection(userNotificationsCollectionId)
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots()
          .map((snapshot) => UserNotifications.fromSnapshot(snapshot));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserNotifications>(
      stream: _notificationsStream,
      builder: (context, snapshot) {
        final count =
            snapshot.hasData ? snapshot.data?.notificationsList.where((notification) => !notification.read).length : 0;
        final isDarkMode = Theme.of(context).brightness == Brightness.dark;
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(count != null && count > 0 ? Icons.notifications_active : Icons.notifications_outlined,
                  size: widget.iconSize, color: isDarkMode ? Colors.white : const Color(0xFF981C1E)),
              onPressed: widget.onPressed ?? () => AutoRouter.of(context).push(const NotificationsRoute()),
              tooltip: 'Notifications',
            ),
            if (count != null && count > 0)
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
