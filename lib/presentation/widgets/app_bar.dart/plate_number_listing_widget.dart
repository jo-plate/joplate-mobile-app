import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/utils/strings.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';
import 'package:joplate/presentation/widgets/top_ribbon.dart';

class PlateNumberListingWidget extends StatelessWidget {
  final PlateListing item;
  final PlateShape shape;
  final bool disabled;
  final double priceLabelFontSize;
  final bool hideLikeButton;

  const PlateNumberListingWidget(
      {super.key,
      required this.item,
      this.shape = PlateShape.horizontal,
      this.disabled = false,
      this.priceLabelFontSize = 16,
      this.hideLikeButton = false});

  bool get isVertical => shape == PlateShape.vertical;
  bool get isHorizontal => shape == PlateShape.horizontal;

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: GestureDetector(
        onTap: disabled
            ? null
            : () {
                AutoRouter.of(context).push(PlatesDetailsRoute(listingId: item.id));
              },
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: isDark ? Colors.black.withOpacity(0.3) : Colors.grey.withOpacity(0.2),
                    blurRadius: 8,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
                border: Border.all(
                    color: item.isFeatured
                        ? const Color(0xFFFFC107)
                        : isDark
                            ? const Color(0xFF3D4266)
                            : Colors.grey[500]!,
                    width: 2),
                color: isDark ? const Color(0xFF2D334D) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PlateNumberWidget(
                          plate: item.item,
                          shape: shape,
                        ),
                        _buildPriceLabel(context),
                        if (item.createdAt != null)
                          CreatedAtLabelWidget(
                            createdAt: item.createdAt!,
                            fontSize: priceLabelFontSize * 0.5,
                          ),
                        if (!hideLikeButton) ...[
                          const SizedBox(height: 2),
                          FavoriteButton.plate(
                            listingId: item.id,
                            iconSize: 20,
                          ),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (item.isSold || item.isExpired || item.isDisabled)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black.withOpacity(0.75) : Colors.grey.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            if (item.isFeatured) _buildFeaturedRibbon(context),
            if (item.isSold)
              TopRibbon(text: m.home.sold, backgroundColor: const Color(0xFF981C1E), textColor: Colors.white),
            if (item.isExpired) TopRibbon(text: m.home.expired),
            if (item.isDisabled)
              TopRibbon(backgroundColor: Colors.black, textColor: Colors.white, text: m.home.disabled)
          ],
        ),
      ),
    );
  }

  Widget _buildPriceLabel(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final m = Localization.of(context);
    if (item.priceHidden) {
      return Text(
        m.platesdetails.call_for_price,
        style: TextStyle(
          fontSize: priceLabelFontSize,
          fontFamily: 'Mandatory',
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white70 : const Color(0xFF981C1E),
        ),
        maxLines: 1,
      );
    } else if (item.discountPrice > 0 && item.discountPrice < item.price) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'JOD ${formatPrice(item.discountPrice)} ',
            style: TextStyle(
              fontSize: priceLabelFontSize,
              fontFamily: 'Mandatory',
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white70 : const Color(0xFF981C1E),
            ),
            maxLines: 1,
          ),
          Text(
            formatPrice(item.price),
            style: TextStyle(
              fontSize: priceLabelFontSize * 0.875,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.lineThrough,
              decorationStyle: TextDecorationStyle.solid,
              color: isDark ? Colors.white38 : Colors.black,
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
          color: isDark ? Colors.white70 : const Color(0xFF981C1E),
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
}

class CreatedAtLabelWidget extends StatelessWidget {
  const CreatedAtLabelWidget({
    super.key,
    required this.createdAt,
    this.fontSize = 12,
  });

  final DateTime createdAt;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      formatCreatedAt(createdAt, context),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: isDark ? Colors.blueGrey.shade300 : Colors.blueGrey,
      ),
    );
  }
}
