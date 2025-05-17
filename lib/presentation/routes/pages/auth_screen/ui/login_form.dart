import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/login_input.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/utils/validators.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, this.onPressed});

  final Function(LoginInput input)? onPressed;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool isSubmitting = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final primaryColor = Theme.of(context).colorScheme.primary;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.isLoading != isSubmitting) {
          setState(() {
            isSubmitting = state.isLoading;
          });
        }

        if (state.errorMessage != null) {
          AppSnackbar.showError(state.errorMessage!);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: m.auth.email,
                      prefixIcon: Icon(Icons.email_outlined, color: primaryColor.withOpacity(0.8)),
                    ),
                    textInputAction: TextInputAction.next,
                    enabled: !isSubmitting,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: _obscurePassword,
                    validator: Validators.validatePassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      labelText: m.auth.password,
                      prefixIcon: Icon(Icons.lock_outline, color: primaryColor.withOpacity(0.8)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                          color: primaryColor,
                        ),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    enabled: !isSubmitting,
                    onFieldSubmitted: (_) => _handleSubmit(),
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: isSubmitting ? null : _handlePasswordReset,
                      child: Text(
                        m.auth.reset_password,
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isSubmitting ? null : _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      disabledForegroundColor: Colors.grey.shade300,
                      disabledBackgroundColor: Colors.grey.shade600,
                    ),
                    child: isSubmitting
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            m.auth.signin,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: isSubmitting ? null : () => AutoRouter.of(context).maybePop(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor),
                    ),
                    child: Text(
                      m.auth.guest,
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final input = LoginInput(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      widget.onPressed?.call(input);
    }
  }


  void _handlePasswordReset() {
    final m = Localization.of(context);
    final primaryColor = Theme.of(context).colorScheme.primary;
    // Show a dialog to enter email for password reset
    final resetEmailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(m.auth.reset_password_title, style: TextStyle(color: primaryColor)),
        content: TextField(
          controller: resetEmailController,
          decoration: InputDecoration(
            labelText: m.auth.email,
            hintText: m.auth.enter_email,
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(m.auth.cancel),
          ),
          TextButton(
            onPressed: () {
              // Handle password reset logic
              final email = resetEmailController.text.trim();
              if (email.isNotEmpty) {
                // TODO: Implement password reset functionality
                // For now just close the dialog
                Navigator.pop(context);
                AppSnackbar.showSuccess(m.auth.reset_sent);
              }
            },
            style: TextButton.styleFrom(
              foregroundColor: primaryColor,
            ),
            child: Text(m.auth.reset),
          ),
        ],
      ),
    );
  }
}
