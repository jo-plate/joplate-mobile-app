import 'package:flutter/material.dart';

class PlateCard extends StatelessWidget {
  final String plateNumber;

  const PlateCard({
    super.key,
    required this.plateNumber,
  });

  @override
  Widget build(BuildContext context) {
    // List of images for digits 0-9
    final List<String> digitImages = List.generate(
      10,
      (index) => 'assets/images/number_$index.jpg', // Adjust the path as needed
    );

    // Method to convert plate number string to a list of image widgets
    List<Widget> buildPlateNumberImages() {
      return plateNumber.split('-').expand((part) {
        return part.split('').map((digit) {
          final index = int.tryParse(digit);
          if (index != null && index >= 0 && index <= 9) {
            return Image.asset(
              digitImages[index],
              height: 40, // Adjust the size of the number images
            );
          }
          return SizedBox.shrink(); // Fallback for non-numeric characters
        }).toList();
      }).toList();
    }

    return Center(
      child: Container(
        width: 250, // Width of the placeholder
        height: 50, // Height of the placeholder
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Placeholder color
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: buildPlateNumberImages(),
        ),
      ),
    );
  }
}
