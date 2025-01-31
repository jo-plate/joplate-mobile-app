import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/login_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.onPressed});

  final void Function(LoginInput input) onPressed;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Placeholder(),
        ],
      ),
    );
  }
}
