import 'package:flutter/material.dart';
import 'package:joplate/messages.i18n.dart';
import 'package:joplate/messages_ar.i18n.dart';

class LocalizationProvider extends InheritedWidget {
  final Messages messages;

  const LocalizationProvider({
    Key? key,
    required this.messages,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(LocalizationProvider oldWidget) {
    // Rebuild dependents if the messages instance changes
    return oldWidget.messages != messages;
  }
}

/// A simple static helper to get the correct `Messages` instance from the [BuildContext].
///
/// Usage in any widget:
///
/// ```dart
/// final m = Localization.of(context);
/// print(m.home.featured_numbers);
/// ```
class Localization {
  static Messages of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<LocalizationProvider>();
    assert(provider != null, 'No LocalizationProvider found in context');
    return provider!.messages;
  }

  /// Returns an instance of [Messages] or [MessagesAr], depending on [languageCode].
  /// For example:
  /// ```dart
  /// final messages = Localization.getMessages('ar'); // Arabic
  /// ```
  static Messages getMessages(String languageCode) {
    switch (languageCode) {
      case 'ar':
        return const MessagesAr();
      default:
        return const Messages(); // English fallback
    }
  }
}
