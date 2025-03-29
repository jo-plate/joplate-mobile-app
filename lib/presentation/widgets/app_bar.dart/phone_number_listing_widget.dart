import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
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

  Color _getOperatorColor() {
    if (item.number.startsWith('079')) {
      return Colors.blue;
    } else if (item.number.startsWith('078')) {
      return const Color(0xFFCCDB37); // Greeny yellow for Umniah
    } else if (item.number.startsWith('077')) {
      return Colors.orange;
    }
    return Colors.grey[500]!;
  }

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
                border: Border.all(color: _getOperatorColor(), width: 2),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFEFEFEF),
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                double fontSize = constraints.maxWidth * 0.14;
                                return Text(
                                  item.number,
                                  style: TextStyle(
                                    fontSize: fontSize,
                                    fontFamily: 'Mandatory',
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              }
                            ),
                          ),
                          Row(
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
                        ],
                      ),
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
