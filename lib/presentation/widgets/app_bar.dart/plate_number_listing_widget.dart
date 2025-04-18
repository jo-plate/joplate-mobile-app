import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';

class PlateNumberListingWidget extends StatelessWidget {
  final PlateListing item;
  final PlateShape shape;
  final bool isSold;
  final double priceLabelFontSize;
  final bool hideLikeButton;

  const PlateNumberListingWidget(
      {super.key,
      required this.item,
      this.shape = PlateShape.horizontal,
      this.isSold = false,
      this.priceLabelFontSize = 16,
      this.hideLikeButton = false});

  bool get isVertical => shape == PlateShape.vertical;
  bool get isHorizontal => shape == PlateShape.horizontal;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(PlatesDetailsRoute(listingId: item.id));
        },
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
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
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlateNumberWidget(
                          plate: item.item,
                          shape: shape,
                        ),
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
            if (item.isFeatured) _buildFeaturedRibbon(context),
            if (item.isSold) _buildSoldRibbon(context)
          ],
        ),
      ),
    );
  }

  Widget _buildPriceLabel() {
    if (item.priceHidden) {
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
    } else if (item.discountPrice > 0 && item.discountPrice < item.price) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'JOD ${item.discountPrice} ',
            style: TextStyle(
              fontSize: priceLabelFontSize,
              fontFamily: 'Mandatory',
              fontWeight: FontWeight.w700,
              color: const Color(0xFF981C1E),
            ),
            maxLines: 1,
          ),
          Text(
            '${item.price}',
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

  Widget _buildFeaturedRibbon(context) {
    final m = Localization.of(context);
    return Positioned(
      bottom: 20,
      right:
          injector<LocalizationCubit>().state.languageCode == 'en' ? -20 : null,
      left:
          injector<LocalizationCubit>().state.languageCode == 'ar' ? -20 : null,
      child: Transform.rotate(
        angle: injector<LocalizationCubit>().state.languageCode == 'en'
            ? -0.7854
            : 0.7854,
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
      left:
          injector<LocalizationCubit>().state.languageCode == 'en' ? -20 : null,
      right:
          injector<LocalizationCubit>().state.languageCode == 'ar' ? -20 : null,
      child: Transform.rotate(
        angle: injector<LocalizationCubit>().state.languageCode == 'en'
            ? -0.7854
            : 0.7854,
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
