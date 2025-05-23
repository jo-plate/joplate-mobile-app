import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/login_form.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/signup_form.dart';
import 'package:joplate/presentation/routes/pages/home_page/home_tab/ui/logo_section.dart';
import 'package:joplate/presentation/widgets/social_links.dart';

@RoutePage()
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {}); // Rebuild UI to update active/inactive tab styling
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const primaryColor = Color(0xFF981C1E);

    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.isLoggedIn) AutoRouter.of(context).maybePopTop();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            elevation: 0,
          ),
          // TabBarView for Sign in and Sign up tabs
          body: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - AppBar().preferredSize.height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: LogoSection(size: 125),
                      ),
                      TabBar(
                        controller: _tabController,
                        indicator: const BoxDecoration(),
                        dividerColor: Colors.transparent,
                        labelPadding: EdgeInsets.zero,
                        tabAlignment: TabAlignment.fill,
                        tabs: [
                          // Custom Tabs
                          _buildCustomTab(
                            text: m.auth.signin,
                            isActive: _tabController.index == 0,
                            primaryColor: primaryColor,
                          ),
                          _buildCustomTab(
                            text: m.auth.signup,
                            isActive: _tabController.index == 1,
                            primaryColor: primaryColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 400, // Fixed height for the form section
                        child: TabBarView(
                          controller: _tabController,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            // Sign in Tab Content
                            LoginForm(
                              onPressed: injector<AuthCubit>().loginWithEmailAndPassword,
                            ),

                            // Sign up Tab Content
                            SignupForm(
                              onPressed: injector<AuthCubit>().signUpWithEmailAndPassword,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Column(
                      children: [
                        Text(
                          m.auth.follow_us,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: isDark ? Colors.white70 : Colors.black54,
                              ),
                        ),
                        const SizedBox(height: 8),
                        const SocialLinks(
                          iconSize: 28.0,
                          spacing: 24.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Builds custom tabs with active/inactive styling
  Widget _buildCustomTab({required String text, required bool isActive, required Color primaryColor}) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? primaryColor : Colors.black, // Primary color for active, black for inactive
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w900,
          color: Colors.white, // White text for both active and inactive tabs
        ),
      ),
    );
  }
}
