import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
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

  Stream<QuerySnapshot>? _notificationsStream;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeNotificationsStream();
  }

  Future<void> _initializeNotificationsStream() async {
    setState(() => _isLoading = true);
    try {
      _notificationsStream = await _fcmService.getNotificationsStream();
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _markAsRead(String notificationId) async {
    try {
      await _fcmService.markNotificationAsRead(notificationId);
    } catch (e) {
      // Fallback method if FCM service method fails
      final currentUser = _auth.currentUser;
      if (currentUser != null) {
        await _firestore
            .collection(userProfileCollectionId)
            .doc(currentUser.uid)
            .collection(userNotificationsCollectionId)
            .doc(notificationId)
            .update({'read': true});
      }
    }
  }

  Future<void> _markAllAsRead() async {
    try {
      await _fcmService.markAllNotificationsAsRead();
      setState(() {});
    } catch (e) {
      print('Error marking all notifications as read: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.check_circle_outline),
            onPressed: _markAllAsRead,
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _notificationsStream == null
              ? const Center(
                  child: Text(
                    'Unable to load notifications',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                )
              : StreamBuilder<QuerySnapshot>(
                  stream: _notificationsStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      return Center(child: Text('Error loading notifications: ${snapshot.error}'));
                    }

                    final notifications = snapshot.data?.docs ?? [];

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
                        final data = notification.data() as Map<String, dynamic>;

                        final bool read = data['read'] ?? false;
                        final String title = data['title'] ?? 'Notification';
                        final String body = data['body'] ?? '';
                        final String type = data['type'] ?? 'default';
                        final Timestamp timestamp = data['timestamp'] ?? Timestamp.now();
                        final String? targetId = data['targetId'];

                        return Card(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          elevation: read ? 1 : 3,
                          color: read ? null : Theme.of(context).colorScheme.surface,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: read
                                ? BorderSide.none
                                : BorderSide(
                                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                    width: 1,
                                  ),
                          ),
                          child: InkWell(
                            onTap: () async {
                              // Mark notification as read
                              await _markAsRead(notification.id);

                              // Navigate based on notification type
                              if (type == 'plate_listing' && targetId != null) {
                                AutoRouter.of(context).push(PlatesDetailsRoute(listingId: targetId));
                              } else if (type == 'phone_listing' && targetId != null) {
                                AutoRouter.of(context).push(PhoneDetailsRoute(listingId: targetId));
                              } else if (type == 'user_profile' && targetId != null) {
                                AutoRouter.of(context).push(UserProfileRoute(userId: targetId));
                              }
                            },
                            borderRadius: BorderRadius.circular(12),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      if (!read)
                                        Container(
                                          width: 12,
                                          height: 12,
                                          margin: const EdgeInsets.only(right: 8),
                                          decoration: BoxDecoration(
                                            color: Theme.of(context).colorScheme.primary,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      Expanded(
                                        child: Text(
                                          title,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: read ? FontWeight.normal : FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        _formatTimestamp(timestamp),
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (body.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        body,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
    );
  }

  String _formatTimestamp(Timestamp timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp.toDate());

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
