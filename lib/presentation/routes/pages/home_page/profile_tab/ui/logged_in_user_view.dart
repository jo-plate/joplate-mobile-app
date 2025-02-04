import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
import 'package:joplate/domain/entities/user_profile.dart';

class LoggedInUserView extends StatelessWidget {
  const LoggedInUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
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

              if (!state.isLoggedIn) {
                return const AnonUserView();
              }


              return _UserProfileView(profile: state.userProfile ?? UserProfile.empty());
            },
          );
        }),
      ),
    );
  }
}

class _UserProfileView extends StatelessWidget {
  final UserProfile profile;

  const _UserProfileView({required this.profile});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionCard(
            title: 'Account Information',
            children: [
              _buildProfileItem('Name', profile.displayName),
              _buildProfileItem('Description', 'Premium user account'),
              // _buildProfileItem('Location', profile.location ?? 'Not specified'),
              _buildProfileItem('Location Description', 'Primary service area'),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionCard(
            title: 'My Current Plan',
            children: [
              _buildProfileItem('Language', 'English'),
              _buildProfileItem('Description', 'Premium subscription'),
              _buildProfileItem('Location', 'Global Access'),
              _buildProfileItem('Description', '24/7 support included'),
            ],
          ),
          const SizedBox(height: 24),
          _buildSectionCard(
            title: 'About developer',
            children: [
              _buildClickableItem('About Us', Icons.info_outline),
              _buildClickableItem('Privacy Policy', Icons.privacy_tip_outlined),
              _buildClickableItem('Terms and conditions', Icons.description_outlined),
              _buildClickableItem('Logout', Icons.logout, injector<AuthCubit>().logout),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF981C1E),
              ),
            ),
            const Divider(height: 24, color: Colors.grey),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value.isNotEmpty ? value : '-',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickableItem(String title, IconData icon, [void Function()? onTap]) {
    return InkWell(
      onTap: () => onTap?.call(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF981C1E), size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
