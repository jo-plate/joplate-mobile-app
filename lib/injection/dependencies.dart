import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:joplate/injection/injector.dart';
import 'package:app_links/app_links.dart';

class DependencyManager {
  static Future<void> inject() async {
    injector.registerLazySingleton<FirebaseAnalytics>(
        () => FirebaseAnalytics.instance);
    injector.registerLazySingleton<FirebaseCrashlytics>(
        () => FirebaseCrashlytics.instance);
    injector.registerLazySingleton<FirebaseMessaging>(() => FirebaseMessaging.instance);
    injector.registerLazySingleton<AppLinks>(() => AppLinks());

    await configureDependencies();
  }
}
