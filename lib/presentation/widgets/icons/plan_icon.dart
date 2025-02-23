import 'package:flutter/material.dart';

class PlateIcon extends StatelessWidget {
  final double size;
  final Color color;

  const PlateIcon({
    super.key,
    this.size = 80,
    this.color = Colors.black,
  });

  double get width => size;
  double get height => size * 0.6;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: PlatePainter(color, width, height),
    );
  }
}

class PlatePainter extends CustomPainter {
  final Color color;
  final double width;
  final double height;

  PlatePainter(this.color, this.width, this.height);

  @override
  void paint(Canvas canvas, Size size) {
    final double holePadding = size.width * 0.16;
    final double holeRadius = size.width * 0.065;

    final gradient = LinearGradient(
      colors: [color.withAlpha(120), HSLColor.fromColor(color).withLightness(0.8).toColor(), color.withAlpha(120)],
      stops: const [0.0, 0.5, 1.0],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.fill;

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(size.width * 0.12)),
      paint,
    );

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.045;

    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(size.width * 0.12)),
      borderPaint,
    );

    final holePaint = Paint()..color = color;

    canvas.drawCircle(Offset(holePadding, holePadding), holeRadius, holePaint);
    canvas.drawCircle(Offset(size.width - holePadding, holePadding), holeRadius, holePaint);
    canvas.drawCircle(Offset(holePadding, size.height - holePadding), holeRadius, holePaint);
    canvas.drawCircle(Offset(size.width - holePadding, size.height - holePadding), holeRadius, holePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
