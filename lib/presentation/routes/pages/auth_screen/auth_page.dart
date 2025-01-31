import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/login_form.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/signup_form.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

// TODO: implement this https://api.flutter.dev/flutter/material/TabBarView-class.html
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: injector<AuthCubit>(),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(200), child: TabBar(tabs: [Tab(text: 'Login'), Tab(text: 'Signup')])),
          body: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state.isLoggedIn) {
                  AutoRouter.of(context).replace(const HomeRoute());
                }
              },
              child: TabBarView(
                children: [
                  LoginForm(onPressed: (input) {
                    injector<AuthCubit>().loginWithEmailAndPassword(input);
                  }),
                  SignupForm(onPressed: (input) {
                    injector<AuthCubit>().signUpWithEmailAndPassword(input);
                  })
                ],
              )),
        ),
      ),
    );
  }
}
