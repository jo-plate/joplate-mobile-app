import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/widgets/menu_item.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';

class LoggedInUserView extends StatelessWidget {
  const LoggedInUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
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
          ProfileBanner(profile: profile),
          const SizedBox(height: 16),
          _buildFeaturesSection(),
          const SizedBox(height: 16),
          const MenuItem(title: 'My Current Plan', icon: Icons.description_outlined),
          const SizedBox(height: 16),
          _buildLanguageSection(),
          const SizedBox(height: 16),
          _buildDeveloperSection(),
          const SizedBox(height: 16),
          _buildLogOutSection(),
        ],
      ),
    );
  }

  Widget _buildFeaturesSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.notes_rounded,
            label: 'Numbers',
            onTap: () {
              // Handle "Numbers" click
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.card_giftcard,
            label: 'Packages',
            onTap: () {
              // Handle "Packages" click
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.draw,
            label: 'Requests',
            onTap: () {
              // Handle "Requests" click
            },
          ),
        ),
      ],
    );
  }

  /// Feature Card
  Widget _buildFeatureCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.white, // Set background color to white
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 28,
                backgroundColor: Colors.white,
                child: Icon(icon, color: const Color(0xFF981C1E), size: 50), // Increased icon size
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Language Section
  Widget _buildLanguageSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey, // Divider color
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            children: [
              const Icon(
                Icons.translate,
                color: Color(0xFF981C1E), // Icon color
                size: 24,
              ),
              const SizedBox(width: 16),
              const Text(
                'Language',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  _buildLanguageButton(
                    'العربية',
                    isSelected: false,
                    onTap: () {
                      // Handle Arabic selection
                    },
                  ),
                  const SizedBox(width: 8),
                  _buildLanguageButton(
                    'English',
                    isSelected: true,
                    onTap: () {
                      // Handle English selection
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.grey, // Divider color
        ),
      ],
    );
  }

  Widget _buildLanguageButton(String label, {required bool isSelected, required VoidCallback onTap}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        foregroundColor: isSelected ? Colors.white : Colors.black,
        backgroundColor: isSelected ? const Color(0xFF981C1E) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: isSelected ? Colors.transparent : const Color(0xFF981C1E),
            width: 1,
          ),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  /// Developer Section
  Widget _buildDeveloperSection() {
    return Column(
      children: [
        _buildClickableItem('About Us', Icons.info_outline),
        _buildClickableItem('Privacy Policy', Icons.privacy_tip_outlined),
        _buildClickableItem('Terms and Conditions', Icons.description_outlined),
        _buildClickableItem('Instructions', Icons.help_outline),
      ],
    );
  }

  Widget _buildLogOutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Log Out Button
        ElevatedButton.icon(
          onPressed: () {
            injector<AuthCubit>().logout();
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFFFFF4F4), // Light pink background
            foregroundColor: const Color(0xFF981C1E), // Red text and icon
            padding: const EdgeInsets.symmetric(vertical: 12), // Adjust vertical padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
          ),
          icon: const Padding(
            padding: EdgeInsets.only(left: 16), // Add left margin to the icon
            child: Icon(Icons.logout, size: 20),
          ),
          label: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 8), // Add left margin to the text
              child: Text(
                'Log Out',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16), // Spacing between buttons

        // Delete My Account Link
        ElevatedButton(
          onPressed: () {
            // Handle delete account action
          },
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 244, 242, 242),
            foregroundColor: Colors.black, // Black text and icon
            padding: const EdgeInsets.symmetric(vertical: 12), // Adjust vertical padding
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12), // Rounded corners
            ),
          ),
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16), // Add left margin to the icon
                child: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Delete My Account',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildClickableItem(String title, IconData icon, [void Function()? onTap]) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF981C1E), size: 24),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            const Icon(Icons.chevron_right, color: Color(0xFF981C1E), size: 26),
          ],
        ),
      ),
    );
  }
}
