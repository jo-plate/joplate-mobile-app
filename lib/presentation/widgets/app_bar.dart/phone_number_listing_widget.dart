import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';

class PhoneNumberListingWidget extends StatelessWidget {
  final PhoneNumber item;
  final bool isFeatured;
  final double aspectRatio;
  final double priceLabelFontSize;
  final bool hideLikeButton;

  const PhoneNumberListingWidget(
      {super.key,
      required this.item,
      required this.isFeatured,
      this.aspectRatio = 1.5,
      this.priceLabelFontSize = 16,
      this.hideLikeButton = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: GestureDetector(
          onTap: () {
            // AutoRouter.of(context).push(PlatesDetailsRoute(plateNumber: item));
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text((item).number, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          _buildPriceLabel(),
                          const SizedBox(height: 2),
                          if (!hideLikeButton)
                            FavoriteButton.plate(
                              listingId: item.toString(),
                              iconSize: 20,
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (isFeatured) _buildFeaturedRibbon()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceLabel() {
    if (item.ad.priceHidden) {
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
    } else if (item.ad.discountPrice > 0 && item.ad.discountPrice < item.ad.price) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'JOD ${item.ad.discountPrice} ',
            style: TextStyle(
              fontSize: priceLabelFontSize,
              fontFamily: 'Mandatory',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF981C1E),
            ),
            maxLines: 1,
          ),
          Text(
            '${item.ad.price}',
            style: TextStyle(
              fontSize: priceLabelFontSize * 0.875,
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
    } else {
      return Text(
        '${item.ad.price} JOD',
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
}
