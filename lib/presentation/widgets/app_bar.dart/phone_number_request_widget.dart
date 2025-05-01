import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/phone_number_widget.dart';

class PhoneNumberRequestWidget extends StatelessWidget {
  final PhoneRequest item;
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
          AutoRouter.of(context).push(PhoneRequestDetailsRoute(phoneNumberRequestId: item.id));
        },
        child: Stack(
          fit: StackFit.passthrough,
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[500]!,
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
                    padding: const EdgeInsets.all(6.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: PhoneNumberWidget(phoneNumber: item.item),
                        ),
                        _buildPriceLabel(),
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
