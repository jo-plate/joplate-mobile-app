import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_widget.dart';

class PlateNumberListingWidget extends StatelessWidget {
  final Listing<PlateNumber> item;
  final PlateShape shape;
  final bool isFeatured;
  const PlateNumberListingWidget(
      {super.key, required this.item, this.shape = PlateShape.horizontal, this.isFeatured = false});

  bool get isVertical => shape == PlateShape.vertical;
  bool get isHorizontal => shape == PlateShape.horizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow[700]!, width: 2),
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PlateNumberWidget(
                plate: item.data,
                shape: shape,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  _buildPriceLabel(),
                  const Spacer(),
                  _buildFavoriteIcon(),
                ],
              ),
            ],
          ),
        ));
  }

// show price normally
// if there's a discount, normal price should be strikethrough
// show discounted price and normal price next to each other, with normal price strikethrough and smaller font size
  Widget _buildPriceLabel() {
    if (item.price == null) {
      return Text(
        'Call for Price',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Colors.red[700],
        ),
      );
    }
    if (item.discountPrice == null) {
      return Text(
        '${item.price} JOD',
        style: const TextStyle(
          fontSize: 12,
          fontFamily: 'Mandatory',
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${item.discountPrice} JOD ',
          style: TextStyle(
            fontSize: 14,
            fontFamily: 'Mandatory',
            fontWeight: FontWeight.w700,
            color: Colors.red[700],
          ),
        ),
        Text(
          '${item.price} JOD',
          style: const TextStyle(
            fontSize: 12,
            // fontFamily: 'Mandatory',
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.lineThrough,
            decorationStyle: TextDecorationStyle.solid,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  //build heart icon to add to favorites
  Widget _buildFavoriteIcon() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: Icon(
          Icons.favorite_border,
          color: Colors.red[700],
          size: 22,
        ),
        onPressed: () {},
      ),
    );
  }
}

class PriceLabel extends StatelessWidget {
  const PriceLabel({
    super.key,
    required this.price,
    this.currency = 'JOD',
    this.isDiscounted = false,
  });

  final double price;
  final String currency;
  final bool isDiscounted;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$currency $price',
          style: TextStyle(
            fontSize: isDiscounted ? 14 : 16,
            fontFamily: 'Mandatory',
            fontWeight: FontWeight.w600,
            color: isDiscounted ? Colors.red[700] : Colors.black,
            decoration: isDiscounted ? TextDecoration.lineThrough : TextDecoration.none,
          ),
        ),
      ],
    );
  }
}
