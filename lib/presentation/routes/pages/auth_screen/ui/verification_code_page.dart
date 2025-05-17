import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

@RoutePage()
class VerificationCodePage extends StatefulWidget {
  final String email;

  const VerificationCodePage({
    super.key,
    required this.email,
  });

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  bool _isVerifying = false;

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.errorMessage != null) {
          AppSnackbar.showError(state.errorMessage!);
        }

        setState(() {
          _isVerifying = state.isLoading;
        });
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(m.auth.verification_code),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    Icons.email_outlined,
                    size: 70,
                    color: Colors.blue,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    m.auth.enter_verification_code,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    m.auth.code_sent_to_email(widget.email),
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    m.auth.code_check_spam,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _codeController,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      labelText: m.auth.verification_code,
                      hintText: m.auth.enter_code_from_email,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return m.auth.please_enter_code;
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (_) => _verifyCode(),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _isVerifying ? null : _verifyCode,
                    child: _isVerifying
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              color: Colors.white,
                            ),
                          )
                        : Text(
                            m.auth.verify_code,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      // Resend the verification code
                      injector<AuthCubit>().sendPasswordResetEmail(widget.email);
                      AppSnackbar.showSuccess(m.auth.code_resent(widget.email));
                    },
                    child: Text(
                      m.auth.resend_code,
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                  TextButton(
                    onPressed: () => AutoRouter.of(context).maybePop(),
                    child: Text(
                      m.auth.back,
                      style: TextStyle(color: primaryColor),
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

  void _verifyCode() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        final code = _codeController.text.trim();
        await injector<AuthCubit>().verifyPasswordResetCode(code);

        // Navigate to reset password page
        AutoRouter.of(context).push(
          ResetPasswordRoute(
            code: code,
            email: widget.email,
          ),
        );
      } catch (e) {
        // Error already handled in the BlocConsumer
      }
    }
  }
}
