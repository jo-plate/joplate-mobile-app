import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key, this.size = 100});
  final double size;

  @override
  Widget build(BuildContext context) {
    // dark mode
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: isDark
          ? Image.asset("assets/images/logo_dark.png", width: size, height: size)
          : Image.asset("assets/images/logo.png", width: size, height: size),
    );
  }
}
