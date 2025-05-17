import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/home_page/profile_tab/ui/logged_in_user_view.dart';
import 'package:joplate/presentation/widgets/notification_badge.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Stream<User?> _authStateChanges;

  @override
  void initState() {
    super.initState();
    _authStateChanges = FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(m.profile.title),
        centerTitle: true,
        elevation: 0,
        actions: const [NotificationBadge()],
      ),
      body: StreamBuilder<User?>(
        stream: _authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return const LoggedInUserView();
        },
      ),
    );
  }
}
