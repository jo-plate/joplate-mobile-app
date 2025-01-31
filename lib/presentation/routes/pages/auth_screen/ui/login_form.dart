import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/login_input.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, this.onPressed, this.isLoading = false});

  final Function(LoginInput input)? onPressed;
  final bool isLoading;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
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
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: const Color(0xFF981C1E),
                ),
                onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: widget.isLoading ? null : _handlePasswordReset,
              child: const Text(
                'Reset password',
                style: TextStyle(
                  color: Color(0xFF981C1E),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: widget.isLoading ? null : _handleSubmit,
            child: Text(
              'Sign in',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
            ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: widget.isLoading ? null : _handleGuestLogin,
            child: const Text(
              'Continue as a guest',
              style: TextStyle(
                color: Color(0xFF981C1E),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmit() {
    final input = LoginInput(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    widget.onPressed?.call(input);
  }

  void _handleGuestLogin() {
    // Call your guest login method here
    // Example: context.read<AuthCubit>().loginAnonymously();
  }

  void _handlePasswordReset() {
    // Implement password reset logic here
    // Example: context.read<AuthCubit>().resetPassword(emailController.text.trim());
  }
}
