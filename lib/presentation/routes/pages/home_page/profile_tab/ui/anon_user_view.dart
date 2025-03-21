import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/router.dart';

class AnonUserView extends StatelessWidget {
  const AnonUserView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
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
            height: 40,
          ),
          FilledButton(
              onPressed: () {
                AutoRouter.of(context).push(const AuthRoute());
              },
              child: const Text('Sign in'))
        ],
      )),
    );
  }
}
