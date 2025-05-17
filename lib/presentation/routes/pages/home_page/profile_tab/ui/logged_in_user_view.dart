import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/theme.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';
import 'package:joplate/presentation/widgets/menu_item.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';
import 'package:joplate/presentation/cubits/theme_cubit.dart';

class LoggedInUserView extends StatefulWidget {
  const LoggedInUserView({super.key});

  @override
  State<LoggedInUserView> createState() => _LoggedInUserViewState();
}

class _LoggedInUserViewState extends State<LoggedInUserView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: injector<AuthCubit>(),
        child: Builder(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(value: injector<AuthCubit>()),
              BlocProvider.value(value: injector<ThemeCubit>()),
            ],
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return _UserProfileView(profile: state.userProfile ?? UserProfile.empty());
              },
            ),
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
                  _buildProfileHeader(snapshot.data!, widget.profile),
                  const SizedBox(height: 16),
                  _buildFeaturesSection(),
                  const SizedBox(height: 16),
                  MenuItem(
                    title: m.profile.packages,
                    icon: Icons.wallet_giftcard_outlined,
                    onTap: () => AutoRouter.of(context).push(const PlansRoute()),
                  ),
                  const SizedBox(height: 16),
                  MenuItem(
                    title: m.profile.promo_code,
                    icon: Icons.card_giftcard_outlined,
                    onTap: () => AutoRouter.of(context).push(const AuthRoute()),
                  ),
                ] else
                  const AnonUserView(),
                const SizedBox(height: 16),
                _buildSettingsSection(),
                const SizedBox(height: 16),
                _buildDeveloperSection(context),
                const SizedBox(height: 16),
                if (snapshot.data != null) _buildLogOutSection(),
              ],
            ),
          );
        });
  }

  Widget _buildProfileHeader(User user, UserProfile profile) {
    final m = Localization.of(context);
    final joinDate = user.metadata.creationTime;
    String formattedDate = '';

    if (joinDate != null) {
      formattedDate = DateFormat('MMM d, yyyy').format(joinDate);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ProfileBanner(
          showTicketCount: true,
        ),
        if (joinDate != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0),
            child: Text(
              m.profile.joined_on(formattedDate),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ),

        // Contact buttons for current user
      ],
    );
  }

  Widget _buildFeaturesSection() {
    final m = Localization.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.notes_rounded,
            label: m.profile.myAds,
            onTap: () {
              AutoRouter.of(context).push(const MyNumbersRoute());
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.favorite_border,
            label: m.footer.favorites,
            onTap: () {
              AutoRouter.of(context).push(const FavoritesRoute());
            },
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildFeatureCard(
            icon: Icons.draw,
            label: m.profile.myRequests,
            onTap: () {
              AutoRouter.of(context).push(const MyRequestsRoute());
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: getCardContainerStyle(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: const Color(0xFF981C1E)),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPromoCodeDialog() {
    final controller = TextEditingController();
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Enter Promo Code'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Enter your promo code',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              // Process the promo code
              final code = controller.text.trim();
              if (code.isNotEmpty) {
                Navigator.pop(context);
                AppSnackbar.showSuccess(
                  'Promo code applied: $code',
                );
              }
            },
            child: const Text('Apply', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const primaryColor = Color(0xFF981C1E);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 1,
          thickness: 1,
          color: isDark ? const Color(0xFF3D4266) : Colors.grey,
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            children: [
              const Icon(
                Icons.translate,
                color: Color(0xFF981C1E),
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                m.profile.language,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const Spacer(),
              BlocBuilder<LocalizationCubit, Locale>(
                builder: (context, locale) {
                  final isEnglish = locale.languageCode == 'en';
                  return _buildToggleButton(
                    currentValue: isEnglish ? 'English' : 'العربية',
                    onTap: () {
                      final newLocale = isEnglish ? const Locale('ar') : const Locale('en');
                      context.read<LocalizationCubit>().setLocale(newLocale);
                    },
                  );
                },
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            children: [
              const Icon(
                Icons.palette_outlined,
                color: Color(0xFF981C1E),
                size: 24,
              ),
              const SizedBox(width: 16),
              Text(
                m.profile.theme,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
              const Spacer(),
              BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return _buildToggleButton(
                    currentValue: state.isDarkMode ? m.profile.dark_mode : m.profile.light_mode,
                    onTap: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  );
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        Divider(
          height: 1,
          thickness: 1,
          color: isDark ? const Color(0xFF3D4266) : Colors.grey,
        ),
      ],
    );
  }

  Widget _buildToggleButton({
    required String currentValue,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        foregroundColor: Colors.white,
        backgroundColor: const Color(0xFF981C1E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Text(
            currentValue,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.swap_horiz, size: 18, color: Colors.white),
        ],
      ),
    );
  }

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
        MenuItem(
          title: m.profile.logout,
          icon: Icons.logout,
          onTap: () {
            injector<AuthCubit>().logout();
          },
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
