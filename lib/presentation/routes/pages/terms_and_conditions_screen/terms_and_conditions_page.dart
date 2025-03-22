import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terms and Conditions'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection("1. Introduction",
                  "Welcome to Joplate. Our platform connects sellers of phone numbers or car plate numbers with potential buyers. By using this app, you agree to be bound by these Terms and Conditions. If you do not accept them, you must refrain from using the app."),
              _buildSection("2. Nature of Our Service",
                  "Joplate only provides a listing platform. We do not facilitate any transactions or transfers of funds between users. We do not offer in-app messaging, payment services, or escrow. Joplate is not responsible for any aspect of user-to-user interactions beyond listing advertisements."),
              _buildSection(
                  "3. User Responsibilities",
                  "• You are solely responsible for verifying the legitimacy of any listings and for conducting safe transactions. We do not guarantee or endorse any listings.\n\n"
                      "• Exercise caution and do your own due diligence to avoid scams.\n\n"
                      "• If you choose to share personal or financial information with another user, you do so at your own risk."),
              _buildSection("4. Seller Verification",
                  "We offer a paid verification service for sellers who wish to display a special checkmark. Verification involves additional vetting by Joplate, but does not imply any guarantee of the seller’s identity, reputation, or transaction outcome. Joplate is not liable for the behavior or claims of verified sellers."),
              _buildSection("5. No Liability for Transactions",
                  "Because we do not facilitate or monitor transactions, Joplate will not be liable for any disputes, scams, losses, or damages arising from interactions between buyers and sellers. All transactions and negotiations take place solely between users."),
              _buildSection("6. Disclaimer of Warranties",
                  "Joplate is provided on an “as is” and “as available” basis. We disclaim all warranties, express or implied, to the fullest extent permitted by law. We make no representations or warranties about the accuracy, reliability, or completeness of listings."),
              _buildSection("7. Limitation of Liability",
                  "To the fullest extent permitted by law, Joplate shall not be liable for any direct, indirect, incidental, special, or consequential damages resulting from the use or inability to use the app, including scams, fraud, or personal injury incurred through third-party transactions."),
              _buildSection("8. Changes to Terms",
                  "We may update or modify these Terms and Conditions at any time. Any significant changes will be posted within the app or on our official website. Continued use of Joplate after changes become effective means you accept the updated Terms."),
              _buildSection("9. Governing Law",
                  "These Terms and Conditions shall be governed by and construed in accordance with the laws of your jurisdiction, without regard to its conflict of law provisions."),
              _buildSection(
                  "10. Contact Us",
                  "For questions or concerns regarding these Terms and Conditions, please contact us at:\n\n"
                      "• Email: [Insert Email]\n"
                      "• Address: [Insert Address]\n\n"
                      "By continuing to use Joplate, you acknowledge that you have read and agree to these Terms and Conditions."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          const SizedBox(height: 4),
          Text(
            content,
            style: const TextStyle(fontSize: 16, height: 1.5),
          ),
        ],
      ),
    );
  }
}
