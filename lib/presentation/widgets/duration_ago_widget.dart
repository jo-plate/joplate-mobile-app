import 'package:flutter/material.dart';
import 'package:joplate/presentation/utils/strings.dart';

class DurationAgoWidget extends StatelessWidget {
  const DurationAgoWidget({
    super.key,
    required this.createdAt,
    this.fontSize = 14,
  });

  final DateTime createdAt;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      formatCreatedAt(createdAt, context),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: isDark ? const Color.fromRGBO(144, 164, 174, 1) : Colors.blueGrey,
      ),
    );
  }
}
