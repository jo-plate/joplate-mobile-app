import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/domain/entities/user_notifications.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/notification_overlay.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:joplate/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _cachedFcmToken;

  Future<void> initialize() async {
    try {
      // Handle iOS-specific APNS token requirements
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        try {
          // Request APNS token first on iOS devices
          final apnsToken = await _firebaseMessaging.getAPNSToken();
          debugPrint('APNS Token: $apnsToken');
        } catch (e) {
          // Handle missing APNS token - continue anyway as it may be available later
          debugPrint('Error getting APNS token: $e');
        }
      }
      
      // Request permission for iOS
      NotificationSettings settings = await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        debugPrint('User granted permission');
      } else {
        debugPrint('User declined permission');
      }

      // Cache FCM token
      _cachedFcmToken = await _firebaseMessaging.getToken();
      if (_cachedFcmToken != null) {
        // Store token in shared preferences for anonymous users
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('fcm_token', _cachedFcmToken!);
        debugPrint('FCM Token cached: $_cachedFcmToken');
      }

      // Set up token refresh listener
      _setupTokenRefreshListener();

      // Set up handlers for different message types
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      // Check if app was opened from a notification when it was terminated
      await _checkInitialMessage();

      // Store FCM token in Firestore for currently logged in user
      await _saveFCMToken();

      // Listen for user sign-in/sign-out to update token
      _auth.authStateChanges().listen((User? user) async {
        if (user != null) {
          await _saveFCMToken();
        }
      });
    } catch (e) {
      // Safely handle any FCM initialization errors to prevent app freeze
      debugPrint('FCM initialization error: $e');
    }
  }

  void _setupTokenRefreshListener() {
    // Listen for token refreshes
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      debugPrint('FCM token refreshed: $newToken');

      // Update cached token
      _cachedFcmToken = newToken;

      // Save to SharedPreferences
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('fcm_token', newToken);
      });

      // Update token in Firestore for signed-in user
      final user = _auth.currentUser;
      if (user != null) {
        _firestore.collection(userProfileCollectionId).doc(user.uid).update({
          'fcmTokens': FieldValue.arrayUnion([newToken])
        }).then((_) {
          debugPrint('FCM token updated in user profile');
        }).catchError((error) {
          debugPrint('Error updating FCM token in user profile: $error');
        });
      }
    }, onError: (error) {
      debugPrint('FCM token refresh error: $error');
    });
  }

  Future<void> _saveFCMToken() async {
    User? user = _auth.currentUser;
    String? token = _cachedFcmToken ?? await _firebaseMessaging.getToken();
    if (token == null) return;
    
    // Cache the token
    _cachedFcmToken = token;
    
    // Always save to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('fcm_token', token);
    
    // If user is logged in, also save to their profile
    if (user != null) {
      await _firestore.collection(userProfileCollectionId).doc(user.uid).update({
        'fcmTokens': FieldValue.arrayUnion([token])
      });
      debugPrint('FCM Token saved to user profile: $token');
    }
  }

  Future<String?> _getFCMToken() async {
    if (_cachedFcmToken != null) return _cachedFcmToken;
    
    // Try to get from FirebaseMessaging
    _cachedFcmToken = await _firebaseMessaging.getToken();
    if (_cachedFcmToken != null) return _cachedFcmToken;
    
    // Fall back to stored preference
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('fcm_token');
  }

  void _handleForegroundMessage(RemoteMessage message) {
    debugPrint('Got a message whilst in the foreground!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      debugPrint('Message also contained a notification: ${message.notification}');

      // Create a UserNotification from the message
      final notification = UserNotification(
        notificationId: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        type: message.data['type'] ?? 'default',
        targetId: message.data['targetId'],
        timestamp: DateTime.now(),
        read: false,
      );

      // Show the notification overlay
      _showNotificationOverlay(notification);
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('A new onMessageOpenedApp event was published!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      // Navigation will be handled by the UI that receives this callback
    }
  }

  void _showNotificationOverlay(UserNotification notification) {
    // Show the notification overlay
    NotificationOverlay.show(
      notification: notification,
      onMarkAsRead: () {
        // Mark the notification as read in Firestore
        final user = _auth.currentUser;
        if (user != null) {
          _firestore.collection(userNotificationsCollectionId).doc(user.uid).get().then((snapshot) {
            if (snapshot.exists) {
              final userNotifications = UserNotifications.fromJson(snapshot.data() as Map<String, dynamic>);
              final updatedNotifications = userNotifications.notificationsList.map((n) {
                if (n.notificationId == notification.notificationId) {
                  return n.copyWith(read: true);
                }
                return n;
              }).toList();

              snapshot.reference.update({
                'notificationsList': updatedNotifications.map((n) => n.toJson()).toList(),
              });
            }
          });
        }
      },
    );
  }

  // Show a snackbar notification with action - now takes context as a parameter
  void showNotificationSnackbar(BuildContext context, RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

    final notificationData = message.data;
    final title = notification.title ?? '';
    final body = notification.body ?? '';

    AppSnackbar.key.currentState?.hideCurrentSnackBar();
    AppSnackbar.key.currentState?.showSnackBar(
      SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title.isNotEmpty)
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            if (body.isNotEmpty) Text(body),
          ],
        ),
        action: SnackBarAction(
          label: 'View',
          onPressed: () {
            // Handle notification tap with context
            handleNotificationTap(context, notificationData);
          },
        ),
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  // Modified to accept context parameter
  void handleNotificationTap(BuildContext context, Map<String, dynamic> data) {
    // Handle notification tap based on data
    debugPrint('Handling notification tap with data: $data');

    // Navigate based on notification type
    if (data.containsKey('type')) {
      switch (data['type']) {
        case 'plate_listing':
          final id = data['targetId'];
          if (id != null) {
            AutoRouter.of(context).push(PlatesDetailsRoute(listingId: id));
          }
          break;
        case 'phone_listing':
          final id = data['targetId'];
          if (id != null) {
            AutoRouter.of(context).push(PhoneDetailsRoute(listingId: id));
          }
          break;
        case 'user_profile':
          final id = data['targetId'];
          if (id != null) {
            AutoRouter.of(context).push(UserProfileRoute(userId: id));
          }
          break;
        default:
          // Default action or notification screen
          AutoRouter.of(context).push(const NotificationsRoute());
          break;
      }
    } else {
      // Default to notifications screen if no specific type
      AutoRouter.of(context).push(const NotificationsRoute());
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    debugPrint('Subscribed to topic: $topic');
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    debugPrint('Unsubscribed from topic: $topic');
  }

  // Check if the app was opened from a notification when it was terminated
  Future<void> _checkInitialMessage() async {
    // Get any messages which caused the application to open from a terminated state
    final RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      debugPrint('App opened from terminated state by notification');
      // Handle notification tap will be managed by the UI that checks the initial route
    }
  }
  
  Future<Stream<UserNotifications>> getNotificationsStream() async {
    User? user = _auth.currentUser;
    
    if (user == null) {
      debugPrint('No user logged in for notifications stream');
      return Stream.value(UserNotifications.empty());
    }
    
    return _firestore
        .collection(userNotificationsCollectionId)
        .doc(user.uid)
        .snapshots()
        .map((snapshot) => UserNotifications.fromSnapshot(snapshot));
  }
  
  Future<void> markAllNotificationsAsRead() async {
    User? user = _auth.currentUser;
    if (user == null) return;

    final userNotificationsRef = _firestore.collection(userNotificationsCollectionId).doc(user.uid);
        
    final snapshot = await userNotificationsRef.get();
    if (!snapshot.exists) return;
    
    final userNotifications = UserNotifications.fromSnapshot(snapshot);
    final updatedNotifications =
        userNotifications.notificationsList.map((notification) => notification.copyWith(read: true)).toList();
    
    await userNotificationsRef.update({
      'notificationsList': updatedNotifications.map((n) => n.toJson()).toList(),
    });
  }
}

// This handler must be a top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('Handling a background message: ${message.messageId}');
}
