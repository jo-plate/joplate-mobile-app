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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              m.terms.effective_date,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(m.terms.intro),
            const SizedBox(height: 16),
            Text(
              m.terms.acceptance,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(m.terms.acceptance_text),
            const SizedBox(height: 16),
            Text(
              m.terms.user_accounts,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '${m.terms.account_1}\n'
              '${m.terms.account_2}\n'
              '${m.terms.account_3}\n'
              '${m.terms.account_4}',
            ),
            const SizedBox(height: 16),
            Text(
              m.terms.listings,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '${m.terms.listing_1}\n'
              '${m.terms.listing_2}\n'
              '${m.terms.listing_3}\n'
              '${m.terms.listing_4}',
            ),
            const SizedBox(height: 16),
            Text(
              m.terms.prohibited,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '${m.terms.prohibited_1}\n'
              '${m.terms.prohibited_2}\n'
              '${m.terms.prohibited_3}\n'
              '${m.terms.prohibited_4}\n'
              '${m.terms.prohibited_5}',
            ),
            const SizedBox(height: 16),
            Text(
              m.terms.termination,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(m.terms.termination_text),
            const SizedBox(height: 16),
            Text(
              m.terms.changes,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(m.terms.changes_text),
            const SizedBox(height: 16),
            Text(
              m.terms.contact,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(m.terms.contact_text),
          ],
        ),
      ),
    );
  }
}
