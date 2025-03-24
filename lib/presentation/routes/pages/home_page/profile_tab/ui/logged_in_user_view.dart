import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/menu_item.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';

class LoggedInUserView extends StatefulWidget {
  const LoggedInUserView({super.key});

  @override
  State<LoggedInUserView> createState() => _LoggedInUserViewState();
}

class _LoggedInUserViewState extends State<LoggedInUserView> {
  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(m.profile.title),
        centerTitle: true,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocProvider.value(
        value: injector<AuthCubit>(),
        child: Builder(builder: (context) {
          return BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return _UserProfileView(profile: state.userProfile ?? UserProfile.empty());
            },
          );
        }),
      ),
    );
  }
}

class _UserProfileView extends StatefulWidget {
  final UserProfile profile;

  const _UserProfileView({required this.profile});

  @override
  State<_UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<_UserProfileView> {
  late final Stream<User?> _authStateStream;

  @override
  void initState() {
    super.initState();
    _authStateStream = FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return StreamBuilder<User?>(
        stream: _authStateStream,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (snapshot.data != null) ...[
                  const ProfileBanner(),
                  const SizedBox(height: 16),
                  _buildFeaturesSection(),
                  const SizedBox(height: 16),
                  MenuItem(
                      title: m.profile.my_current_plan,
                      icon: Icons.description_outlined,
                      onTap: () => AutoRouter.of(context).push(const MyPlanRoute())),
                ] else
                  const AnonUserView(),
                const SizedBox(height: 16),
                _buildLanguageSection(),
                const SizedBox(height: 16),
                _buildDeveloperSection(context),
                const SizedBox(height: 16),
                _buildLogOutSection(),
              ],
            ),
          );
        });
  }

  Widget _buildFeaturesSection() {
    final m = Localization.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.notes_rounded,
            label: m.profile.Numbers,
            onTap: () {
              AutoRouter.of(context).push(const MyNumbersRoute());
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.card_giftcard,
            label: m.profile.packages,
            onTap: () {
              // Handle "Packages" click
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.draw,
            label: m.profile.Requests,
            onTap: () {
              AutoRouter.of(context).push(const MyRequestsRoute());
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
    final m = Localization.of(context);
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
              Text(
                m.profile.language,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              BlocBuilder<LocalizationCubit, Locale>(
                builder: (context, locale) {
                  final isEnglish = locale.languageCode == 'en';

                  return Row(
                    children: [
                      _buildLanguageButton(
                        label: 'العربية',
                        isSelected: !isEnglish,
                        onTap: () {
                          context.read<LocalizationCubit>().setLocale(const Locale('ar'));
                        },
                      ),
                      const SizedBox(width: 8),
                      _buildLanguageButton(
                        label: 'English',
                        isSelected: isEnglish,
                        onTap: () {
                          context.read<LocalizationCubit>().setLocale(const Locale('en'));
                        },
                      ),
                    ],
                  );
                },
              )
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

  Widget _buildLanguageButton({
    
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
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
  Widget _buildDeveloperSection(BuildContext context) {
    final m = Localization.of(context);

    return Column(
      children: [
        _buildClickableItem(m.profile.aboutus, Icons.info_outline),
        _buildClickableItem(m.profile.privacy_policy, Icons.privacy_tip_outlined, () {
          AutoRouter.of(context).push(const PrivacyPolicyRoute());
        }),
        _buildClickableItem(m.profile.terms_conditions, Icons.description_outlined,
            () => AutoRouter.of(context).push(const TermsAndConditionsRoute())),
        _buildClickableItem(m.profile.instructions, Icons.help_outline),
      ],
    );
  }

  Widget _buildLogOutSection() {
    final m = Localization.of(context);
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
          label: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 8), // Add left margin to the text
              child: Text(
                m.profile.logout,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 16), // Add left margin to the icon
                child: Icon(
                  Icons.delete,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                m.profile.delete_account,
                style: const TextStyle(
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
