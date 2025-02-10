import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/widgets/menu_item.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';

@RoutePage()
class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
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

              if (!state.isLoggedIn) {
                return const AnonUserView();
              }

              return SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProfileBanner(
                      profile: state.userProfile ?? UserProfile.empty(),
                      clickable: false,
                    ),
                    const SizedBox(height: 16),
                    const MenuItem(title: 'Full number', icon: Icons.phone_outlined),
                    const SizedBox(height: 16),
                    const MenuItem(title: 'Phone number', icon: Icons.phone_outlined),
                    const SizedBox(height: 16),
                    const MenuItem(title: 'Email', icon: Icons.email_outlined),
                    const SizedBox(height: 16),
                    const MenuItem(title: 'Change Password', icon: Icons.password_outlined),
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
