import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';

class TrackingService {
  static Future<void> requestTrackingPermission(BuildContext context) async {
    // Check if tracking is available on the device
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;

    // If tracking is not determined, request permission
    if (status == TrackingStatus.notDetermined) {
      // Show a custom dialog explaining why we need tracking
      final bool? shouldRequest = await showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Personalized Experience'),
            content: Text(
              Platform.isIOS
                  ? 'We use tracking to provide you with a better experience, including personalized content and relevant advertisements. This helps us improve our services and keep them free.\n\n'
                      'Your privacy is important to us. You can change this setting anytime in your device settings.'
                  : 'We use tracking to provide you with a better experience, including personalized content and relevant advertisements. This helps us improve our services and keep them free.\n\n'
                      'Your privacy is important to us. You can change this setting anytime in your device settings.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Not Now'),
              ),
              FilledButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Allow'),
              ),
            ],
          );
        },
      );

      if (shouldRequest == true) {
        // Request tracking authorization
        await AppTrackingTransparency.requestTrackingAuthorization();
      }
    }
  }

  static Future<bool> isTrackingAuthorized() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    return status == TrackingStatus.authorized;
  }
}
