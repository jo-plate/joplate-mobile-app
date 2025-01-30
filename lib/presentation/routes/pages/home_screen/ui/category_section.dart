import 'package:flutter/material.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryCard(
                icon: Icons.directions_car,
                title: "Car Numbers",
                count: "8529",
              ),
              CategoryCard(
                icon: Icons.phone,
                title: "Phone Numbers",
                count: "130",
              ),
            ],
          ),
          SizedBox(height: 16), // Spacing between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CategoryCard(
                icon: Icons.speed,
                title: "Quick sale",
                count: "2216",
              ),
              CategoryCard(
                icon: Icons.request_page,
                title: "Requests",
                count: "2451",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
