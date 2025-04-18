import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:joplate/domain/entities/request.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'package:joplate/presentation/widgets/app_bar.dart/plate_number_request_widget.dart';
import 'plate_number_widget.dart';

class PlatesRequestGrid extends StatelessWidget {
  const PlatesRequestGrid({
    super.key,
    required this.itemList,
  });

  final List<PlateRequest> itemList;

  @override
  Widget build(BuildContext context) {
    if (itemList.isEmpty) {
      return const Center(
        child: Text('No items found!'),
      );
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
          return PlateNumberRequestWidget(
            item: itemList[index],
            shape: PlateShape.horizontal,
          );
        },
      ),
    );
  }
}
