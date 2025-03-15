import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';

class PlateNumberListingWidget extends StatelessWidget {
  final PlateNumber item;
  final PlateShape shape;
  final bool isFeatured;
  final double aspectRatio;
  const PlateNumberListingWidget(
      {super.key,
      required this.item,
      this.shape = PlateShape.horizontal,
      required this.isFeatured,
      this.aspectRatio = 1.5});
  bool get isVertical => shape == PlateShape.vertical;
  bool get isHorizontal => shape == PlateShape.horizontal;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(PlatesDetailsRoute(plateNumber: item));
          },
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.yellow[700]!, width: 2),
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
                        children: [
                          PlateNumberWidget(
                            plate: item,
                            shape: shape,
                          ),
                          const SizedBox(height: 8),
                          if (item.originalListing.priceHidden)
                            const Text(
                              'Call for Price',
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Mandatory',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF981C1E),
                              ),
                              maxLines: 1,
                            )
                          else
                            _buildPriceLabel(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isFeatured)
                _buildFeaturedRibbon()
              else ...[
                const SizedBox(height: 8),
                Align(
                    alignment: Alignment.bottomRight,
                    child: FavoriteButton.plate(
                      listingId: item.toString(),
                    )),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedRibbon() {
    return Positioned(
      bottom: 20,
      right: -20,
      child: Transform.rotate(
        angle: -0.7854, // -45 degrees in radians
        child: Container(
          width: 100,
          // height: 30,
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

  Widget _buildPriceLabel() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${item.originalListing.discountPrice} JOD',
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Mandatory',
            fontWeight: FontWeight.w700,
            color: Color(0xFF981C1E),
          ),
          maxLines: 1,
        ),
        Text(
          '${item.originalListing.price} JOD',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.lineThrough,
            decorationStyle: TextDecorationStyle.solid,
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }
}
