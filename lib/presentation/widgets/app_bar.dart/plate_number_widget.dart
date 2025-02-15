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
    return LayoutBuilder(
      builder: (context, constraints) {
        double fontSize = constraints.maxWidth * (isHorizontal ? 0.15 : 0.2);
        double labelFontSize = constraints.maxWidth * (isHorizontal ? 0.07 : 0.12);

        double padding = constraints.maxWidth * (isHorizontal ? 0.05 : 0.03);
        double borderWidth = constraints.maxWidth * 0.01;
        double borderRadius = constraints.maxWidth * 0.04;

        return AspectRatio(
          aspectRatio: isVertical ? verticalPlateAspectRatio : horizontalPlateAspectRatio,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEFEFEF),
              border: Border.all(color: Colors.black, width: borderWidth),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: EdgeInsets.all(padding),
            alignment: Alignment.center,
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildJordanLabel(labelFontSize),
        SizedBox(width: fontSize * 0.5),
        Text(
          "${plate.code} - ${plate.number}",
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Mandatory',
          ),
        ),
      ],
    );
  }

  Widget _buildVerticalLayout(double fontSize, double labelFontSize) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(top: 0, child: _buildJordanLabel(labelFontSize)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                  color: Colors.black,
                  letterSpacing: 4,
                  fontFamily: 'Mandatory',
                  shadows: [
                    Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.white),
                    Shadow(offset: Offset(-1, -1), blurRadius: 2, color: Colors.white),
                  ],
                ),
                children: [
                  TextSpan(text: "${plate.code} \n"),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Text(
                      plate.number,
                      style: TextStyle(
                        fontFamily: 'Mandatory',
                        letterSpacing: 4,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w800,
                        shadows: [
                          Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.white),
                          Shadow(offset: Offset(-1, -1), blurRadius: 2, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildJordanLabel(double fontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: isHorizontal ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
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
