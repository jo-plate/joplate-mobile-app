import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/logged_in_user_view.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: injector<AuthCubit>(),
        child: Builder(builder: (context) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state.user == null) {
                return const AnonUserView();
              }
              return const LoggedInUserView();
            },
          );
        }),
      ),
    );
  }
}
