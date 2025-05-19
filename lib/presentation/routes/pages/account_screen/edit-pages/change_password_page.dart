import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

@RoutePage()
class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<void> _changePassword() async {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      AppSnackbar.showError("Passwords do not match");
      return;
    }

    if (_newPasswordController.text.length < 6) {
      AppSnackbar.showError("New password must be at least 6 characters");
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final user = _auth.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No user is currently signed in',
        );
      }

      if (user.email == null) {
        throw FirebaseAuthException(
          code: 'invalid-email',
          message: 'User email is not available',
        );
      }

      // First reauthenticate with old credentials
      final oldCredential = EmailAuthProvider.credential(
        email: user.email!,
        password: _oldPasswordController.text,
      );

      await user.reauthenticateWithCredential(oldCredential);

      // Then update the password
      await user.updatePassword(_newPasswordController.text);

      // Reauthenticate with new credentials to maintain session
      final newCredential = EmailAuthProvider.credential(
        email: user.email!,
        password: _newPasswordController.text,
      );
      await user.reauthenticateWithCredential(newCredential);

      // Clear the form
      _oldPasswordController.clear();
      _newPasswordController.clear();
      _confirmPasswordController.clear();

      AppSnackbar.showSuccess("Password changed successfully");
      if (mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'wrong-password':
          message = "Current password is incorrect";
          break;
        case 'weak-password':
          message = "New password is too weak";
          break;
        case 'requires-recent-login':
          message = "Please log in again to change your password";
          break;
        case 'invalid-credential':
          message = "Invalid or expired credentials";
          break;
        default:
          message = e.message ?? "Error changing password";
      }
      AppSnackbar.showError(message);
    } catch (e) {
      AppSnackbar.showError("An unexpected error occurred");
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _oldPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(m.editprofile.change_password)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _oldPasswordController,
              decoration: InputDecoration(labelText: m.editprofile.oldpassword),
              obscureText: true,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _newPasswordController,
              decoration: InputDecoration(labelText: m.editprofile.newpassword),
              obscureText: true,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(labelText: m.editprofile.confirmpassword),
              obscureText: true,
              enabled: !_isLoading,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _isLoading ? null : _changePassword,
              child: _isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(m.editprofile.save),
            ),
          ],
        ),
      ),
    );
  }
}
