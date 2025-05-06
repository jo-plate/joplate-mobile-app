import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';

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
    return Center(
      child: GestureDetector(
        onTap: disabled || item.isDisabled
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
                    padding: const EdgeInsets.all(6),
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
                        if (item.isDisabled)
                          Positioned.fill(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.75),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
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
