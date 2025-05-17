import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:joplate/data/services/fcm_service.dart';
import 'package:joplate/injection/injector.dart';

class DependencyManager {
  static Future<void> inject() async {
    injector.registerLazySingleton<FirebaseAnalytics>(
        () => FirebaseAnalytics.instance);
    injector.registerLazySingleton<FirebaseCrashlytics>(
        () => FirebaseCrashlytics.instance);
    injector.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);
    injector.registerLazySingleton<FCMService>(() => FCMService());

    await configureDependencies();
  }
}
