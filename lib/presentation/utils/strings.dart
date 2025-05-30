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

  // Remove any existing spaces
  final cleanNumber = phoneNumber.replaceAll(' ', '');

  // Handle international format
  final hasPlus = cleanNumber.startsWith('+');
  final startIndex = hasPlus ? 1 : 0;

  // Get the visible parts
  final visibleStart = cleanNumber.substring(startIndex, startIndex + 3);
  final visibleStart2 = cleanNumber.substring(startIndex + 3, startIndex + 5);
  final visibleEnd = cleanNumber.substring(cleanNumber.length - 2);
  const hidden = "*****";

  // Format with spaces
  final buffer = StringBuffer();
  if (hasPlus) buffer.write('+');
  buffer.write(visibleStart);
  buffer.write(' ');
  buffer.write(visibleStart2);
  buffer.write(' ');
  buffer.write(hidden);
  buffer.write(' ');
  buffer.write(visibleEnd);

  return buffer.toString();
}

/// Validates and formats a car number with support for masking.
///
/// [number] is the input car number string
/// [maskWithX] if true, replaces numbers with 'X'
/// [maskWithY] if true, replaces numbers with 'Y'
///
/// Returns a formatted string with the following rules:
/// - Allows only numbers, 'X', and 'Y' characters
/// - Maximum length of 9 characters
/// - Automatically adds spaces between groups of characters
/// - Returns null if the input is invalid
String? formatCarNumber(String number, {bool maskWithX = false, bool maskWithY = false}) {
  // Remove any existing spaces
  final cleanNumber = number.replaceAll(' ', '');

  // Check if the number contains only valid characters
  if (!RegExp(r'^[0-9XY]+$').hasMatch(cleanNumber)) {
    return null;
  }

  // Check maximum length
  if (cleanNumber.length > 9) {
    return null;
  }

  // Apply masking if requested
  String maskedNumber = cleanNumber;
  if (maskWithX) {
    maskedNumber = maskedNumber.replaceAll(RegExp(r'[0-9]'), 'X');
  } else if (maskWithY) {
    maskedNumber = maskedNumber.replaceAll(RegExp(r'[0-9]'), 'Y');
  }

  // Format with spaces
  final buffer = StringBuffer();
  for (int i = 0; i < maskedNumber.length; i++) {
    if (i > 0 && i % 3 == 0) {
      buffer.write(' ');
    }
    buffer.write(maskedNumber[i]);
  }

  return buffer.toString();
}

/// Validates if a car number is in a valid format.
///
/// [number] is the input car number string
/// [allowMasking] if true, allows 'X' and 'Y' characters in the validation
///
/// Returns true if the number is valid according to the following rules:
/// - Contains only numbers (and optionally 'X'/'Y' if allowMasking is true)
/// - Has a length between 1 and 9 characters
bool isValidCarNumber(String number, {bool allowMasking = false}) {
  // Remove any existing spaces
  final cleanNumber = number.replaceAll(' ', '');

  // Check if the number contains only valid characters
  if (allowMasking) {
    if (!RegExp(r'^[0-9XY]+$').hasMatch(cleanNumber)) {
      return false;
    }
  } else {
    if (!RegExp(r'^[0-9]+$').hasMatch(cleanNumber)) {
      return false;
    }
  }

  // Check length
  if (cleanNumber.isEmpty || cleanNumber.length > 9) {
    return false;
  }

  return true;
}
