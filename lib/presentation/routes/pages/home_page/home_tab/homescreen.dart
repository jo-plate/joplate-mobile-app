import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'ui/logo_section.dart';
import 'ui/category_section.dart';
import 'ui/plates_grid.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top section (60% of the screen)
          const Expanded(
            flex: 6, // 60% of the screen
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 80), // Increased top spacing to push content down
                  LogoSection(),
                  SizedBox(height: 10), // Reduced spacing
                  CategorySection(), // Category section
                ],
              ),
            ),
          ),
          // Bottom section (40% of the screen)
          Expanded(
            flex: 4, // 40% of the screen
            child: PlatesGrid(), // Plates section
          ),
        ],
      ),
    );
  }
}
