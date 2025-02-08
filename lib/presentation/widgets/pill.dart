import 'package:flutter/material.dart';

enum PillSize { small, large }

class Pill extends StatelessWidget {
  const Pill({super.key, required this.text, this.size = PillSize.large});

  final String text;
  final PillSize size;

  bool get isSmall => size == PillSize.small;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isSmall ? 40 : 60,
      height: isSmall ? 18 : 25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.red, width: 1.5),
        color: Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: isSmall ? 10 : 12,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
