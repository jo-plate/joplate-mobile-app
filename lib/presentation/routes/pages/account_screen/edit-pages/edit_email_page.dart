import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_snackbar.dart';

@RoutePage()
class EditEmailPage extends StatefulWidget {
  const EditEmailPage({super.key});

  @override
  State<EditEmailPage> createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
  late TextEditingController _emailController;
  late TextEditingController _verificationController;

  bool emailVerificationVisible = false;
  String? verificationId;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: _auth.currentUser?.email ?? '');
    _verificationController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _verificationController.dispose();
    super.dispose();
  }

  Future<void> _sendVerification() async {
    String newEmail = _emailController.text.trim();

    if (newEmail.isEmpty || !RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(newEmail)) {
      AppSnackbar.showError("Please enter a valid email address");
      return;
    }

    try {
      await _auth.currentUser?.verifyBeforeUpdateEmail(newEmail);
      setState(() {
        emailVerificationVisible = true;
      });
      AppSnackbar.showSuccess("Verification email sent to $newEmail. Please check your inbox.");
    } catch (e) {
      AppSnackbar.showError("Failed to send verification email: ${e.toString()}");
    }
  }

  Future<void> _updateEmail() async {
    try {
      await _auth.currentUser?.reload();
      if (_auth.currentUser?.email == _emailController.text.trim()) {
        AppSnackbar.showSuccess("Email updated successfully!");
        Navigator.pop(context);
      } else {
        AppSnackbar.showError("Email update not verified yet.");
      }
    } catch (e) {
      AppSnackbar.showError("Error updating email: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.editprofile.edit_email),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: m.editprofile.email),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            if (emailVerificationVisible)
              TextField(
                controller: _verificationController,
                decoration: const InputDecoration(labelText: 'Enter verification code from email'),
              ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: () {
                if (!emailVerificationVisible) {
                  _sendVerification();
                } else {
                  _updateEmail();
                }
              },
              child:
                  Text(emailVerificationVisible ? m.editprofile.verifyandsave : m.editprofile.send_verification_code),
            ),
          ],
        ),
      ),
    );
  }
}
