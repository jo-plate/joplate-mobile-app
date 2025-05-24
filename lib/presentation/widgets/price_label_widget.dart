import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/utils/strings.dart';

class PriceLabelWidget extends StatelessWidget {
  const PriceLabelWidget({
    super.key,
    required this.price,
    this.discountPrice = 0,
    this.priceHidden = false,
    this.fontSize = 16,
    this.isRequested = false,
  });

  final double price;
  final double discountPrice;
  final bool priceHidden;
  final double fontSize;
  final bool isRequested;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final m = Localization.of(context);

    if (isRequested) {
      return Text(
        m.home.requested,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Mandatory',
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white70 : const Color(0xFF981C1E),
        ),
        maxLines: 1,
      );
    } else if (priceHidden) {
      return Text(
        m.platesdetails.call_for_price,
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Mandatory',
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white : const Color(0xFF981C1E),
        ),
        maxLines: 1,
      );
    } else if (discountPrice > 0 && discountPrice < price) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'JOD ${formatPrice(discountPrice)} ',
            style: TextStyle(
              fontSize: fontSize,
              fontFamily: 'Mandatory',
              fontWeight: FontWeight.w700,
              color: isDark ? Colors.white70 : const Color(0xFF981C1E),
            ),
            maxLines: 1,
          ),
          Text(
            formatPrice(price),
            style: TextStyle(
              fontSize: fontSize * 0.875,
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
        'JOD ${formatPrice(price)}',
        style: TextStyle(
          fontSize: fontSize,
          fontFamily: 'Mandatory',
          fontWeight: FontWeight.w700,
          color: isDark ? Colors.white70 : const Color(0xFF981C1E),
        ),
        maxLines: 1,
      );
    }
  }
}
