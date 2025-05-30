import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/domain/entities/user_notifications.dart';
import 'package:joplate/presentation/widgets/notification_item.dart';
import 'package:rxdart/rxdart.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  Stream<List<UserNotification>>? _notificationsStream;

  @override
  void initState() {
    super.initState();
    _initializeNotificationsStream();
  }

  void _initializeNotificationsStream() {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      // Combine streams from both collections
      _notificationsStream = Rx.combineLatest2(
        // User notifications stream
        _firestore.collection(userNotificationsCollectionId).doc(currentUser.uid).snapshots().map((snapshot) {
          if (snapshot.exists) {
            final userNotifications = UserNotifications.fromSnapshot(snapshot);
            // Mark all notifications as read when first loaded
            if (userNotifications.notificationsList.any((n) => !n.read)) {
              snapshot.reference.update({
                'notificationsList':
                    userNotifications.notificationsList.map((n) => n.copyWith(read: true).toJson()).toList(),
              });
            }
            return userNotifications.notificationsList;
          }
          return <UserNotification>[];
        }),
        // Anonymous notifications stream
        _firestore
            .collection(anonymousNotificationsCollectionId)
            .snapshots()
            .map((snapshot) => snapshot.docs.map((doc) => UserNotification.fromSnapshot(doc)).toList()),
        // Combine and sort both lists
        (List<UserNotification> userNotifications, List<UserNotification> anonymousNotifications) {
          final allNotifications = [...userNotifications, ...anonymousNotifications];
          // Sort by timestamp in descending order
          allNotifications.sort((a, b) {
            final aTime = a.timestamp ?? DateTime(1970);
            final bTime = b.timestamp ?? DateTime(1970);
            return bTime.compareTo(aTime);
          });
          return allNotifications;
        },
      );
    }
  }

  Future<void> _markAsRead(String notificationId) async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        // Check user notifications collection
        final userNotificationsRef = _firestore.collection(userNotificationsCollectionId).doc(currentUser.uid);

        final userSnapshot = await userNotificationsRef.get();
        if (userSnapshot.exists) {
          final userNotifications = UserNotifications.fromSnapshot(userSnapshot);
          final updatedNotifications = userNotifications.notificationsList.map((notification) {
            if (notification.notificationId == notificationId) {
              return notification.copyWith(read: true);
            }
            return notification;
          }).toList();

          await userNotificationsRef.update({
            'notificationsList': updatedNotifications.map((n) => n.toJson()).toList(),
          });
        }
      }
    } catch (e) {
      debugPrint('Error marking notification as read: $e');
    }
  }

  Future<void> _markAllAsRead() async {
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        // Mark all user notifications as read
        final userNotificationsRef = _firestore.collection(userNotificationsCollectionId).doc(currentUser.uid);

        final userSnapshot = await userNotificationsRef.get();
        if (userSnapshot.exists) {
          final userNotifications = UserNotifications.fromSnapshot(userSnapshot);
          final updatedNotifications =
              userNotifications.notificationsList.map((notification) => notification.copyWith(read: true)).toList();

          await userNotificationsRef.update({
            'notificationsList': updatedNotifications.map((n) => n.toJson()).toList(),
          });
        }
      }
    } catch (e) {
      debugPrint('Error marking all notifications as read: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: StreamBuilder<List<UserNotification>>(
        stream: _notificationsStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading notifications: ${snapshot.error}'));
          }

          final notifications = snapshot.data ?? [];

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
