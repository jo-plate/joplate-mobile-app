import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/notification_item.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/data/services/fcm_service.dart';

@RoutePage()
class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  final _fcmService = injector<FCMService>();

  Stream<List<UserNotification>>? _notificationsStream;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeNotificationsStream();
  }

  Future<void> _initializeNotificationsStream() async {
    setState(() => _isLoading = true);
    try {
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        _notificationsStream =
            _firestore.collection(userNotificationsCollectionId).doc(currentUser.uid).snapshots().map((snapshot) {
          if (!snapshot.exists) return [];
          final data = snapshot.data();
          if (data == null) return [];

          final notificationsList = (data['notificationsList'] as List<dynamic>?) ?? [];
          return notificationsList
              .map((notification) => UserNotification.fromJson({
                    'notificationId': notification['notificationId'],
                    ...notification,
                  }))
              .toList();
        });
      }
    } catch (e) {
      debugPrint('Error initializing notifications stream: $e');
      _notificationsStream = Stream.value([]); // Empty stream on error
    } finally {
      setState(() => _isLoading = false);
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

        final data = snapshot.data();
        if (data == null) return;

        final notificationsList = (data['notificationsList'] as List<dynamic>?) ?? [];

        // Find and update the notification
        final updatedNotifications = notificationsList.map((notification) {
          if (notification['notificationId'] == notificationId) {
            return {...notification, 'read': true};
          }
          return notification;
        }).toList();

        // Update the document
        await userNotificationsRef.update({
          'notificationsList': updatedNotifications,
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

        final data = snapshot.data();
        if (data == null) return;

        final notificationsList = (data['notificationsList'] as List<dynamic>?) ?? [];

        // Mark all notifications as read
        final updatedNotifications = notificationsList.map((notification) {
          return {...notification, 'read': true};
        }).toList();

        // Update the document
        await userNotificationsRef.update({
          'notificationsList': updatedNotifications,
        });
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
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : StreamBuilder<List<UserNotification>>(
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
