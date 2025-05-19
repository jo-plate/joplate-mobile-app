import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

@RoutePage()
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.privacy.title),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              m.privacy.effective_date,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(m.privacy.intro),
            const SizedBox(height: 16),
            Text(
              m.privacy.information_collected,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '${m.privacy.personal_info}\n'
              '${m.privacy.user_content}\n'
              '${m.privacy.device_info}\n'
              '${m.privacy.usage_data}',
            ),
            const SizedBox(height: 16),
            Text(
              m.privacy.how_we_use,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '${m.privacy.use_1}\n'
              '${m.privacy.use_2}\n'
              '${m.privacy.use_3}\n'
              '${m.privacy.use_4}\n'
              '${m.privacy.use_5}\n'
              '${m.privacy.use_6}\n'
              '${m.privacy.use_7}',
            ),
            const SizedBox(height: 16),
            Text(
              m.privacy.security,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(m.privacy.security_text),
            const SizedBox(height: 16),
            Text(
              m.privacy.changes,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(m.privacy.changes_text),
            const SizedBox(height: 16),
            Text(
              m.privacy.contact,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(m.privacy.contact_text),
          ],
        ),
      ),
    );
  }
}
