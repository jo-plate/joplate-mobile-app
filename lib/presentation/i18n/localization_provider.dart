import 'package:flutter/material.dart';
import 'package:joplate/messages.i18n.dart';

class LocalizationProvider extends InheritedWidget {
  final Messages messages;

  const LocalizationProvider({
    super.key,
    required this.messages,
    required super.child,
  });

  @override
  bool updateShouldNotify(LocalizationProvider oldWidget) {
    // Rebuild dependents if the messages instance changes
    return oldWidget.messages != messages;
  }
}

// For convenience, let's add a static helper to get messages easily.
class Locatlization {
  static Messages of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<LocalizationProvider>();
    assert(provider != null, 'No Locatlization Provider found in context');
    return provider!.messages;
  }
}
