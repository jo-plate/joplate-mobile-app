import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/phone_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_listing_widget.dart';
import 'plate_number_widget.dart';

class PhonesListingGrid extends StatelessWidget {
  const PhonesListingGrid({super.key, this.itemList = const [], this.isFeatured = false});
  final bool isFeatured;
  final List<PhoneNumber> itemList;

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
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: isFeatured ? 1.5 : 1.27,
        ),
        itemBuilder: (context, index) {
          return PhoneNumberListingWidget(isFeatured: itemList[index].ad.isFeatured, item: itemList[index]);
        },
      ),
    );
  }
}
