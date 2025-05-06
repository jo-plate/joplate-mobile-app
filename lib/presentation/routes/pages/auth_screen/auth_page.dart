import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
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
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isLoggedIn) AutoRouter.of(context).maybePopTop();
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 251, 251, 251), // Unified background color
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            elevation: 0,
            automaticallyImplyLeading: false,
            flexibleSpace: SafeArea(
              child: Column(
                children: [
                  // Back Button
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF981C1E)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space below the back button

                  // JOPLATE Logo
                  const Text(
                    'JOPLATE',
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF981C1E), // Red color
                    ),
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(200), // Height of TabBar
              child: TabBar(
                controller: _tabController,
                indicator: const BoxDecoration(),
                dividerColor: Colors.transparent,
                tabs: [
                  // Custom Tabs
                  _buildCustomTab(
                    text: 'Sign in',
                    isActive: _tabController.index == 0,
                  ),
                  _buildCustomTab(
                    text: 'Sign up',
                    isActive: _tabController.index == 1,
                  ),
                ],
              ),
            ),
          ),

          // TabBarView for Sign in and Sign up tabs
          body: SafeArea(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Sign in Tab Content
                LoginForm(
                  onPressed: injector<AuthCubit>().loginWithEmailAndPassword,
                ),
            
                // Sign up Tab Placeholder
                SignupForm(
                  onPressed: injector<AuthCubit>().signUpWithEmailAndPassword,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds custom tabs with active/inactive styling
  Widget _buildCustomTab({required String text, required bool isActive}) {
    return Container(
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF981C1E) : Colors.black, // Red for active, black for inactive
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
