import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
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
      
      // Check if we need to migrate notifications from old token to new token
      _migrateNotificationsIfNeeded(newToken);
    }, onError: (error) {
      debugPrint('FCM token refresh error: $error');
    });
  }
  
  Future<void> _migrateNotificationsIfNeeded(String newToken) async {
    // Get old token from SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    final oldToken = prefs.getString('previous_fcm_token');

    // If we have an old token that's different from the new one
    if (oldToken != null && oldToken != newToken) {
      try {
        // Check if there are notifications under the old token
        final oldNotificationsSnapshot = await _firestore
            .collection(anonymousNotificationsCollectionId)
            .doc(oldToken)
            .collection(userNotificationsCollectionId)
            .get();

        if (oldNotificationsSnapshot.docs.isNotEmpty) {
          debugPrint('Migrating ${oldNotificationsSnapshot.docs.length} notifications from old token to new token');

          // Get batch for more efficient writes
          final batch = _firestore.batch();

          // Create a reference to the new token's collection
          final newTokenRef = _firestore
              .collection(anonymousNotificationsCollectionId)
              .doc(newToken)
              .collection(userNotificationsCollectionId);

          // Copy each notification to the new location
          for (final doc in oldNotificationsSnapshot.docs) {
            final data = doc.data();
            data['fcmToken'] = newToken; // Update token in the notification data
            batch.set(newTokenRef.doc(doc.id), data);
          }

          // Commit all writes
          await batch.commit();

          debugPrint('Notifications successfully migrated to new token');
        }
      } catch (e) {
        debugPrint('Error migrating notifications: $e');
      }
    }

    // Save current token as previous token for future migrations
    await prefs.setString('previous_fcm_token', newToken);
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

      // Save notification to Firestore
      _saveNotificationToFirestore(message);

      // Show toast notification
      _showToastNotification(message);
    }
  }

  void _handleMessageOpenedApp(RemoteMessage message) {
    debugPrint('A new onMessageOpenedApp event was published!');
    debugPrint('Message data: ${message.data}');

    if (message.notification != null) {
      // Mark notification as read in Firestore
      _markNotificationAsRead(message.data['notificationId']);

      // Navigation will be handled by the UI that receives this callback
    }
  }

  Future<void> _saveNotificationToFirestore(RemoteMessage message) async {
    User? user = _auth.currentUser;
    String? fcmToken = await _getFCMToken();
    
    if (fcmToken == null) {
      debugPrint('No FCM token available to save notification');
      return;
    }

    try {
      DocumentReference notificationRef;
      
      // If user is signed in, store in their collection
      if (user != null) {
        notificationRef = _firestore
            .collection(userProfileCollectionId)
            .doc(user.uid)
            .collection(userNotificationsCollectionId)
            .doc();
      } else {
        // For anonymous users, store in a separate collection using FCM token
        notificationRef = _firestore
            .collection(anonymousNotificationsCollectionId)
            .doc(fcmToken)
            .collection(userNotificationsCollectionId)
            .doc();
      }

      // Create UserNotification object
      final UserNotification notification = UserNotification(
        notificationId: notificationRef.id,
        title: message.notification?.title ?? 'Notification',
        body: message.notification?.body ?? '',
        timestamp: DateTime.now(),
        read: false,
        type: message.data['type'] ?? 'default',
        targetId: message.data['targetId'],
        fcmToken: fcmToken,
      );

      // Save to Firestore
      await notificationRef.set(notification.toJson());
      debugPrint('Notification saved to Firestore with ID: ${notification.notificationId}');
    } catch (e) {
      debugPrint('Error saving notification to Firestore: $e');
    }
  }

  Future<void> _markNotificationAsRead(String? notificationId) async {
    if (notificationId == null) return;

    User? user = _auth.currentUser;
    String? fcmToken = await _getFCMToken();
    
    if (fcmToken == null) return;

    try {
      // Try to mark as read in user's collection if signed in
      if (user != null) {
        await _firestore
            .collection(userProfileCollectionId)
            .doc(user.uid)
            .collection(userNotificationsCollectionId)
            .doc(notificationId)
            .update({'read': true});
      } else {
        // Try to mark as read in anonymous collection
        await _firestore
            .collection(anonymousNotificationsCollectionId)
            .doc(fcmToken)
            .collection(userNotificationsCollectionId)
            .doc(notificationId)
            .update({'read': true});
      }

      debugPrint('Notification marked as read: $notificationId');
    } catch (e) {
      debugPrint('Error marking notification as read: $e');
    }
  }
  
  // Public method for use by the UI
  Future<void> markNotificationAsRead(String notificationId) async {
    await _markNotificationAsRead(notificationId);
  }

  void _showToastNotification(RemoteMessage message) {
    final notification = message.notification;
    if (notification == null) return;

    // Show toast notification
    Fluttertoast.showToast(
        msg: "${notification.title ?? ''}\n${notification.body ?? ''}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.black87,
        textColor: Colors.white,
        fontSize: 16.0);
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
      // If the message contains a notification, store it in Firestore
      if (initialMessage.notification != null) {
        // Save notification to Firestore
        await _saveNotificationToFirestore(initialMessage);

        // Handle notification tap will be managed by the UI that checks the initial route
      }
    }
  }
  
  Future<Stream<List<UserNotification>>> getNotificationsStream() async {
    User? user = _auth.currentUser;
    String? fcmToken = await _getFCMToken();
    
    // Return empty stream if no token (this will be handled the same way as empty notifications)
    if (fcmToken == null) {
      debugPrint('No FCM token available for notifications stream');
      return Stream.value([]);
    }
    
    if (user != null) {
      // User is signed in, get from user collection
      return _firestore
          .collection(userProfileCollectionId)
          .doc(user.uid)
          .collection(userNotificationsCollectionId)
          .orderBy('timestamp', descending: true)
          .limit(100)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => UserNotification.fromSnapshot(doc)).toList());
    } else {
      // User is signed out, get from anonymous collection
      return _firestore
          .collection(anonymousNotificationsCollectionId)
          .doc(fcmToken)
          .collection(userNotificationsCollectionId)
          .orderBy('timestamp', descending: true)
          .limit(100)
          .snapshots()
          .map((snapshot) => snapshot.docs.map((doc) => UserNotification.fromSnapshot(doc)).toList());
    }
  }
  
  Future<void> markAllNotificationsAsRead() async {
    User? user = _auth.currentUser;
    String? fcmToken = await _getFCMToken();
    
    if (fcmToken == null) return;
    
    final batch = _firestore.batch();
    QuerySnapshot notifications;
    
    if (user != null) {
      // User is signed in
      notifications = await _firestore
          .collection(userProfileCollectionId)
          .doc(user.uid)
          .collection(userNotificationsCollectionId)
          .where('read', isEqualTo: false)
          .get();
    } else {
      // User is signed out
      notifications = await _firestore
          .collection(anonymousNotificationsCollectionId)
          .doc(fcmToken)
          .collection(userNotificationsCollectionId)
          .where('read', isEqualTo: false)
          .get();
    }
    
    for (var doc in notifications.docs) {
      batch.update(doc.reference, {'read': true});
    }
    
    await batch.commit();
  }
}

