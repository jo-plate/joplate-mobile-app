import 'package:flutter/material.dart';

enum PillSize { small, large }

class Pill extends StatelessWidget {
  const Pill({super.key, required this.text, this.size = PillSize.large});

  final String text;
  final PillSize size;

  bool get isSmall => size == PillSize.small;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Container(
      height: isSmall ? 18 : 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark ? const Color(0xFF3D4266) : const Color(0xFF981C1E),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isSmall ? 10 : 12,
          color: isDark ? Colors.white70 : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
