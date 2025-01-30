import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.key,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'You are not logged in',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton(onPressed: () {}, child: const Text('Sign in'))
          ],
        )),
      ),
    );
  }
}
