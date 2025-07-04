import 'dart:io';
import 'dart:ui';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/data/services/fcm_service.dart';

import 'package:joplate/domain/dto/feature_listing_dto.dart';
import 'package:joplate/injection/dependencies.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/messages.i18n.dart';
import 'package:joplate/messages_ar.i18n.dart';
import 'package:joplate/presentation/cubits/attp/attp_cubit.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/cubits/fcm/fcm_cubit.dart';
import 'package:joplate/presentation/cubits/iap_cubit.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/cubits/theme_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:joplate/presentation/theme.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'dart:developer' as developer;
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/domain/entities/user_notifications.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    developer.log('Handling a background message: ${message.messageId}', name: 'FCM');
    developer.log('Message data: ${message.data}', name: 'FCM');
    developer.log('Message notification: ${message.notification?.title}', name: 'FCM');

    final user = FirebaseAuth.instance.currentUser;
    if (user != null && message.notification != null) {
      final firestore = FirebaseFirestore.instance;
      final userNotificationsRef = firestore.collection(userNotificationsCollectionId).doc(user.uid);

      final snapshot = await userNotificationsRef.get();
      if (snapshot.exists) {
        final userNotifications = UserNotifications.fromSnapshot(snapshot);

        final newNotification = UserNotification(
          notificationId: message.messageId ?? DateTime.now().millisecondsSinceEpoch.toString(),
          title: message.notification?.title ?? '',
          body: message.notification?.body ?? '',
          type: message.data['type'] ?? 'default',
          targetId: message.data['targetId'],
          timestamp: DateTime.now(),
          read: false,
        );

        final updatedNotifications = [newNotification, ...userNotifications.notificationsList];

        await userNotificationsRef.update({
          'notificationsList': updatedNotifications.map((n) => n.toJson()).toList(),
        });
      }
    }
  } catch (e, stack) {
    developer.log('Error in background handler: $e', name: 'FCM', error: e, stackTrace: stack);
    FirebaseCrashlytics.instance.recordError(e, stack, reason: 'FCM background handler failed');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  developer.log('App starting...', name: 'main');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  developer.log('Firebase initialized', name: 'main');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  developer.log('Background message handler set up', name: 'main');

  await DependencyManager.inject();
  developer.log('Dependencies injected', name: 'main');

  final fcmService = injector<FCMService>();
  await fcmService.initialize();
  developer.log('FCM service initialized', name: 'main');

  FlutterError.onError = (FlutterErrorDetails details) {
    developer.log('Flutter error: ${details.exception}',
        name: 'main', error: details.exception, stackTrace: details.stack);
    FirebaseCrashlytics.instance.recordFlutterError(details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    developer.log('Platform error: $error', name: 'main', error: error, stackTrace: stack);
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    developer.log('Building MyApp', name: 'main');

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injector<AuthCubit>()),
        BlocProvider(create: (context) => injector<LocalizationCubit>()),
        BlocProvider(create: (context) {
          developer.log('Creating IAPCubit', name: 'main');
          final cubit = injector<IAPCubit>();
          developer.log('Initializing IAPCubit', name: 'main');
          cubit.initialize();
          return cubit;
        }),
        BlocProvider(create: (context) => injector<ThemeCubit>()..loadTheme()),
        BlocProvider(create: (context) => injector<FCMCubit>()..initialize()),
        BlocProvider(create: (context) => injector<ATPPCubit>()..requestTrackingPermission()),
      ],
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, locale) {
          final isEnglish = locale.languageCode == 'en';
          final messages = isEnglish ? const Messages() : const MessagesAr();

          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              return MaterialApp.router(
                title: 'JoPlate',
                theme: getLightTheme(),
                darkTheme: getDarkTheme(),
                themeMode: themeState.themeMode,
                scaffoldMessengerKey: AppSnackbar.key,
                builder: (ctx, widget) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
                      if (message.notification != null) {
                        injector<FCMService>().showNotificationSnackbar(ctx, message);
                      }
                    });

                    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
                      if (message != null && message.notification != null) {
                        injector<FCMService>().handleNotificationTap(ctx, message.data);
                      }
                    });
                  });

                  return Directionality(
                    textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
                    child: LocalizationProvider(
                      messages: messages,
                      child: Navigator(
                        key: navigatorKey,
                        onGenerateRoute: (settings) => MaterialPageRoute(
                          builder: (context) => widget!,
                        ),
                      ),
                    ),
                  );
                },
                restorationScopeId: 'joplate_app',
                debugShowCheckedModeBanner: false,
                routeInformationParser: _appRouter.defaultRouteParser(),
                routerDelegate: _appRouter.delegate(
                  navRestorationScopeId: 'joplate_app',
                  navigatorObservers: () => [
                    FirebaseAnalyticsObserver(
                      analytics: FirebaseAnalytics.instance,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

void initIAPListener(BuildContext context) {
  InAppPurchase.instance.purchaseStream.listen(
    (List<PurchaseDetails> purchases) {
      for (final purchase in purchases) {
        _handlePurchase(purchase, context);
      }
    },
    onError: (error) {
      final m = Localization.of(context);
      AppSnackbar.showError(m.common.purchase_error);
    },
  );
}

Future<void> _handlePurchase(PurchaseDetails purchase, BuildContext context) async {
  final m = Localization.of(context);

  if (purchase.status == PurchaseStatus.purchased) {
    final iapData = IAPData(
      productId: purchase.productID,
      transactionId: purchase.transactionDate ?? '',
      purchaseToken: purchase.verificationData.serverVerificationData,
      receipt: Platform.isIOS ? purchase.verificationData.localVerificationData : null,
    );

    try {
      final callable = FirebaseFunctions.instance.httpsCallable(redeemPurchaseCF);
      await callable.call(iapData.toJson());

      AppSnackbar.showSuccess(m.common.activation_success);
    } on FirebaseFunctionsException catch (e) {
      AppSnackbar.showError('${m.common.activation_failed}${e.message ?? m.common.unknown_error}');
    } finally {
      if (purchase.pendingCompletePurchase) {
        await InAppPurchase.instance.completePurchase(purchase);
      }
    }
  } else if (purchase.status == PurchaseStatus.error) {
    AppSnackbar.showError(m.common.purchase_error);
  }
}
