import 'dart:math';

import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:stroke_text/stroke_text.dart';

enum PlateShape { horizontal, vertical }

const double horizontalPlateAspectRatio = 3.6;
const double verticalPlateAspectRatio = 1.8;

class PlateNumberWidget extends StatelessWidget {
  final PlateNumber plate;
  final PlateShape shape;

  bool get isVertical => shape == PlateShape.vertical;
  bool get isHorizontal => shape == PlateShape.horizontal;

  const PlateNumberWidget({
    super.key,
    required this.plate,
    this.shape = PlateShape.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: LayoutBuilder(
        builder: (context, constraints) {
          double fontSize = constraints.maxWidth * (isHorizontal ? 0.15 : 0.2);
          double labelFontSize = constraints.maxWidth * (isHorizontal ? 0.07 : 0.12);
          double padding = constraints.maxWidth * 0.07;
          double startOffset = constraints.maxWidth * 0.2;
          double numberHeight = constraints.maxWidth * 0.9;
          double digitMinWidth = 30;
          double separatorHeight = numberHeight * 0.25;
          double separatorWidth = digitMinWidth * 0.5;
          List<String> codeDigits = plate.code.split("");
          List<String> numberDigits = plate.number.split("");

          List<Widget> widgets = [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: codeDigits.map((digit) => _buildDigitContainer(digit, numberHeight, digitMinWidth)).toList(),
            ),
            _buildSeparatorContainer(separatorHeight, separatorWidth),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: numberDigits.map((digit) => _buildDigitContainer(digit, numberHeight, digitMinWidth)).toList(),
            ),
          ];

          return AspectRatio(
            aspectRatio: horizontalPlateAspectRatio,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/numbers/background.png',
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsets.all(padding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: startOffset),
                      Expanded(
                        child: FittedBox(
                          fit: BoxFit.contain,
                          alignment: Alignment.centerLeft,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: widgets,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDigitContainer(String digit, double height, double minWidth) {
    return Container(
      constraints: BoxConstraints(minWidth: minWidth),
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Image.asset(
        'assets/images/numbers/number_$digit.png',
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildSeparatorContainer(double height, double width) {
    return Container(
      constraints: BoxConstraints(minWidth: width),
      padding: const EdgeInsets.symmetric(horizontal: 3.0),
      child: Image.asset(
        'assets/images/numbers/separator.png',
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
