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
import 'package:joplate/presentation/widgets/notification_overlay.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

// This handler must be a top-level function
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    // If you're going to use other Firebase services in the background, such as Firestore,
    // make sure you call `initializeApp` before using other Firebase services.
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    // Log the message details for debugging
    developer.log('Handling a background message: ${message.messageId}', name: 'FCM');
    developer.log('Message data: ${message.data}', name: 'FCM');
    developer.log('Message notification: ${message.notification?.title}', name: 'FCM');
  } catch (e, stack) {
    developer.log('Error in background handler: $e', name: 'FCM', error: e, stackTrace: stack);
    FirebaseCrashlytics.instance.recordError(e, stack, reason: 'FCM background handler failed');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure logging
  developer.log('App starting...', name: 'main');

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  developer.log('Firebase initialized', name: 'main');

  // Initialize FCM
  await _initializeFCM();
  developer.log('FCM initialized', name: 'main');

  // Set up background message handler
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await DependencyManager.inject();
  developer.log('Dependencies injected', name: 'main');

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

Future<void> _initializeFCM() async {
  try {
    final messaging = FirebaseMessaging.instance;

    // Request permission for iOS
    if (Platform.isIOS) {
      final settings = await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
        provisional: false,
      );

      developer.log('FCM permission status: ${settings.authorizationStatus}', name: 'FCM');

      if (settings.authorizationStatus != AuthorizationStatus.authorized) {
        developer.log('FCM permission not granted', name: 'FCM');
        return;
      }
    }

    // Get FCM token
    final token = await messaging.getToken();
    if (token != null) {
      developer.log('FCM token obtained: ${token.substring(0, 10)}...', name: 'FCM');
    } else {
      developer.log('Failed to get FCM token', name: 'FCM');
    }

    // Configure FCM settings
    await messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Handle token refresh
    messaging.onTokenRefresh.listen((newToken) {
      developer.log('FCM token refreshed: ${newToken.substring(0, 10)}...', name: 'FCM');
      // The FCMCubit will handle updating the token in the backend
    });

    // Set up foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      developer.log('Received foreground message: ${message.messageId}', name: 'FCM');
      developer.log('Message data: ${message.data}', name: 'FCM');
      developer.log('Message notification: ${message.notification?.title}', name: 'FCM');
    });

    // Handle message open events
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      developer.log('App opened from notification: ${message.messageId}', name: 'FCM');
      developer.log('Message data: ${message.data}', name: 'FCM');
    });
  } catch (e, stack) {
    developer.log('Error initializing FCM: $e', name: 'FCM', error: e, stackTrace: stack);
    FirebaseCrashlytics.instance.recordError(e, stack, reason: 'FCM initialization failed');
  }
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter();

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
                  // Set up a listener for foreground FCM messages that need context
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    // Set up FCM message listener to show snackbars
                    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
                      if (message.notification != null) {
                        // Show a snackbar for the notification
                        injector<FCMService>().showNotificationSnackbar(ctx, message);
                      }
                    });

                    // Check for initial message from a terminated state
                    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
                      if (message != null && message.notification != null) {
                        // Handle notification that opened the app
                        injector<FCMService>().handleNotificationTap(ctx, message.data);
                      }
                    });
                  });

                  return Directionality(
                    textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
                    child: LocalizationProvider(
                      messages: messages,
                      child: Navigator(
                        key: NotificationOverlay.navigatorKey,
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
