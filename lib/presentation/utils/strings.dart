import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

String formatPrice(num value) {
  return NumberFormat('#,###').format(value);
}

String formatCreatedAt(DateTime createdAt, BuildContext context) {
  final now = DateTime.now();
  final difference = now.difference(createdAt);
  final m = Localization.of(context);
  if (difference.inDays >= 30) {
    return m.datetime.months_ago((difference.inDays / 30).floor().toString());
  } else if (difference.inDays >= 7) {
    return m.datetime.weeks_ago((difference.inDays / 7).floor().toString());
  } else if (difference.inDays > 0) {
    return m.datetime.days_ago(difference.inDays.toString());
  } else if (difference.inHours > 0) {
    return m.datetime.hours_ago(difference.inHours.toString());
  } else if (difference.inMinutes > 0) {
    return m.datetime.minutes_ago(difference.inMinutes.toString());
  } else {
    return m.datetime.just_now;
  }
}

String obfuscatePhoneNumber(String phoneNumber) {
  if (phoneNumber.length <= 5) return phoneNumber;

  final visibleStart = phoneNumber.substring(0, 2);
  final visibleEnd = phoneNumber.substring(phoneNumber.length - 3);
  const hidden = "*****";

  return "$visibleStart$hidden$visibleEnd";
}
