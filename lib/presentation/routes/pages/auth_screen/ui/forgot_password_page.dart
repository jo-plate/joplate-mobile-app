import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/utils/validators.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool isSubmitting = false;
  bool resetEmailSent = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

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
        return Scaffold(
          appBar: AppBar(
            title: Text(m.auth.reset_password_title),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: resetEmailSent ? _buildSuccessView(context) : _buildResetForm(context),
            ),
          ),
        );
      },
    );
  }

  Widget _buildResetForm(BuildContext context) {
    final m = Localization.of(context);
    final primaryColor = Theme.of(context).colorScheme.primary;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          Text(
            m.auth.reset_password_description,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 8),
          Text(
            m.auth.reset_password_instructions,
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 30),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            validator: Validators.validateEmail,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              labelText: m.auth.email,
              prefixIcon: Icon(Icons.email_outlined, color: primaryColor.withOpacity(0.8)),
              hintText: m.auth.enter_email,
            ),
            textInputAction: TextInputAction.done,
            enabled: !isSubmitting,
            onFieldSubmitted: (_) => _handleSubmit(),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: isSubmitting ? null : _handleSubmit,
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
                    m.auth.send_reset_code,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
          ),
          const SizedBox(height: 20),
          OutlinedButton(
            onPressed: () => AutoRouter.of(context).maybePop(),
            style: OutlinedButton.styleFrom(
              foregroundColor: primaryColor,
              side: BorderSide(color: primaryColor),
            ),
            child: Text(
              m.auth.cancel,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessView(BuildContext context) {
    final m = Localization.of(context);
    final primaryColor = Theme.of(context).colorScheme.primary;

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
          m.auth.reset_sent,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          m.auth.check_email_instructions,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () => AutoRouter.of(context).maybePop(),
          child: Text(
            m.auth.signin,
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

  void _handleSubmit() async {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailController.text.trim();
      try {
        await injector<AuthCubit>().sendPasswordResetEmail(email);
        setState(() {
          resetEmailSent = true;
        });

        // Navigate to verification code page after a short delay
        // Future.delayed(const Duration(seconds: 2), () {
        //   AutoRouter.of(context).push(VerificationCodeRoute(email: email));
        // });
      } catch (e) {
        // Error already handled in the BlocConsumer
      }
    }
  }
}
