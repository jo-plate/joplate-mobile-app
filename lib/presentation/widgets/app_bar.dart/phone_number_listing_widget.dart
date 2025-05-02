import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/strings.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:joplate/presentation/widgets/phone_number_widget.dart';

class PhoneNumberListingWidget extends StatelessWidget {
  final PhoneListing item;
  final bool disabled;
  final double priceLabelFontSize;
  final bool hideLikeButton;

  const PhoneNumberListingWidget({
    super.key,
    required this.item,
    this.disabled = false,
    this.priceLabelFontSize = 18,
    this.hideLikeButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: disabled || item.isExpired || item.isDisabled
            ? null
            : () {
                AutoRouter.of(context).push(
                  PhoneDetailsRoute(listingId: item.id),
                );
              },
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: item.isFeatured ? const Color(0xFFFFC107) : Colors.grey[500]!,
                  width: 2,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: PhoneNumberWidget(phoneNumber: item.item),
                        ),
                        _buildPriceLabel(),
                        if (!hideLikeButton) ...[
                          const SizedBox(width: 8),
                          FavoriteButton.phone(
                            listingId: item.id,
                            iconSize: 24,
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (item.isSold || item.isExpired)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            if (item.isFeatured) _buildFeaturedRibbon(context),
            if (item.isSold) _buildSoldRibbon(context),
          ],
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
    } else if (item.discountPrice > 0 && item.discountPrice < item.price) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Text(
            'JOD ${formatPrice(item.discountPrice)}',
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
            ' ${formatPrice(item.price)}',
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
        'JOD ${formatPrice(item.price)}',
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
            color: const Color(0xFFFFC107),
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
