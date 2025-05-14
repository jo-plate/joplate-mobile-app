import 'dart:io';
import 'dart:ui';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/feature_listing_dto.dart';
import 'package:joplate/injection/dependencies.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/messages.i18n.dart';
import 'package:joplate/messages_ar.i18n.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/cubits/iap_cubit.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/cubits/theme_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:joplate/presentation/theme.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DependencyManager.inject();

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injector<AuthCubit>()),
        BlocProvider(create: (context) => injector<LocalizationCubit>()),
        BlocProvider(create: (context) => injector<IAPCubit>()..initialize()),
        BlocProvider(create: (context) => injector<ThemeCubit>()..loadTheme()),
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
                  return Directionality(
                    textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
                    child: LocalizationProvider(
                      messages: messages,
                      child: widget!,
                    ),
                  );
                },
                routerConfig: AppRouter().config(
                  navigatorObservers: () => [
                    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
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
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('خطأ في عملية الشراء')),
      );
    },
  );
}

Future<void> _handlePurchase(
    PurchaseDetails purchase, BuildContext context) async {
  if (purchase.status == PurchaseStatus.purchased) {
    final iapData = IAPData(
      productId: purchase.productID,
      transactionId: purchase.transactionDate ?? '',
      purchaseToken: purchase.verificationData.serverVerificationData,
      receipt: Platform.isIOS
          ? purchase.verificationData.localVerificationData
          : null,
    );

    try {
      final callable =
          FirebaseFunctions.instance.httpsCallable(redeemPurchaseCF);
      await callable.call(iapData.toJson());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('✅ تم تفعيل التذكرة بنجاح')),
      );
    } on FirebaseFunctionsException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('❌ فشل التفعيل: ${e.message ?? "خطأ غير معروف"}')),
      );
    } finally {
      if (purchase.pendingCompletePurchase) {
        await InAppPurchase.instance.completePurchase(purchase);
      }
    }
  } else if (purchase.status == PurchaseStatus.error) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('فشل الشراء')),
    );
  }
}
