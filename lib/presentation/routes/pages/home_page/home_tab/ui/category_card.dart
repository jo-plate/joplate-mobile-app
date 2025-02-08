import 'package:flutter/material.dart';
import 'package:joplate/presentation/widgets/pill.dart';

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;

  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 24,
                  color: Colors.black,
                ),
                const SizedBox(
                  width: 4,
                  height: 4,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 4,
                  height: 4,
                ),
                if (count.isNotEmpty)
                  Pill(
                    text: count,
                    size: PillSize.small,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
