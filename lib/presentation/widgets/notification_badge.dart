import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/services/fcm_service.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/routes/router.dart';

class NotificationBadge extends StatefulWidget {
  final VoidCallback? onPressed;
  final double iconSize;

  const NotificationBadge({
    super.key,
    this.onPressed,
    this.iconSize = 35,
  });

  @override
  State<NotificationBadge> createState() => _NotificationBadgeState();
}

class _NotificationBadgeState extends State<NotificationBadge> {
  final _fcmService = injector<FCMService>();
  Stream<List<UserNotification>>? _notificationsStream;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeNotificationsStream();
  }

  Future<void> _initializeNotificationsStream() async {
    try {
      _notificationsStream = await _fcmService.getNotificationsStream();
    } catch (e) {
      debugPrint('Error loading notifications stream: $e');
      _notificationsStream = Stream.value([]); // Empty stream on error
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const IconButton(
        icon: Icon(Icons.notifications_outlined),
        onPressed: null,
      );
    }

    return StreamBuilder<List<UserNotification>>(
      stream: _notificationsStream,
      builder: (context, snapshot) {
        final count = snapshot.hasData ? snapshot.data!.where((notification) => !notification.read).length : 0;

        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: Icon(count > 0 ? Icons.notifications_active : Icons.notifications_outlined, size: widget.iconSize),
              onPressed: widget.onPressed ?? () => AutoRouter.of(context).push(const NotificationsRoute()),
              tooltip: 'Notifications',
            ),
            if (count > 0)
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: const Color(0xFF981C1E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    count > 99 ? '99+' : count.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
