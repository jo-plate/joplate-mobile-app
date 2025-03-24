import 'package:auto_route/auto_route.dart';
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
        title: Text(m.editProfile.header),
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
                        title: m.editProfile.Full_Name,
                        icon: Icons.person,
                        onTap: () => AutoRouter.of(context).push(const EditFullNameRoute())),
                    const SizedBox(height: 16),
                    MenuItem(
                      title: m.editProfile.phone_number,
                      icon: Icons.phone_outlined,
                      onTap: () => AutoRouter.of(context)
                          .push(const EditPhoneNumberRoute()),
                    ),
                    const SizedBox(height: 16),
                    MenuItem(
                        title: m.editProfile.email,
                        icon: Icons.email_outlined,
                        onTap: () => AutoRouter.of(context).push(const EditEmailRoute())),
                    const SizedBox(height: 16),
                    MenuItem(
                      title: m.editProfile.change_password,
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
