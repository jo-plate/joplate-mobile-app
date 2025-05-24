import 'package:flutter/material.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/localization/localization_cubit.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

class FeaturedRibbon extends StatelessWidget {
  final String? text;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;

  const FeaturedRibbon({
    super.key,
    this.text,
    this.backgroundColor = const Color(0xFFFFC107),
    this.textColor = Colors.white,
    this.fontSize = 12,
  });

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isRTL = injector<LocalizationCubit>().state.languageCode == 'ar';

    return Positioned(
      bottom: 20,
      right: isRTL ? null : -20,
      left: isRTL ? -20 : null,
      child: Transform.rotate(
        angle: isRTL ? 0.7854 : -0.7854,
        child: Container(
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text ?? m.home.featured,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
