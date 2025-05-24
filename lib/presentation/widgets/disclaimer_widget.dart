import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

class DisclaimerWidget extends StatelessWidget {
  const DisclaimerWidget({super.key, this.textColor, this.iconColor});
  final Color? textColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            m.platesdetails.important_note,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textColor),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.payments, color: iconColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  m.platesdetails.dont_transfer_money,
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, color: iconColor),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  m.platesdetails.meet_in_person,
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
