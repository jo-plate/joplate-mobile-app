import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:stroke_text/stroke_text.dart';

class PhoneNumberRequestWidget extends StatelessWidget {
  final Request<PhoneNumber> item;
  final double aspectRatio;
  final double priceLabelFontSize;

  const PhoneNumberRequestWidget({
    super.key,
    required this.item,
    this.aspectRatio = 1.5,
    this.priceLabelFontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          AutoRouter.of(context).push(PhoneRequestDetailsRoute(phoneNumberRequest: item));
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: item.phoneNumber!.operatorColor,
                          gradient: LinearGradient(
                            colors: [
                              item.phoneNumber!.operatorColor.withOpacity(0.9),
                              item.phoneNumber!.operatorColor.withOpacity(0.6),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                        child: LayoutBuilder(builder: (context, constraints) {
                          double fontSize = constraints.maxWidth * 0.13;
                          return StrokeText(
                            text: item.phoneNumber?.number ?? '',
                            textStyle: TextStyle(
                                fontSize: fontSize,
                                fontFamily: 'poppins',
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                letterSpacing: 1.4),
                            strokeColor: Colors.grey[800]!,
                            strokeWidth: 3,
                            textAlign: TextAlign.center,
                          );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildPriceLabel(),
                      ),
                      if (item.isSold) _buildSoldRibbon(),
                    ],
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
    if (item.priceHidden || item.price == 0) {
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
    } else {
      return Text(
        '${item.price} JOD',
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

  Widget _buildSoldRibbon() {
    return Positioned(
      top: 20,
      left: -20,
      child: Transform.rotate(
        angle: -0.7854,
        child: Container(
          width: 100,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFF981C1E),
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Text(
            'SOLD',
            style: TextStyle(
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
