import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/menu_item.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';

@RoutePage()
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.editprofile.header),
        centerTitle: true,
        elevation: 0,
      ),
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
                        title: m.editprofile.full_name,
                        icon: Icons.person,
                        onTap: () => AutoRouter.of(context).push(const EditFullNameRoute())),
                    const SizedBox(height: 16),
                    MenuItem(
                      title: m.editprofile.phone_number,
                      icon: Icons.phone_outlined,
                      onTap: () => AutoRouter.of(context).push(const EditPhoneNumberRoute()),
                    ),
                    const SizedBox(height: 16),
                    MenuItem(
                        title: m.editprofile.email,
                        icon: Icons.email_outlined,
                        onTap: () => AutoRouter.of(context).push(const EditEmailRoute())),
                    const SizedBox(height: 16),
                    MenuItem(
                      title: m.editprofile.change_password,
                      icon: Icons.password_outlined,
                      onTap: () => AutoRouter.of(context).push(const ChangePasswordRoute()),
                    ),
                    const SizedBox(height: 16),
                    MenuItem(
                      title: m.profile.delete_account,
                      icon: Icons.delete,
                      onTap: () {
                        FirebaseAuth.instance.currentUser?.delete();
                      },
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
