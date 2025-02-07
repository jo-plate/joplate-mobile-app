import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import '../../../../../widgets/app_bar.dart/plate_number_widget.dart';

class PlatesGrid extends StatelessWidget {
  const PlatesGrid({super.key, this.itemList = const []});

  final List<PlateNumber> itemList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(20)),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: itemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: horizontalPlateAspectRatio,
        ),
        itemBuilder: (context, index) {
          return PlateNumberWidget(
            plate: itemList[index],
            shape: PlateShape.horizontal,
          );
        },
      ),
    );
  }
}
