import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_notifications.dart';
import 'package:joplate/presentation/widgets/notification_item.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Stream<UserNotifications>? _notificationsStream;

  @override
  void initState() {
    super.initState();
    _initializeNotificationsStream();
  }

  void _initializeNotificationsStream() {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      _notificationsStream = _firestore
          .collection(userNotificationsCollectionId)
          .doc(currentUser.uid)
          .snapshots()
          .map((snapshot) => UserNotifications.fromSnapshot(snapshot));
    }
  }

  Future<void> _markAsRead(String notificationId) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final userNotificationsRef = _firestore
            .collection(userNotificationsCollectionId)
            .doc(currentUser.uid);

        // Get current notifications
        final snapshot = await userNotificationsRef.get();
        if (!snapshot.exists) return;

        final userNotifications = UserNotifications.fromSnapshot(snapshot);
        final updatedNotifications = userNotifications.notificationsList.map((notification) {
          if (notification.notificationId == notificationId) {
            return notification.copyWith(read: true);
          }
          return notification;
        }).toList();

        // Update the document
        await userNotificationsRef.update({
          'notificationsList': updatedNotifications.map((n) => n.toJson()).toList(),
        });
      }
    } catch (e) {
      debugPrint('Error marking notification as read: $e');
    }
  }

  Future<void> _markAllAsRead() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        final userNotificationsRef = _firestore.collection(userNotificationsCollectionId).doc(currentUser.uid);

        // Get current notifications
        final snapshot = await userNotificationsRef.get();
        if (!snapshot.exists) return;

        final userNotifications = UserNotifications.fromSnapshot(snapshot);
        final updatedNotifications =
            userNotifications.notificationsList.map((notification) => notification.copyWith(read: true)).toList();

        // Update the document
        await userNotificationsRef.update({
          'notificationsList': updatedNotifications.map((n) => n.toJson()).toList(),
        });
      }
    } catch (e) {
      debugPrint('Error marking all notifications as read: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = _auth.currentUser;
    if (currentUser == null) {
      return const Scaffold(
        body: Center(
          child: Text('Please sign in to view notifications'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            onPressed: _markAllAsRead,
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: StreamBuilder<UserNotifications>(
        stream: _notificationsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading notifications: ${snapshot.error}'));
          }

          final userNotifications = snapshot.data ?? UserNotifications.empty();
          final notifications = userNotifications.notificationsList;

          if (notifications.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications_none, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No notifications yet',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'We\'ll notify you when something happens',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  )
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final notification = notifications[index];
              return NotificationItem(
                notification: notification,
                onMarkAsRead: () => _markAsRead(notification.notificationId),
              );
            },
          );
        },
      ),
    );
  }
}
