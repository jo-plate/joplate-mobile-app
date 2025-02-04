import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_number.dart';

class PlateNumberWidget extends StatelessWidget {
  final PlateNumber plate;
  final bool isVertical;

  const PlateNumberWidget({
    super.key,
    required this.plate,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: isVertical ? 1 / 1.2 : 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: isVertical ? _buildVerticalLayout() : _buildHorizontalLayout(),
      ),
    );
  }

  Widget _buildHorizontalLayout() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildJordanLabel(),
        Text(
          "${plate.code} - ${plate.number}",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildJordanLabel(),
        Text(
          "${plate.code}\n${plate.number}",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildJordanLabel() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "الأردن",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "JORDAN",
          style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
