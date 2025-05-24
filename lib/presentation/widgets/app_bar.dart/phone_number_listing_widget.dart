import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/duration_ago_widget.dart';
import 'package:joplate/presentation/widgets/featured_ribbon.dart';
import 'package:joplate/presentation/widgets/phone_number_widget.dart';
import 'package:joplate/presentation/widgets/price_label_widget.dart';
import 'package:joplate/presentation/widgets/top_ribbon.dart';

class PhoneNumberListingWidget extends StatelessWidget {
  final PhoneListing item;
  final bool disabled;
  final double priceLabelFontSize;
  final bool hideLikeButton;
  const PhoneNumberListingWidget({
    super.key,
    required this.item,
    this.disabled = false,
    this.priceLabelFontSize = 16,
    this.hideLikeButton = false,
  });

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: GestureDetector(
        onTap: disabled
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
                  color: item.isFeatured
                      ? const Color(0xFFFFC107)
                      : isDark
                          ? const Color(0xFF3D4266)
                          : Colors.grey[500]!,
                  width: 2,
                ),
                color: isDark ? const Color(0xFF2D334D) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PhoneNumberWidget(phoneNumber: item.item),
                        const SizedBox(height: 8),
                        PriceLabelWidget(
                          price: item.price.toDouble(),
                          discountPrice: item.discountPrice.toDouble(),
                          priceHidden: item.priceHidden,
                          fontSize: priceLabelFontSize,
                        ),
                        if (item.createdAt != null) ...[
                          const SizedBox(height: 4),
                          DurationAgoWidget(
                            createdAt: item.createdAt!,
                          ),
                        ],
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
            if (item.isFeatured) FeaturedRibbon(text: m.home.featured),
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

}
