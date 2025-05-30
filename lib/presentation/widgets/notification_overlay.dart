import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/notification_item.dart';

class NotificationOverlay {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static OverlayEntry? _overlayEntry;

  static void show({
    required UserNotification notification,
    required VoidCallback onMarkAsRead,
  }) {
    // Remove any existing overlay
    hide();

    // Get the current context from the navigator key
    final context = navigatorKey.currentContext;
    if (context == null) return;

    // Create the overlay entry
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 8,
        left: 8,
        right: 8,
        child: Material(
          color: Colors.transparent,
          child: NotificationItem(
            notification: notification,
            onMarkAsRead: onMarkAsRead,
          ),
        ),
      ),
    );

    // Insert the overlay
    Overlay.of(context).insert(_overlayEntry!);

    // Auto hide after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      hide();
    });
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
