import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    // dark mode
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: isDark
          ? Image.asset("assets/images/logo_dark.png", width: 100, height: 100)
          : Image.asset("assets/images/logo.png", width: 100, height: 100),
    );
  }
}
