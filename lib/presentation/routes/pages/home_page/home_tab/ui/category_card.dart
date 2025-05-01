import 'package:flutter/material.dart';
import 'package:joplate/presentation/widgets/pill.dart';

class CategoryCard extends StatelessWidget {
  final Widget iconWidget;

  final String title;
  final String count;
  final void Function()? onTap;
  const CategoryCard({super.key, required this.iconWidget, required this.title, required this.count, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: onTap,
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
              padding: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  iconWidget,
                  const SizedBox(
                    width: 2,
                    height: 2,
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 2,
                    height: 2,
                  ),
                  if (count.isNotEmpty)
                    SizedBox(
                      width: 60,
                      child: Pill(
                        text: count,
                        size: PillSize.small,
                      ),
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
