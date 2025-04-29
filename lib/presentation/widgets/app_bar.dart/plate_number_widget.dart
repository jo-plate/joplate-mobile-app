import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_number.dart';

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
          double padding = constraints.maxWidth * 0.074;
          double startOffset = constraints.maxWidth * 0.2;
          double numberHeight = constraints.maxWidth * 0.9;
          double digitMinWidth = 10;
          double separatorHeight = numberHeight * 0.043;

          List<String> codeDigits = plate.code.split("");
          List<String> numberDigits = plate.number.split("");

          List<Widget> widgets = [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: codeDigits.map((digit) => _buildDigitContainer(digit, numberHeight, digitMinWidth)).toList(),
              ),
            ),
            // Expanded(flex: 1, child: _buildSeparatorContainer(separatorHeight)),
            _buildSeparatorContainer(separatorHeight),
            Expanded(
              flex: 6,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    numberDigits.map((digit) => _buildDigitContainer(digit, numberHeight, digitMinWidth)).toList(),
              ),
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
                  padding: EdgeInsets.only(top: padding, bottom: padding, left: 0, right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: startOffset),
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: widgets,
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
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Image.asset(
        'assets/images/numbers/number_$digit.png',
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildSeparatorContainer(double height) {
    return Container(
      constraints: const BoxConstraints(minWidth: 8),
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Image.asset(
        'assets/images/numbers/separator.png',
        height: height,
        fit: BoxFit.contain,
      ),
    );
  }
}
