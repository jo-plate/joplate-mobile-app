import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/login_form.dart';
import 'package:joplate/presentation/routes/pages/auth_screen/ui/signup_form.dart';

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
    final primaryColor = Theme.of(context).colorScheme.primary;
    final backgroundColor = isDark ? const Color(0xFF1A1B2E) : const Color.fromARGB(255, 251, 251, 251);
    final appBarColor = isDark ? const Color(0xFF252A41) : Colors.white;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isLoggedIn) AutoRouter.of(context).maybePopTop();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: AppBar(
            backgroundColor: appBarColor,
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  // Back Button
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: primaryColor),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  const SizedBox(height: 20), // Space below the back button
      
                  // JOPLATE Logo
                  Text(
                    'JOPLATE',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60), // Height of TabBar
              child: TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
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
            ),
          ),
        ),
        // TabBarView for Sign in and Sign up tabs
        body: TabBarView(
          controller: _tabController,
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
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 13),
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
