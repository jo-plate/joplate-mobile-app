import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/data/services/fcm_service.dart';
import 'package:joplate/presentation/utils/strings.dart';

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
      _notificationsStream = await _fcmService.getNotificationsStream();
      _markAllAsRead();
    } catch (e) {
      debugPrint('Error initializing notifications stream: $e');
      _notificationsStream = Stream.value([]); // Empty stream on error
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

                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      elevation: notification.read ? 1 : 3,
                      color: notification.read ? null : Theme.of(context).colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: notification.read
                            ? BorderSide.none
                            : BorderSide(
                                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                                width: 1,
                              ),
                      ),
                      child: InkWell(
                        onTap: () async {
                          _markAsRead(notification.notificationId);

                          // Navigate based on notification type
                          if (notification.type == 'plate_listing' && notification.targetId != null) {
                            AutoRouter.of(context).push(PlatesDetailsRoute(listingId: notification.targetId!));
                          } else if (notification.type == 'phone_listing' && notification.targetId != null) {
                            AutoRouter.of(context).push(PhoneDetailsRoute(listingId: notification.targetId!));
                          } else if (notification.type == 'user_profile' && notification.targetId != null) {
                            AutoRouter.of(context).push(UserProfileRoute(userId: notification.targetId!));
                          } else if (notification.type == 'plate_request' && notification.targetId != null) {
                            AutoRouter.of(context).push(PlateRequestDetailsRoute(requestId: notification.targetId!));
                          } else if (notification.type == 'phone_request' && notification.targetId != null) {
                            AutoRouter.of(context)
                                .push(PhoneRequestDetailsRoute(phoneNumberRequestId: notification.targetId!));
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
                                  if (!notification.read)
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
                                      notification.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: notification.read ? FontWeight.normal : FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    notification.timestamp != null
                                        ? formatCreatedAt(notification.timestamp!, context)
                                        : '',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ],
                              ),
                              if (notification.body.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    notification.body,
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
}
