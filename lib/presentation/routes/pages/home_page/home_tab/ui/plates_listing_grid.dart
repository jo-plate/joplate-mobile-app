import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import '../../../../../widgets/app_bar.dart/plate_number_widget.dart';

class PlatesListingsGrid extends StatelessWidget {
  const PlatesListingsGrid({super.key, this.itemList = const [], this.isFeatured = false});
  final bool isFeatured;
  final List<Listing<PlateNumber>> itemList;

  @override
  Widget build(BuildContext context) {

    if (itemList.isEmpty) {
      return const Center(child: Text('No items found!'));
    }

    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: isFeatured ? 1.6 : 1.27,
        ),
        itemBuilder: (context, index) {
          return PlateNumberListingWidget(
            isFeatured: itemList[index].isFeatured,
            item: itemList[index],
            shape: PlateShape.horizontal,
          );
        },
      ),
    );
  }
}
