import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        backgroundColor: const Color(0xFF981C1E),
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        // back button
        leading: IconButton(
            onPressed: () {
              context.router.back();
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection("",
                  "Welcome to Joplate! This Privacy Policy outlines how we collect, use, disclose, and protect the information you provide when using our platform for buying and selling phone numbers and car plate numbers."),
              _buildSection(
                  "1. Information We Collect",
                  "a. Personal Information: When you register for an account, we collect your email address, name, phone number, and password.\n\n"
                      "b. Additional Information: When listing phone numbers or car plates, you may provide additional details such as images, descriptions, and price information."),
              _buildSection(
                  "2. How We Use Your Information",
                  "We use the information collected for the following purposes:\n"
                      "- To create and manage user accounts.\n"
                      "- To facilitate the buying and selling of phone numbers and car plates.\n"
                      "- To communicate with you about your account, transactions, and platform updates.\n"
                      "- To improve our services and enhance user experience."
                      "- To verify the identity of sellers and their records."),
              _buildSection("3. Data Security",
                  "We implement industry-standard security measures to protect your personal data from unauthorized access, disclosure, alteration, and destruction. However, no online system is completely secure, and we cannot guarantee absolute security."),
              _buildSection(
                  "4. Sharing of Information",
                  "a. Third-Party Service Providers: We may share your information with third-party service providers to help us deliver our services. These providers are required to keep your information confidential.\n\n"
                      "b. Legal Compliance: We may disclose your information if required by law or when necessary to protect our rights, interests, or the safety of others."),
              _buildSection(
                  "5. Your Choices and Rights",
                  "a. Account Information: You can review and update your account details within the app settings.\n\n"
                      "b. Marketing Communications: You may opt out of promotional emails by following the instructions provided in the emails."),
              _buildSection("6. Children's Privacy",
                  "Joplate is not intended for individuals under the age of 13. We do not knowingly collect personal information from children."),
              _buildSection("7. Changes to This Privacy Policy",
                  "We may update this Privacy Policy periodically to reflect changes in our practices, legal requirements, or operational needs. Any significant updates will be communicated through our website or other official channels."),
              _buildSection(
                  "8. Contact Us",
                  "If you have any questions, concerns, or requests regarding this Privacy Policy, please contact us at:\n\n"
                      "**Website:** [Insert Website]\n"
                      "**Email:** [Insert Email]\n"
                      "**Address:** [Insert Address]\n\n"
                      "By using Joplate, you agree to the terms outlined in this Privacy Policy."),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
