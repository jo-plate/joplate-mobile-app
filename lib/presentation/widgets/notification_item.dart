import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/strings.dart';

class NotificationItem extends StatelessWidget {
  final UserNotification notification;
  final VoidCallback onMarkAsRead;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.onMarkAsRead,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: notification.read ? 1 : 3,
      color: notification.read ? null : Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: notification.read
            ? BorderSide.none
            : BorderSide(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                width: 1,
              ),
      ),
      child: InkWell(
        onTap: () {
          if (!notification.read) {
            onMarkAsRead();
          }
          _handleNavigation(context);
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (!notification.read)
                    Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  Expanded(
                    child: Text(
                      notification.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: notification.read ? FontWeight.normal : FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    notification.timestamp != null ? formatCreatedAt(notification.timestamp!, context) : '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              if (notification.body.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    notification.body,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNavigation(BuildContext context) {
    if (notification.type == 'plate_listing' && notification.targetId != null) {
      AutoRouter.of(context).push(PlatesDetailsRoute(listingId: notification.targetId!));
    } else if (notification.type == 'phone_listing' && notification.targetId != null) {
      AutoRouter.of(context).push(PhoneDetailsRoute(listingId: notification.targetId!));
    } else if (notification.type == 'user_profile' && notification.targetId != null) {
      AutoRouter.of(context).push(UserProfileRoute(userId: notification.targetId!));
    } else if (notification.type == 'plate_request' && notification.targetId != null) {
      AutoRouter.of(context).push(PlateRequestDetailsRoute(requestId: notification.targetId!));
    } else if (notification.type == 'phone_request' && notification.targetId != null) {
      AutoRouter.of(context).push(PhoneRequestDetailsRoute(phoneNumberRequestId: notification.targetId!));
    }
  }
}
