import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/signup_input.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, this.onPressed});

  final void Function(SignupInput input)? onPressed;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordHidden = true;

  @override
  void dispose() {
    emailController.dispose();
    displayNameController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: displayNameController,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: 'Display Name',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone number',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            obscureText: passwordHidden,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  passwordHidden ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF981C1E),
                ),
                onPressed: () => setState(() => passwordHidden = !passwordHidden),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              final input = SignupInput(
                email: emailController.text,
                password: passwordController.text,
                displayName: displayNameController.text,
                phonenumber: phoneNumberController.text,
              );
              widget.onPressed?.call(input);
            },
            child: const Text(
              'Sign up',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () => injector<AuthCubit>().loginAnonymously(),
            child: const Text(
              'Continue as a guest',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF981C1E),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
