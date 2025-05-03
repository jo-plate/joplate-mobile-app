import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:joplate/injection/injector.dart';

class DependencyManager {
  static Future<void> inject() async {
    injector.registerLazySingleton<FirebaseAnalytics>(
        () => FirebaseAnalytics.instance);
    injector.registerLazySingleton<FirebaseCrashlytics>(
        () => FirebaseCrashlytics.instance);

    await configureDependencies();
  }
}
