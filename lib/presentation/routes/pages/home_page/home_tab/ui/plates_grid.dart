import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import '../../../../../widgets/app_bar.dart/plate_number_widget.dart';

class PlatesGrid extends StatelessWidget {
  PlatesGrid({super.key});

  final List<PlateNumber> plates = PlateNumber.mockList(6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: verticalPlateAspectRatio,
        ),
        itemBuilder: (context, index) {
          return PlateNumberWidget(
            plate: plates[index],
            shape: PlateShape.vertical,
          );
        },
      ),
    );
  }
}
