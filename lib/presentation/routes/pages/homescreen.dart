import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Top section (60% of the screen)
          Expanded(
            flex: 6, // 60% of the screen
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 80), // Increased top spacing to push content down
                  const LogoSection(),
                  const SizedBox(height: 10), // Reduced spacing
                  const CategorySection(), // Category section
                ],
              ),
            ),
          ),
          // Bottom section (40% of the screen)
          Expanded(
            flex: 4, // 40% of the screen
            child: const PlatesGrid(), // Plates section
          ),
        ],
      ),
    );
  }
}

// Widget: LogoSection
class LogoSection extends StatelessWidget {
  const LogoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'JOPLATE',
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.red.shade700,
        ),
      ),
    );
  }
}

// Widget: CategorySection
class CategorySection extends StatelessWidget {
  const CategorySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              CategoryCard(
                icon: Icons.directions_car,
                title: "Car Numbers",
                count: "8529",
              ),
              CategoryCard(
                icon: Icons.directions_bike,
                title: "Bike Numbers",
                count: "130",
              ),
            ],
          ),
          const SizedBox(height: 16), // Spacing between rows
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
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

// Widget: CategoryCard
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String count;

  const CategoryCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140, // Increased height
      width: 140, // Increased width
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 50, // Increased icon size
            color: Colors.black,
          ),
          const SizedBox(height: 8), // Spacing
          Text(
            title,
            style: const TextStyle(
              fontSize: 16, // Increased font size
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8), // Spacing
          if (count.isNotEmpty)
            Container(
              width: 50,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red, width: 1.5),
                color: Colors.white,
              ),
              child: Text(
                count,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Widget: PlatesGrid
class PlatesGrid extends StatelessWidget {
  const PlatesGrid({Key? key}) : super(key: key);

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
            price: plates[index]['price']!,
            code: plates[index]['code']!,
          );
        },
      ),
    );
  }
}

// Widget: PlateCard
class PlateCard extends StatelessWidget {
  final String plateNumber;
  final String price;
  final String code;

  const PlateCard({
    Key? key,
    required this.plateNumber,
    required this.price,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red.shade100,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  code,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.red,
                  ),
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              plateNumber,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}