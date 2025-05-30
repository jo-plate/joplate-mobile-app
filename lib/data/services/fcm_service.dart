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
import 'package:joplate/presentation/widgets/notification_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:joplate/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

@lazySingleton
class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AppRouter _router = AppRouter();
  String? _cachedFcmToken;
  OverlayEntry? _currentToast;

  Future<void> initialize() async {
    try {
      // Initialize Firebase if not already initialized
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      }

      // Request permission for iOS first
      if (defaultTargetPlatform == TargetPlatform.iOS) {
        try {
          final apnsToken = await _firebaseMessaging.getAPNSToken();
          developer.log('APNS Token: $apnsToken', name: 'FCM');
        } catch (e) {
          developer.log('Error getting APNS token: $e', name: 'FCM');
        }

        NotificationSettings settings = await _firebaseMessaging.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );

        developer.log('FCM permission status: ${settings.authorizationStatus}', name: 'FCM');
      }

      // Configure FCM settings to suppress notifications in foreground
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: false, // Disable system notification in foreground
        badge: true,
        sound: false, // Disable sound in foreground
      );

      // Force token refresh and save immediately
      await _forceTokenRefresh();

      // Set up token refresh listener
      _setupTokenRefreshListener();

      // Set up handlers for different message types
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

      // Check if app was opened from a notification when it was terminated
      await _checkInitialMessage();

      // Listen for user sign-in/sign-out to update token
      _auth.authStateChanges().listen((User? user) async {
        if (user != null) {
          await _forceTokenRefresh();
        }
      });

      developer.log('FCM initialization completed successfully', name: 'FCM');
    } catch (e, stack) {
      developer.log('FCM initialization error: $e', name: 'FCM', error: e, stackTrace: stack);
    }
  }

  Future<void> _forceTokenRefresh() async {
    try {
      // Delete the current token to force a refresh
      await _firebaseMessaging.deleteToken();

      // Get the new token
      final newToken = await _firebaseMessaging.getToken();
      if (newToken == null) {
        developer.log('Failed to get new FCM token after refresh', name: 'FCM');
        return;
      }

      // Cache the token
      _cachedFcmToken = newToken;

      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final oldToken = prefs.getString('fcm_token');
      await prefs.setString('fcm_token', newToken);

      // Update token in Firestore for signed-in user
      final user = _auth.currentUser;
      if (user != null) {
        try {
          // First, remove the old token if it exists
          if (oldToken != null) {
            await _firestore.collection(userProfileCollectionId).doc(user.uid).update({
              'fcmTokens': FieldValue.arrayRemove([oldToken])
            });
          }

          // Then add the new token
          await _firestore.collection(userProfileCollectionId).doc(user.uid).update({
            'fcmTokens': FieldValue.arrayUnion([newToken])
          });

          developer.log('FCM Token refreshed and saved to user profile: ${newToken.substring(0, 10)}...', name: 'FCM');
        } catch (error) {
          developer.log('Error updating FCM token in user profile: $error', name: 'FCM');
        }
      }
    } catch (e) {
      developer.log('Error forcing token refresh: $e', name: 'FCM');
    }
  }

  void _setupTokenRefreshListener() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      developer.log('FCM token refreshed: ${newToken.substring(0, 10)}...', name: 'FCM');

      // Update cached token
      _cachedFcmToken = newToken;

      // Save to SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final oldToken = prefs.getString('fcm_token');
      await prefs.setString('fcm_token', newToken);

      // Update token in Firestore for signed-in user
      final user = _auth.currentUser;
      if (user != null) {
        try {
          // First, remove the old token if it exists
          if (oldToken != null) {
            await _firestore.collection(userProfileCollectionId).doc(user.uid).update({
              'fcmTokens': FieldValue.arrayRemove([oldToken])
            });
          }

          // Then add the new token
          await _firestore.collection(userProfileCollectionId).doc(user.uid).update({
            'fcmTokens': FieldValue.arrayUnion([newToken])
          });

          developer.log('FCM token updated in user profile', name: 'FCM');
        } catch (error) {
          developer.log('Error updating FCM token in user profile: $error', name: 'FCM');
        }
      }
    }, onError: (error) {
      developer.log('FCM token refresh error: $error', name: 'FCM');
    });
  }

  Future<void> _saveFCMToken() async {
    try {
      User? user = _auth.currentUser;
      String? token = await _firebaseMessaging.getToken();
      if (token == null) return;

      // Cache the token
      _cachedFcmToken = token;

      // Always save to shared preferences
      final prefs = await SharedPreferences.getInstance();
      final oldToken = prefs.getString('fcm_token');
      await prefs.setString('fcm_token', token);
      
      // If user is logged in, update their profile
      if (user != null) {
        // First remove the old token if it exists
        if (oldToken != null) {
          await _firestore.collection(userProfileCollectionId).doc(user.uid).update({
            'fcmTokens': FieldValue.arrayRemove([oldToken])
          });
        }

        // Then add the new token
        await _firestore.collection(userProfileCollectionId).doc(user.uid).update({
          'fcmTokens': FieldValue.arrayUnion(
            [token],
          )
        });

        developer.log('FCM Token saved to user profile: ${token.substring(0, 10)}...', name: 'FCM');
      }
    } catch (e) {
      developer.log('Error saving FCM token: $e', name: 'FCM');
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

  void _showNotificationToast(BuildContext context, UserNotification notification) {
    // Remove any existing toast
    _removeCurrentToast();

    // Create overlay entry
    _currentToast = OverlayEntry(
      builder: (context) => NotificationToast(
        notification: notification,
        onTap: () {
          _removeCurrentToast();
          handleNotificationTap(context, {
            'type': notification.type,
            'targetId': notification.targetId,
          });
        },
        onDismiss: () {
          _removeCurrentToast();
        },
      ),
    );

    // Insert the toast
    Overlay.of(context).insert(_currentToast!);

    // Auto dismiss after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      _removeCurrentToast();
    });
  }

  void _removeCurrentToast() {
    _currentToast?.remove();
    _currentToast = null;
  }

  void _handleForegroundMessage(RemoteMessage message) {
    developer.log('Got a message whilst in the foreground!', name: 'FCM');
    developer.log('Message data: ${message.data}', name: 'FCM');

    if (message.notification != null) {
      developer.log('Message also contained a notification: ${message.notification}', name: 'FCM');

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

      // Show the notification toast
      if (_router.navigatorKey.currentContext != null) {
        _showNotificationToast(_router.navigatorKey.currentContext!, notification);
      }
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    developer.log('App opened from notification: ${message.messageId}', name: 'FCM');
    developer.log('Message data: ${message.data}', name: 'FCM');

    if (message.notification != null) {
      // Navigation will be handled by the UI that receives this callback
    }
  }

  void _showNotificationOverlay(UserNotification notification) {
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
            handleNotificationTap(context, notificationData);
          },
        ),
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void handleNotificationTap(BuildContext context, Map<String, dynamic> data) {
    developer.log('Handling notification tap with data: $data', name: 'FCM');

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
          AutoRouter.of(context).push(const NotificationsRoute());
          break;
      }
    } else {
      AutoRouter.of(context).push(const NotificationsRoute());
    }
  }

  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
    developer.log('Subscribed to topic: $topic', name: 'FCM');
  }

  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
    developer.log('Unsubscribed from topic: $topic', name: 'FCM');
  }

  Future<void> _checkInitialMessage() async {
    final RemoteMessage? initialMessage = await _firebaseMessaging.getInitialMessage();

    if (initialMessage != null) {
      developer.log('App opened from terminated state by notification', name: 'FCM');
      developer.log('Initial message data: ${initialMessage.data}', name: 'FCM');
    }
  }
  
  Future<Stream<UserNotifications>> getNotificationsStream() async {
    User? user = _auth.currentUser;
    
    if (user == null) {
      developer.log('No user logged in for notifications stream', name: 'FCM');
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
