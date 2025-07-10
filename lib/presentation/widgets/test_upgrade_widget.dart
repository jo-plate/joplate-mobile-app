import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:joplate/presentation/widgets/upgrade_debug_widget.dart';

class TestUpgradeWidget extends StatelessWidget {
  const TestUpgradeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test Upgrade'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Upgrade Testing',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const Text(
              'This is a test widget to check if the upgrade functionality is working.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UpgradeDebugWidget(),
                  ),
                );
              },
              child: const Text('Open Debug Information'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Create a new upgrader instance and wrap it in UpgradeAlert
                showDialog(
                  context: context,
                  builder: (context) => UpgradeAlert(
                    upgrader: Upgrader(
                      debugDisplayAlways: true,
                      debugDisplayOnce: false,
                      debugLogging: true,
                    ),
                    child: const SizedBox.shrink(),
                  ),
                );
              },
              child: const Text('Force Check Upgrade'),
            ),
            const SizedBox(height: 32),
            const Text(
              'If the upgrade popup should appear, it should show automatically when the app starts or when you tap "Force Check Upgrade".',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
