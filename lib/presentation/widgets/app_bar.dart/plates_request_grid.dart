import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_request_widget.dart';
import 'plate_number_widget.dart';

class PlatesRequestGrid extends StatelessWidget {
  const PlatesRequestGrid({
    super.key,
    required this.itemList,
    this.shrinkWrap = true,
  });

  final List<PlateRequest> itemList;
  final bool shrinkWrap;

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
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          return PlateNumberRequestWidget(
            item: itemList[index],
            shape: PlateShape.horizontal,
          );
        },
      ),
    );
  }
}
