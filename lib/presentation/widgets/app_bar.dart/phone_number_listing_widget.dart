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

  const PhoneNumberListingWidget(
      {super.key,
      required this.item,
      this.aspectRatio = 1.5,
      this.priceLabelFontSize = 16,
      this.hideLikeButton = false});

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
                            if (item.ads.firstOrNull != null) _buildPriceLabel(),
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
                if (item.ads.firstOrNull != null) ...[
                  if (item.ads.first.isFeatured) _buildFeaturedRibbon(context),
                  if (item.ads.first.isSold) _buildSoldRibbon(context)
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPriceLabel() {
    if (item.ads.first.priceHidden) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'JOD ${item.ads.first.discountPrice} ',
            style: TextStyle(
              fontSize: priceLabelFontSize,
              fontFamily: 'Mandatory',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF981C1E),
            ),
            maxLines: 1,
          ),
          Text(
            '${item.ads.first.price}',
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
        '${item.ads.first.price} JOD',
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

  Widget _buildFeaturedRibbon(context) {
    final m = Localization.of(context);
    return Positioned(
      bottom: 20,
      right: injector<LocalizationCubit>().state.languageCode == 'en' ? -20 : null,
      left: injector<LocalizationCubit>().state.languageCode == 'ar' ? -20 : null,
      child: Transform.rotate(
        angle: injector<LocalizationCubit>().state.languageCode == 'en' ? -0.7854 : 0.7854,
        child: Container(
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.yellow[700],
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            m.home.featured,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSoldRibbon(BuildContext context) {
    final m = Localization.of(context);
    return Positioned(
      top: 20,
      left: injector<LocalizationCubit>().state.languageCode == 'en' ? -20 : null,
      right: injector<LocalizationCubit>().state.languageCode == 'ar' ? -20 : null,
      child: Transform.rotate(
        angle: injector<LocalizationCubit>().state.languageCode == 'en' ? -0.7854 : 0.7854,
        child: Container(
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF981C1E),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            m.home.sold,
            style: const TextStyle(
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
