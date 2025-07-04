import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/remote_settings.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/anon_user_view.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/theme.dart';
import 'package:joplate/presentation/widgets/menu_item.dart';
import 'package:joplate/presentation/widgets/profile_banner.dart';
import 'package:joplate/presentation/cubits/theme_cubit.dart';
import 'package:joplate/presentation/widgets/social_links.dart';
import 'package:joplate/presentation/widgets/promo_code_dialog.dart';

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
  late final Stream<RemoteSettings> _remoteSettingsStream;

  @override
  void initState() {
    super.initState();

    _authStateStream = FirebaseAuth.instance.authStateChanges();
    _remoteSettingsStream = FirebaseFirestore.instance
        .collection(remoteSettingsCollectionId)
        .doc(remoteSettingsCollectionId)
        .snapshots()
        .map((event) => RemoteSettings.fromJson(event.data() ?? {}));
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return StreamBuilder<User?>(
        stream: _authStateStream,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (snapshot.data != null) ...[
                  _buildProfileHeader(snapshot.data!, widget.profile),
                  const SizedBox(height: 8),
                  _buildFeaturesSection(),
                  const SizedBox(height: 8),
                  MenuItem(
                    title: m.profile.packages,
                    icon: Icons.wallet_giftcard_outlined,
                    onTap: () => AutoRouter.of(context).push(const PlansRoute()),
                  ),
                ] else
                  const AnonUserView(),
                const SizedBox(height: 16),
                _buildSettingsSection(),
                const SizedBox(height: 16),
                _buildDeveloperSection(context),
                const SizedBox(height: 16),
                const SocialLinks(),
                const SizedBox(height: 8),
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
        const SizedBox(width: 8),
        StreamBuilder<RemoteSettings>(
          stream: _remoteSettingsStream,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.promocode) {
              return Expanded(
                child: _buildFeatureCard(
                  icon: Icons.card_giftcard_outlined,
                  label: m.profile.promo_code,
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => const PromoCodeDialog(),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          },
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

  Widget _buildSettingsSection() {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(
          height: 1,
          thickness: 1,
          color: isDark ? const Color(0xFF3D4266) : Colors.grey,
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
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
        const SizedBox(height: 8),
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
        MenuItem(
          title: m.profile.privacy_policy,
          icon: Icons.privacy_tip_outlined,
          onTap: () => AutoRouter.of(context).push(const PrivacyPolicyRoute()),
        ),
        const SizedBox(height: 8),
        MenuItem(
          title: m.profile.terms_conditions,
          icon: Icons.description_outlined,
          onTap: () => AutoRouter.of(context).push(const TermsAndConditionsRoute()),
        ),
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
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text(m.profile.logout),
                content: Text(m.common.confirm_logout),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(m.common.cancel),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      injector<AuthCubit>().logout();
                    },
                    child: Text(m.common.confirm),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
