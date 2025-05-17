import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

@RoutePage()
class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.terms.title),
        backgroundColor: const Color(0xFF981C1E),
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            context.router.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Effective Date: January 1, 2023',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Please read these Terms and Conditions carefully before using the Joplate mobile application. By accessing or using our service, you agree to be bound by these Terms and Conditions.',
            ),
            SizedBox(height: 16),
            Text(
              'Acceptance of Terms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'By using our app, you acknowledge that you have read, understood, and agree to be bound by these Terms and Conditions. If you do not agree to these terms, please do not use our services.',
            ),
            SizedBox(height: 16),
            Text(
              'User Accounts',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '• You are responsible for maintaining the confidentiality of your account and password.\n'
              '• You accept responsibility for all activities that occur under your account.\n'
              '• You must be at least 18 years old to use this service.\n'
              '• You agree to provide accurate and complete information when creating an account.',
            ),
            SizedBox(height: 16),
            Text(
              'Listing and Transactions',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '• You are solely responsible for the accuracy of your listings.\n'
              '• All transactions are between buyers and sellers directly. Joplate only facilitates connections.\n'
              '• Joplate does not guarantee the quality, safety, or legality of listed items.\n'
              '• Listing fees and transaction fees may apply as specified in the app.',
            ),
            SizedBox(height: 16),
            Text(
              'Prohibited Activities',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '• Posting false, inaccurate, or misleading information\n'
              '• Using the service for any illegal purpose\n'
              '• Attempting to bypass any security measures\n'
              '• Impersonating another person or entity\n'
              '• Harassing or threatening other users',
            ),
            SizedBox(height: 16),
            Text(
              'Termination',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'We reserve the right to terminate or suspend access to our service immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach the Terms and Conditions.',
            ),
            SizedBox(height: 16),
            Text(
              'Changes to Terms',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'We reserve the right to modify or replace these Terms at any time. We will provide notice of significant changes. Your continued use of the service after such changes constitutes your acceptance of the new Terms.',
            ),
            SizedBox(height: 16),
            Text(
              'Contact Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              'If you have any questions about these Terms, please contact us at legal@joplate.com',
            ),
          ],
        ),
      ),
    );
  }
}
