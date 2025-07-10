import 'dart:io';
import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DelayedUpgradeAlert extends StatefulWidget {
  final Widget child;
  final Upgrader upgrader;
  final GlobalKey<NavigatorState>? navigatorKey;

  const DelayedUpgradeAlert({
    super.key,
    required this.child,
    required this.upgrader,
    this.navigatorKey,
  });

  @override
  State<DelayedUpgradeAlert> createState() => _DelayedUpgradeAlertState();
}

class _DelayedUpgradeAlertState extends State<DelayedUpgradeAlert> {
  @override
  void initState() {
    super.initState();
    // Delay the upgrade check until after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkForUpgrade();
    });
  }

  void _checkForUpgrade() async {
    // Wait a bit more to ensure Navigator is fully available
    await Future.delayed(const Duration(milliseconds: 500));

    // Try to manually initialize the upgrader and wait for version check
    print('=== STARTING UPGRADE CHECK ===');

    try {
      // Force the upgrader to check for updates
      await widget.upgrader.initialize();

      // Wait a bit more for the network request to complete
      await Future.delayed(const Duration(seconds: 2));

      // Log upgrader information after initialization
      print('=== UPGRADER DEBUG INFO ===');
      print('Current App Store Version: ${widget.upgrader.currentAppStoreVersion}');
      print('Current Installed Version: ${widget.upgrader.currentInstalledVersion}');
      print('Should Display Upgrade: ${widget.upgrader.shouldDisplayUpgrade()}');
      print('Release Notes: ${widget.upgrader.releaseNotes}');
      print('Upgrader Type: ${widget.upgrader.runtimeType}');
      print('Min App Version: ${widget.upgrader.minAppVersion}');

      // Try to access the app store listing URL
      if (Platform.isIOS) {
        print('iOS App Store URL would be: https://apps.apple.com/app/id6744338144');
      } else if (Platform.isAndroid) {
        print('Google Play Store URL would be: https://play.google.com/store/apps/details?id=com.joplate.app');
      }

      print('=========================');

      if (mounted && widget.upgrader.shouldDisplayUpgrade()) {
        _showUpgradeDialog();
      }
    } catch (e) {
      print('Error during upgrade check: $e');
    }
  }

  void _showUpgradeDialog() {
    if (!mounted) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => _buildUpgradeDialog(context),
    );
  }

  Future<void> _openAppStore() async {
    try {
      late String url;
      String fallbackUrl = '';

      if (Platform.isIOS) {
        // Try multiple URL formats for iOS - Using correct App Store ID
        url = 'https://apps.apple.com/app/id6744338144'; // Universal format without country
        fallbackUrl = 'https://itunes.apple.com/app/id6744338144?mt=8'; // iTunes format
      } else if (Platform.isAndroid) {
        // Google Play Store URL
        url = 'https://play.google.com/store/apps/details?id=com.joplate.app';
      } else {
        print('Unsupported platform for app store URL');
        return; // Unsupported platform
      }

      print('=== APP STORE URL DEBUG ===');
      print('Platform: ${Platform.isIOS ? 'iOS' : 'Android'}');
      print('Primary URL: $url');
      if (fallbackUrl.isNotEmpty) {
        print('Fallback URL: $fallbackUrl');
      }
      print('==========================');

      final Uri uri = Uri.parse(url);

      // Check if the URL is valid
      print('Parsed URI: $uri');
      print('URI scheme: ${uri.scheme}');
      print('URI host: ${uri.host}');
      print('URI path: ${uri.path}');

      if (await canLaunchUrl(uri)) {
        print('Attempting to launch primary URL...');
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        print('Successfully launched app store URL');
      } else {
        print('Primary URL failed to launch: $url');

        // Try fallback URL for iOS
        if (Platform.isIOS && fallbackUrl.isNotEmpty) {
          print('Trying fallback URL...');
          final Uri fallbackUri = Uri.parse(fallbackUrl);

          if (await canLaunchUrl(fallbackUri)) {
            await launchUrl(fallbackUri, mode: LaunchMode.externalApplication);
            print('Successfully launched fallback app store URL');
          } else {
            print('Fallback URL also failed: $fallbackUrl');
          }
        }
      }
    } catch (e) {
      print('Error opening app store: $e');
      print('Error type: ${e.runtimeType}');
    }
  }

  Widget _buildUpgradeDialog(BuildContext context) {
    final m = Localization.of(context);

    return AlertDialog(
      title: Text(m.common.upgrade_app),
      content: Text(m.common.upgrade_app_content),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(m.common.upgrade_later),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, // Always white text for contrast
            backgroundColor: Theme.of(context).primaryColor, // Button background
          ),
          onPressed: () {
            Navigator.of(context).pop();
            _openAppStore();
          },
          child: Text(
            m.common.upgrade_update,
            style: const TextStyle(
              color: Colors.white, // Always white for maximum contrast
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
