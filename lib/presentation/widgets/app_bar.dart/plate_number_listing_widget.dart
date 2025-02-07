import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';

class PlateNumberListingWidget extends StatelessWidget {
  final Listing<PlateNumber> item;
  final PlateShape shape;
  final bool isFeatured;
  const PlateNumberListingWidget(
      {super.key, required this.item, this.shape = PlateShape.horizontal, this.isFeatured = false});

  bool get isVertical => shape == PlateShape.vertical;
  bool get isHorizontal => shape == PlateShape.horizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.yellow[700]!),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PlateNumberWidget(plate: item.item, shape: shape),
              ),
            ],
          ),
          if (isFeatured)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Featured',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
