import 'package:flutter/material.dart';
import 'package:upgrader/upgrader.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UpgradeDebugWidget extends StatefulWidget {
  const UpgradeDebugWidget({super.key});

  @override
  State<UpgradeDebugWidget> createState() => _UpgradeDebugWidgetState();
}

class _UpgradeDebugWidgetState extends State<UpgradeDebugWidget> {
  late Upgrader upgrader;
  String debugInfo = 'Loading...';

  @override
  void initState() {
    super.initState();
    upgrader = Upgrader(
      debugLogging: true,
      countryCode: 'US',
    );
    _loadDebugInfo();
  }

  Future<void> _loadDebugInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();

      // Wait a bit for upgrader to initialize
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        debugInfo = '''
App Information:
- App Name: ${packageInfo.appName}
- Package Name: ${packageInfo.packageName}
- Current Version: ${packageInfo.version}
- Build Number: ${packageInfo.buildNumber}

Upgrade Status:
- Should Display: ${upgrader.shouldDisplayUpgrade()}
- Is Blocked: ${upgrader.blocked()}
- Min App Version: ${upgrader.minAppVersion}

Debug Information:
- Package Name: ${packageInfo.packageName}
- Current Version: ${packageInfo.version}
- Build Number: ${packageInfo.buildNumber}

Note: The upgrader package will check the App Store automatically.
Look at the console logs for detailed upgrade information.
''';
      });
    } catch (e) {
      setState(() {
        debugInfo = 'Error loading debug info: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upgrade Debug'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                debugInfo = 'Refreshing...';
              });
              _loadDebugInfo();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upgrade Debug Information',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: SelectableText(
                  debugInfo,
                  style: const TextStyle(fontFamily: 'monospace'),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Refresh the debug info
                  setState(() {
                    debugInfo = 'Refreshing...';
                  });
                  _loadDebugInfo();
                },
                child: const Text('Refresh Debug Info'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
