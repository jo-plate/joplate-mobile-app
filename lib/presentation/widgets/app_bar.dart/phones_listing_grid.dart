import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_listing_widget.dart';

class PhonesListingGrid extends StatelessWidget {
  const PhonesListingGrid({
    super.key,
    required this.itemList,
  });

  final List<PhoneListing> itemList;

  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty) {
      return const Center(child: Text('No items found!'));
    }

    return Center(
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return PhoneNumberListingWidget(
            item: itemList[index],
          );
        },
      ),
    );
  }
}
