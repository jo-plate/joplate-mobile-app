import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/phone_number_listing_widget.dart';

class PhonesListingGrid extends StatelessWidget {
  const PhonesListingGrid({
    super.key,
    required this.itemList,
    this.shrinkWrap = true,
  });

  final List<PhoneListing> itemList;
  final bool shrinkWrap;
  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    
    if (itemList.isEmpty) {
      return Center(child: Text(m.common.no_items_found));
    }

    return Center(
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: shrinkWrap,
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
