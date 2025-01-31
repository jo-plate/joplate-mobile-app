import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/login_input.dart';
import 'package:joplate/domain/dto/signup_input.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, required this.onPressed});

  final void Function(SignupInput input) onPressed;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
