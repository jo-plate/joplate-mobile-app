import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:joplate/data/services/fcm_service.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/firebase_options.dart';
import 'package:joplate/presentation/cubits/fcm/fcm_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class FCMCubit extends Cubit<FCMState> {
  final FCMService _fcmService;

  FCMCubit(this._fcmService) : super(const FCMState.initial());

  Future<void> initialize() async {
    try {
      // Initialize Firebase if not already initialized
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
      }

      // Set up background message handler
      FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

      // Store FCM token for anonymous users if needed
      try {
        final fcmToken = await FirebaseMessaging.instance.getToken();
        if (fcmToken != null) {
          final prefs = await SharedPreferences.getInstance();
          // Save the current token
          await prefs.setString('fcm_token', fcmToken);

          // If this is the first time, also save as previous_fcm_token to initialize the migration chain
          if (!prefs.containsKey('previous_fcm_token')) {
            await prefs.setString('previous_fcm_token', fcmToken);
          }
        }
      } catch (e) {
        debugPrint('Error getting FCM token: $e');
      }

      // Initialize FCM service
      await _fcmService.initialize();
      emit(const FCMState.initialized());
    } catch (e) {
      debugPrint('FCM initialization error: $e');
      emit(FCMState.error(e.toString()));
    }
  }

  // Delegate all other methods to the FCM service
  Future<void> subscribeToTopic(String topic) => _fcmService.subscribeToTopic(topic);
  Future<void> unsubscribeFromTopic(String topic) => _fcmService.unsubscribeFromTopic(topic);
  Future<void> markNotificationAsRead(String notificationId) => _fcmService.markNotificationAsRead(notificationId);
  Future<void> markAllNotificationsAsRead() => _fcmService.markAllNotificationsAsRead();
  Future<Stream<List<UserNotification>>> getNotificationsStream() => _fcmService.getNotificationsStream();
}

// This handler must be a top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint('Handling a background message: ${message.messageId}');
}
