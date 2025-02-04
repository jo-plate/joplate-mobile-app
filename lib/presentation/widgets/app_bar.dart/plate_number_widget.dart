import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_number.dart';

enum PlateShape { horizontal, vertical }

class PlateNumberWidget extends StatelessWidget {
  final PlateNumber plate;
  final PlateShape shape;

  bool get isVertical => shape == PlateShape.vertical;

  const PlateNumberWidget({
    super.key,
    required this.plate,
    this.shape = PlateShape.vertical,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth * 0.13;
        double labelFontSize = constraints.maxWidth * 0.07;
        double padding = constraints.maxWidth * 0.03;
        double borderWidth = constraints.maxWidth * 0.01;
        double borderRadius = constraints.maxWidth * 0.04;

        return AspectRatio(
          aspectRatio: isVertical ? 1 / 1.3 : 3.6,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: EdgeInsets.all(padding),
            child: isVertical
                ? _buildVerticalLayout(fontSize, labelFontSize)
                : _buildHorizontalLayout(fontSize, labelFontSize),
          ),
        );
      },
    );
  }

  Widget _buildHorizontalLayout(double fontSize, double labelFontSize) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildJordanLabel(labelFontSize),
        Text(
          "${plate.code} - ${plate.number}",
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout(double fontSize, double labelFontSize) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildJordanLabel(labelFontSize),
        Text(
          "${plate.code}\n${plate.number}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: fontSize * 0.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildJordanLabel(double fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "الأردن",
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),
        Text(
          "JORDAN",
          style: TextStyle(fontSize: fontSize * 0.5, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