// This handler must be a top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('Handling a background message: ${message.messageId}');

  // Store notification in Firestore
  try {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    
    // Get FCM token
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? fcmToken = prefs.getString('fcm_token') ?? await FirebaseMessaging.instance.getToken();
    
    if (fcmToken == null) {
      debugPrint('No FCM token available in background handler');
      return;
    }

    DocumentReference notificationRef;
    
    // Check if user is signed in
    if (auth.currentUser != null) {
      // User is signed in
      notificationRef = firestore
          .collection(userProfileCollectionId)
          .doc(auth.currentUser!.uid)
          .collection(userNotificationsCollectionId)
          .doc();
    } else {
      // User is signed out, use FCM token
      notificationRef = firestore
          .collection(anonymousNotificationsCollectionId)
          .doc(fcmToken)
          .collection(userNotificationsCollectionId)
          .doc();
    }

    // Create UserNotification object
    final UserNotification notification = UserNotification(
      notificationId: notificationRef.id,
      title: message.notification?.title ?? 'Notification',
      body: message.notification?.body ?? '',
      timestamp: DateTime.now(),
      read: false,
      type: message.data['type'] ?? 'default',
      targetId: message.data['targetId'],
      fcmToken: fcmToken,
    );

    // Save to Firestore
    await notificationRef.set(notification.toJson());
    debugPrint('Background notification saved to Firestore with ID: ${notification.notificationId}');
  } catch (e) {
    debugPrint('Error saving background notification to Firestore: $e');
  }
}
