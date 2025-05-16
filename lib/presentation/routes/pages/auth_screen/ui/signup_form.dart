import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/domain/dto/signup_input.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/utils/validators.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key, this.onPressed});

  final void Function(SignupInput input)? onPressed;

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool passwordHidden = true;
  bool isSubmitting = false;

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
                children: [
                  TextFormField(
                    controller: displayNameController,
                    keyboardType: TextInputType.name,
                    validator: Validators.validateName,
                    decoration: InputDecoration(
                      labelText: 'Display Name',
                      prefixIcon: Icon(Icons.person_outline, color: primaryColor.withOpacity(0.8)),
                    ),
                    textInputAction: TextInputAction.next,
                    enabled: !isSubmitting,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined, color: primaryColor.withOpacity(0.8)),
                    ),
                    textInputAction: TextInputAction.next,
                    enabled: !isSubmitting,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    validator: Validators.validateJordanianPhone,
                    maxLength: 10,
                    decoration: InputDecoration(
                      labelText: 'Phone number',
                      prefixIcon: Icon(Icons.phone_outlined, color: primaryColor.withOpacity(0.8)),
                      hintText: '07X XXX XXXX',
                    ),
                    textInputAction: TextInputAction.next,
                    enabled: !isSubmitting,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: passwordHidden,
                    validator: Validators.validatePassword,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline, color: primaryColor.withOpacity(0.8)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordHidden ? Icons.visibility_off : Icons.visibility,
                          color: primaryColor,
                        ),
                        onPressed: () => setState(() => passwordHidden = !passwordHidden),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    enabled: !isSubmitting,
                    onFieldSubmitted: (_) => _handleSignup(),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: isSubmitting ? null : _handleSignup,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: primaryColor,
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
                        : const Text(
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
                    onPressed: isSubmitting ? null : () => () => AutoRouter.of(context).maybePop(),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor),
                    ),
                    child: Text(
                      'Continue as a guest',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
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

  void _handleSignup() {
    if (_formKey.currentState?.validate() ?? false) {
      final input = SignupInput(
        email: emailController.text.trim(),
        password: passwordController.text,
        displayName: displayNameController.text.trim(),
        phonenumber: phoneNumberController.text.trim(),
      );
      widget.onPressed?.call(input);
    }
  }
}
