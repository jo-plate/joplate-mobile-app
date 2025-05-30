import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/notification_item.dart';
import 'package:joplate/main.dart';

class NotificationOverlay {
  static OverlayEntry? _currentOverlay;

  static void show({
    required UserNotification notification,
    VoidCallback? onTap,
  }) {
    final context = MyApp.navigatorKey.currentContext;
    if (context == null) {
      debugPrint('Cannot show notification: No valid context available');
      return;
    }

    _removeCurrentOverlay();

    _currentOverlay = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 8,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: _NotificationCard(
            notification: notification,
            onTap: () {
              _removeCurrentOverlay();
              onTap?.call();
            },
            onDismiss: _removeCurrentOverlay,
          ),
        ),
      ),
    );

    try {
      final overlay = Overlay.of(context);
      if (overlay != null) {
        overlay.insert(_currentOverlay!);

        // Auto dismiss after 5 seconds
        Future.delayed(const Duration(seconds: 5), () {
          _removeCurrentOverlay();
        });
      } else {
        debugPrint('Cannot show notification: No Overlay widget found');
      }
    } catch (e) {
      debugPrint('Error showing notification overlay: $e');
      _currentOverlay = null;
    }
  }

  static void _removeCurrentOverlay() {
    if (_currentOverlay != null) {
      try {
        _currentOverlay!.remove();
      } catch (e) {
        debugPrint('Error removing overlay: $e');
      }
      _currentOverlay = null;
    }
  }
}

class _NotificationCard extends StatelessWidget {
  final UserNotification notification;
  final VoidCallback onTap;
  final VoidCallback onDismiss;

  const _NotificationCard({
    required this.notification,
    required this.onTap,
    required this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 300),
      tween: Tween(begin: 0.0, end: 1.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0, -100 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications, color: Colors.blue.shade700),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        notification.title,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, size: 20),
                      onPressed: onDismiss,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
                if (notification.body.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    notification.body,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
