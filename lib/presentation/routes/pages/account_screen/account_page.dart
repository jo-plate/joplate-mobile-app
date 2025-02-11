import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/menu_item.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      backgroundColor: const Color.fromARGB(255, 244, 242, 242),
      body: BlocProvider.value(
        value: injector<AuthCubit>(),
        child: Builder(builder: (context) {
          return BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.isLoggedIn && state.userProfile == null) {
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfileBanner(
                      clickable: false,
                    ),
                    const SizedBox(height: 16),
                    MenuItem(
                        title: 'Full name',
                        icon: Icons.person,
                        onTap: () => AutoRouter.of(context).push(const EditFullNameRoute())),
                    const SizedBox(height: 16),
                    MenuItem(
                      title: 'Phone number',
                      icon: Icons.phone_outlined,
                      onTap: () => AutoRouter.of(context)
                          .push(EditPhoneNumberRoute(currentPhone: state.userProfile?.phonenumber ?? '')),
                    ),
                    const SizedBox(height: 16),
                    MenuItem(
                        title: 'Email',
                        icon: Icons.email_outlined,
                        onTap: () => AutoRouter.of(context).push(const EditEmailRoute())),
                    const SizedBox(height: 16),
                    MenuItem(
                      title: 'Change Password',
                      icon: Icons.password_outlined,
                      onTap: () => AutoRouter.of(context).push(const ChangePasswordRoute()),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
