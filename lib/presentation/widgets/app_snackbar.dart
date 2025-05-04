import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@singleton
class AppSnackbar {
  static final GlobalKey<ScaffoldMessengerState> _messengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static GlobalKey<ScaffoldMessengerState> get key => _messengerKey;

  static void showSuccess(String message) {
    _show(
      message,
      backgroundColor: Colors.green.shade700,
      icon: Icons.check_circle,
    );
  }

  static void showError(String message) {
    _show(
      message,
      backgroundColor: Colors.red.shade700,
      icon: Icons.error,
    );
  }

  static void _show(String message,
      {required Color backgroundColor, required IconData icon}) {
    final messenger = _messengerKey.currentState;
    if (messenger == null) return;

    messenger.clearSnackBars();
    messenger.showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: backgroundColor,
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(child: Text(message, style: const TextStyle(color: Colors.white))),
          ],
        ),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
