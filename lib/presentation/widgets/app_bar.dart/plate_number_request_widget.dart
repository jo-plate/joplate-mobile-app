import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';
import 'package:joplate/presentation/widgets/top_ribbon.dart';

class PlateNumberRequestWidget extends StatelessWidget {
  final PlateRequest item;
  final PlateShape shape;
  final double priceLabelFontSize;
  final bool disabled;
  final bool hideLikeButton;

  const PlateNumberRequestWidget(
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
                border: Border.all(color: Colors.grey[500]!, width: 2),
                color: Colors.white,
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
                        // const SizedBox(height: 2),
                        _buildPriceLabel(),
                        if (item.createdAt != null)
                          CreatedAtLabelWidget(
                            createdAt: item.createdAt!,
                            fontSize: priceLabelFontSize * 0.5,
                          ),
                        if (item.isDisabled || item.isExpired)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.75),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceLabel() {
    return Text(
      'Requested',
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
