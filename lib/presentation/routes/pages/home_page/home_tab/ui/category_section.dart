import 'package:flutter/material.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          const Row(
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
              CategoryCard(
                icon: Icons.request_page,
                title: "Requests",
                count: "2451",
              ),
            ],
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {},
            label: const Text(
              "Quick Sale",
              style: TextStyle(fontSize: 16),
            ),
            icon: Icon(
              Icons.speed,
              color: Colors.red.shade700,
              size: 26,
            ),
          ),
        ],
      ),
    );
  }
}
