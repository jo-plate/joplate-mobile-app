import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

class DisclaimerWidget extends StatelessWidget {
  const DisclaimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            m.platesdetails.important_note,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.payments, color: isDark ? Colors.white70 : const Color(0xFF981C1E)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  m.platesdetails.dont_transfer_money,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, color: isDark ? Colors.white70 : const Color(0xFF981C1E)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  m.platesdetails.meet_in_person,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
