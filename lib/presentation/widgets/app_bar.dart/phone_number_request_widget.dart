import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'package:joplate/presentation/widgets/favorite_button.dart';

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
      child: AspectRatio(
        aspectRatio: aspectRatio,
        child: GestureDetector(
          onTap: () {
            AutoRouter.of(context).push(PhoneRequestDetailsRoute(phoneNumberRequest: item));
          },
          child: Stack(
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
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(item.phoneNumber!.number,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          _buildPriceLabel(),
                          const SizedBox(height: 2),
                          if (!true)
                            FavoriteButton.plate(
                              listingId: item.toString(),
                              iconSize: 20,
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
      ),
    );
  }

  Widget _buildPriceLabel() {
    if (item.priceHidden) {
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
