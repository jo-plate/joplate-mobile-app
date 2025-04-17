import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:stroke_text/stroke_text.dart';

class PhoneNumberListingWidget extends StatelessWidget {
  final PhoneListing item;
  final double aspectRatio;
  final double priceLabelFontSize;
  final bool hideLikeButton;

  const PhoneNumberListingWidget({
    super.key,
    required this.item,
    this.aspectRatio = 1.6,
    this.priceLabelFontSize = 18,
    this.hideLikeButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: GestureDetector(
            onTap: () {
              AutoRouter.of(context).push(PhoneDetailsRoute(phoneNumber: item));
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: item.isFeatured
                        ? Colors.yellow[700]!
                        : Colors.grey[500]!,
                    width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: item.item.operatorColor,
                            gradient: LinearGradient(
                              colors: [
                                item.item.operatorColor.withOpacity(0.9),
                                item.item.operatorColor.withOpacity(0.6),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 8),
                          child: LayoutBuilder(builder: (context, constraints) {
                            double fontSize = constraints.maxWidth * 0.13;
                            return StrokeText(
                              text: item.item.number,
                              textStyle: TextStyle(
                                  fontSize: fontSize,
                                  fontFamily: 'poppins',
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: 1.4),
                              strokeColor: Colors.grey[800]!,
                              strokeWidth: 3,
                              textAlign: TextAlign.center,
                            );
                          }),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              _buildPriceLabel(),
                              if (!hideLikeButton)
                                FavoriteButton.plate(
                                  listingId: item.toString(),
                                  iconSize: 24,
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (item.isFeatured)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.amber[700],
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        Localization.of(context).home.featured,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  if (item.isSold)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      decoration: const BoxDecoration(
                        color: Color(0xFF981C1E),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: Text(
                        Localization.of(context).home.sold,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceLabel() {
    if (item.price == 0) {
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
    } else if (item.discountPrice > 0 &&
        item.discountPrice < item.price) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'JOD ${item.discountPrice}',
            style: TextStyle(
              fontSize: priceLabelFontSize,
              fontFamily: 'Mandatory',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF981C1E),
            ),
            maxLines: 1,
          ),
          const SizedBox(width: 8),
          Text(
            'JOD ${item.price}',
            style: TextStyle(
              fontSize: priceLabelFontSize * 0.875,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2,
              color: Colors.grey[600],
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
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
}
