import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';
import 'package:joplate/presentation/widgets/duration_ago_widget.dart';
import 'package:joplate/presentation/widgets/price_label_widget.dart';
import 'package:joplate/presentation/widgets/top_ribbon.dart';

class PlateNumberRequestWidget extends StatelessWidget {
  final PlateRequest item;
  final PlateShape shape;
  final double priceLabelFontSize;
  final bool disabled;

  const PlateNumberRequestWidget(
      {super.key,
      required this.item,
      this.shape = PlateShape.horizontal,
      this.disabled = false,

      this.priceLabelFontSize = 16});

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
                AutoRouter.of(context).push(PlateRequestDetailsRoute(requestId: item.id));
              },
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: isDark ? const Color(0xFF3D4266) : Colors.grey[500]!, width: 2),
                color: isDark ? const Color(0xFF2D334D) : Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
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
                        const SizedBox(height: 4),
                        PriceLabelWidget(
                          price: 0,
                          isRequested: true,
                          fontSize: priceLabelFontSize,
                        ),
                        if (item.createdAt != null) ...[
                          const SizedBox(height: 4),
                          DurationAgoWidget(
                            createdAt: item.createdAt!,
                          ),
                        ]
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (item.isDisabled || item.isExpired)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black.withOpacity(0.75) : Colors.grey.withOpacity(0.75),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            if (item.isDisabled)
              TopRibbon(
                backgroundColor: Colors.black,
                text: m.home.disabled,
                textColor: Colors.white,
              )
            else if (item.isExpired)
              TopRibbon(
                backgroundColor: Colors.black,
                text: m.home.expired,
                textColor: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
