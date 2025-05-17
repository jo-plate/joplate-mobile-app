import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/validators.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  final String code;
  final String email;

  const ResetPasswordPage({
    super.key,
    required this.code,
    required this.email,
  });

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isResetting = false;
  bool _passwordVisible = false;
  bool _resetComplete = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          AppSnackbar.showError(state.errorMessage!);
        }

        setState(() {
          _isResetting = state.isLoading;
        });
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(m.auth.reset_password_title),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: _resetComplete ? _buildSuccessView(context) : _buildResetForm(context),
          ),
        );
      },
    );
  }

  Widget _buildResetForm(BuildContext context) {
    final m = Localization.of(context);
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(
            Icons.lock_reset,
            size: 70,
            color: Colors.blue,
          ),
          const SizedBox(height: 30),
          Text(
            m.auth.create_new_password,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            m.auth.verified_set_password,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          TextFormField(
            controller: _passwordController,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              labelText: m.auth.new_password,
              hintText: m.auth.enter_new_password,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: primaryColor,
                ),
                onPressed: () => setState(() => _passwordVisible = !_passwordVisible),
              ),
            ),
            validator: Validators.validatePassword,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: !_passwordVisible,
            decoration: InputDecoration(
              labelText: m.auth.confirm_password ?? 'Confirm New Password',
              hintText: m.auth.confirm_new_password ?? 'Confirm your new password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            validator: (value) {
              if (value != _passwordController.text) {
                return m.auth.passwords_not_match ?? 'Passwords do not match';
              }
              return null;
            },
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (_) => _resetPassword(),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: _isResetting ? null : _resetPassword,
            child: _isResetting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.0,
                      color: Colors.white,
                    ),
                  )
                : Text(
                    m.auth.reset_password ?? 'Reset Password',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView(BuildContext context) {
    final m = Localization.of(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_outline,
          size: 80,
          color: Colors.green,
        ),
        const SizedBox(height: 30),
        Text(
          m.auth.password_reset_successful ?? 'Password Reset Successful',
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          m.auth.password_reset_success_message ??
              'Your password has been reset successfully. You can now login with your new password.',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            // Clear the route stack and go to login
            AutoRouter.of(context).replaceAll([const AuthRoute()]);
          },
          child: Text(
            m.auth.login ?? 'Login',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void _resetPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final password = _passwordController.text;
        await injector<AuthCubit>().confirmPasswordReset(widget.code, password);
        setState(() {
          _resetComplete = true;
        });
      } catch (e) {
        // Error already handled in the BlocConsumer
      }
    }
  }
}
