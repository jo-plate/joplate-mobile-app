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
import 'package:joplate/presentation/widgets/notification_overlay.dart';
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
  
  // Prevent concurrent token updates
  bool _isUpdatingToken = false;

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

      // Configure FCM settings for both foreground and background
      await _firebaseMessaging.setForegroundNotificationPresentationOptions(
        alert: true, // Show notification in foreground
        badge: true,
        sound: true,
      );

      // Set up token refresh listener
      _setupTokenRefreshListener();

      // Set up handlers for different message types
      FirebaseMessaging.onMessage.listen(_handleForegroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

      // Check if app was opened from a notification when it was terminated
      await _checkInitialMessage();

      developer.log('FCM initialization completed successfully', name: 'FCM');
    } catch (e, stack) {
      developer.log('FCM initialization error: $e', name: 'FCM', error: e, stackTrace: stack);
    }
  }

  /// Updates FCM token on login or app reopen
  /// Checks if current token exists and updates accordingly:
  /// - If same token exists: keep it
  /// - If different token exists: update to new one
  /// - If no token exists: add new one
  Future<void> updateFCMTokenOnLoginOrAppReopen() async {
    // Prevent concurrent executions
    if (_isUpdatingToken) {
      developer.log('FCM token update already in progress, skipping', name: 'FCM');
      return;
    }

    _isUpdatingToken = true;
    
    try {
      developer.log('Starting FCM token update on login/app reopen', name: 'FCM');

      final user = _auth.currentUser;
      if (user == null) {
        developer.log('No user signed in, skipping FCM token update', name: 'FCM');
        return;
      }

      // Get current FCM token
      final currentToken = await _firebaseMessaging.getToken();
      if (currentToken == null) {
        developer.log('Failed to get current FCM token', name: 'FCM');
        return;
      }

      developer.log('Current FCM token: ${currentToken.substring(0, 10)}...', name: 'FCM');

      // Get stored token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final storedToken = prefs.getString('fcm_token');

      // Get tokens from Firestore
      final userRef = _firestore.collection(userProfileCollectionId).doc(user.uid);
      final doc = await userRef.get();
      List<String> firestoreTokens = [];

      if (doc.exists) {
        final data = doc.data();
        if (data != null && data['fcmTokens'] != null) {
          firestoreTokens = List<String>.from(data['fcmTokens']);
        }
      }

      developer.log('Stored token in SharedPrefs: ${storedToken?.substring(0, 10) ?? 'null'}', name: 'FCM');
      developer.log('Firestore tokens count: ${firestoreTokens.length}', name: 'FCM');

      bool needsUpdate = false;

      // Check if current token is already in Firestore
      if (firestoreTokens.contains(currentToken)) {
        developer.log('Current token already exists in Firestore, no update needed', name: 'FCM');
      } else {
        developer.log('Current token not found in Firestore, needs update', name: 'FCM');
        needsUpdate = true;

        // Remove old stored token if it exists and is different
        if (storedToken != null && storedToken != currentToken) {
          firestoreTokens.remove(storedToken);
          developer.log('Removed old token from list', name: 'FCM');
        }

        // Add current token if not already present
        if (!firestoreTokens.contains(currentToken)) {
          firestoreTokens.add(currentToken);
          developer.log('Added new token to list', name: 'FCM');
        }
      }

      // Update SharedPreferences with current token
      await prefs.setString('fcm_token', currentToken);

      // Update Firestore if needed
      if (needsUpdate) {
        await userRef.set({
          'fcmTokens': firestoreTokens,
        }, SetOptions(merge: true));

        developer.log('Updated FCM tokens in Firestore: ${firestoreTokens.length} tokens', name: 'FCM');
      }

      developer.log('FCM token update completed successfully', name: 'FCM');
    } catch (e) {
      developer.log('Error updating FCM token on login/app reopen: $e', name: 'FCM');
    } finally {
      _isUpdatingToken = false;
    }
  }



  void _setupTokenRefreshListener() {
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) async {
      developer.log('FCM token automatically refreshed by system: ${newToken.substring(0, 10)}...', name: 'FCM');
      
      // Add small delay to avoid conflicts with other token updates
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Use our unified token update method to avoid conflicts
      await updateFCMTokenOnLoginOrAppReopen();
    }, onError: (error) {
      developer.log('FCM token refresh error: $error', name: 'FCM');
    });
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

      // Show the notification overlay
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_router.navigatorKey.currentContext != null) {
          NotificationOverlay.show(
            notification: notification,
            onTap: () => handleNotificationTap(_router.navigatorKey.currentContext!, message.data),
          );
        }
      });
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    developer.log('App opened from notification: ${message.messageId}', name: 'FCM');
    developer.log('Message data: ${message.data}', name: 'FCM');

    if (message.notification != null && _router.navigatorKey.currentContext != null) {
      handleNotificationTap(_router.navigatorKey.currentContext!, message.data);
    }
  }


  void showNotificationSnackbar(BuildContext context, RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

    // Create a UserNotification from the message
    final userNotification = UserNotification(
      notificationId: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      title: notification.title ?? '',
      body: notification.body ?? '',
      type: message.data['type'] ?? 'default',
      targetId: message.data['targetId'],
      timestamp: DateTime.now(),
      read: false,
    );

    // Show the notification overlay
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.mounted) {
        NotificationOverlay.show(
          notification: userNotification,
          onTap: () => handleNotificationTap(context, message.data),
        );
      }
    });
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

    if (initialMessage != null && _router.navigatorKey.currentContext != null) {
      developer.log('App opened from terminated state by notification', name: 'FCM');
      developer.log('Initial message data: ${initialMessage.data}', name: 'FCM');
      
      handleNotificationTap(_router.navigatorKey.currentContext!, initialMessage.data);
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
