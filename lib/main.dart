import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/dependencies.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/messages.i18n.dart';
import 'package:joplate/messages_ar.i18n.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:joplate/presentation/theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await DependencyManager.inject();

  // COMMENT IN PROD
  // if (kDebugMode) await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  print(await FirebaseAuth.instance.currentUser?.getIdToken(false));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => injector<AuthCubit>()),
        BlocProvider(create: (context) => injector<LocalizationCubit>())
      ],
      child: BlocBuilder<LocalizationCubit, Locale>(
        builder: (context, locale) {
          // 2) Pick the messages based on locale
          final isEnglish = locale.languageCode == 'en';
          final messages = isEnglish ? const Messages() : const MessagesAr();

          return MaterialApp.router(
            title: 'JoPlate',
            theme: appTheme,
            // 3) Wrap entire app in a Directionality + an InheritedWidget
            builder: (ctx, widget) {
              return Directionality(
                textDirection: isEnglish ? TextDirection.ltr : TextDirection.rtl,
                child: LocalizationProvider(
                  messages: messages,
                  child: widget!,
                ),
              );
            },
            routerConfig: AppRouter().config(),
          );
        },
      ),
    );
  }
}
