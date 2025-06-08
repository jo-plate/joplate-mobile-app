import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_listing_widget.dart';
import 'plate_number_widget.dart';

class PlatesListingsGrid extends StatelessWidget {
  const PlatesListingsGrid({
    super.key,
    required this.itemList,
    this.shrinkWrap = true,
    this.scrollable = false,
  });

  final List<PlateListing> itemList;
  final bool shrinkWrap;
  final bool scrollable;
  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    if (itemList.isEmpty) {
      return Center(
        child: Text(m.common.no_items_found),
      );
    }

    return Center(
      child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        shrinkWrap: shrinkWrap,
        physics: scrollable ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return PlateNumberListingWidget(
            item: itemList[index],
            shape: PlateShape.horizontal,
          );
        },
      ),
    );
  }
}
