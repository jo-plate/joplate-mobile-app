import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';

class PlateNumberRequestWidget extends StatelessWidget {
  final PlateRequest item;
  final PlateShape shape;
  final double priceLabelFontSize;
  final bool hideLikeButton;

  const PlateNumberRequestWidget(
      {super.key,
      required this.item,
      this.shape = PlateShape.horizontal,
      this.priceLabelFontSize = 16,
      this.hideLikeButton = false});

  bool get isVertical => shape == PlateShape.vertical;
  bool get isHorizontal => shape == PlateShape.horizontal;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // AutoRouter.of(context).push(PlatesDetailsRoute(plateNumber: item.toString()));
        },
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[500]!, width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlateNumberWidget(
                          plate: item.plateNumber!,
                          shape: shape,
                        ),
                        const SizedBox(height: 8),
                        _buildPriceLabel(),
                        const SizedBox(height: 2),
                        if (item.isSold) _buildSoldRibbon(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceLabel() {
    if (item.priceHidden || item.price == 0) {
      return Text(
        'Call for Price',
        style: TextStyle(
          fontSize: priceLabelFontSize,
          fontFamily: 'Mandatory',
          fontWeight: FontWeight.w700,
          color: const Color(0xFF981C1E),
        ),
        maxLines: 1,
      );
    } else {
      return Text(
        'JOD ${item.price}',
        style: TextStyle(
          fontSize: priceLabelFontSize,
          fontFamily: 'Mandatory',
          fontWeight: FontWeight.w700,
          color: const Color(0xFF981C1E),
        ),
        maxLines: 1,
      );
    }
  }

  Widget _buildFeaturedRibbon() {
    return Positioned(
      bottom: 20,
      right: -20,
      child: Transform.rotate(
        angle: -0.7854,
        child: Container(
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.yellow[700],
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'FEATURED',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSoldRibbon() {
    return Positioned(
      top: 20,
      left: -20,
      child: Transform.rotate(
        angle: -0.7854,
        child: Container(
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF981C1E),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'SOLD',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
