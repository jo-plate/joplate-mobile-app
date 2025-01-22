import 'package:flutter/material.dart';
import 'plate_card.dart';

class PlatesGrid extends StatelessWidget {
  const PlatesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100, // Background color for plates section
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4, // Two rows, two columns
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two columns
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.5, // Adjust aspect ratio as needed
        ),
        itemBuilder: (context, index) {
          final plates = [
            {'code': '20', 'price': 'AED 135,000', 'number': '22232'},
            {'code': '12', 'price': 'AED 156,000', 'number': '2322'},
            {'code': 'AUD', 'price': 'AUD 158,000', 'number': '77776'},
            {'code': 'AUD', 'price': 'AUD 15,500', 'number': '55099'},
          ];
          return PlateCard(
            plateNumber: plates[index]['number']!,
          );
        },
      ),
    );
  }
}
