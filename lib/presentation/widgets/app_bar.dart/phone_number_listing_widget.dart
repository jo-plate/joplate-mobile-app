import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';

class PhoneNumberListingWidget extends StatelessWidget {
  final PhoneNumber item;
  final double aspectRatio;
  final double priceLabelFontSize;
  final bool hideLikeButton;

  const PhoneNumberListingWidget({
    super.key,
    required this.item,
    this.aspectRatio = 1.5,
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
                border: Border.all(color: item.isFeatured ? Colors.yellow[700]! : Colors.grey[500]!, width: 2),
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
                            color: item.operatorColor,
                            gradient: LinearGradient(
                              colors: [
                                item.operatorColor.withOpacity(1),
                                item.operatorColor.withOpacity(0.6),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            //bottom border only
                            // border: Border(
                            //   bottom: BorderSide(
                            //     color: _getOperatorColor(),
                            //     width: 2,
                            //   ),
                            // ),
                            // borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                          child: LayoutBuilder(builder: (context, constraints) {
                            double fontSize = constraints.maxWidth * 0.15;
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Image(image: _getOperatorLogo(), width: fontSize * 2),
                                // const SizedBox(width: 8),
                                Text(
                                  item.number,
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    // not Mandatory
                                    fontFamily: 'poppins',

                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
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
                  if (item.ads.firstOrNull != null) ...[
                    if (item.ads.first.isFeatured)
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
                    if (item.ads.first.isSold)
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceLabel() {
    if (item.ads.isEmpty || item.ads.first.priceHidden) {
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
    } else if (item.ads.first.discountPrice > 0 && item.ads.first.discountPrice < item.ads.first.price) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'JOD ${item.ads.first.discountPrice}',
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
            'JOD ${item.ads.first.price}',
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
        'JOD ${item.ads.first.price}',
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
