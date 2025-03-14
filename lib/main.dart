import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/dependencies.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
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
      providers: [BlocProvider(create: (_) => injector<AuthCubit>())],
      child: MaterialApp.router(
        title: 'JoPlate',
        theme: appTheme,
        routerConfig: AppRouter().config(),
      ),
    );
  }
}
