import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  Stream<int> _getListingCount(String itemType) {
    return FirebaseFirestore.instance
        .collection(platesListingsCollectionId)
        .where("itemType", isEqualTo: itemType)
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  Stream<int> _getRequestsCount() {
    return FirebaseFirestore.instance
        .collection("requests")
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryCard(
                icon: Icons.directions_car,
                title: "Car Numbers",
                itemType: "plateNumber",
                onTap: () =>
                    AutoRouter.of(context).push(const PlatesListingsRoute()),
              ),
              _buildCategoryCard(
                icon: Icons.phone,
                title: "Phone Numbers",
                itemType: "phoneNumber",
                onTap:()=>
                AutoRouter.of(context).push(const PhoneNumbersRoute())
              ),
              _buildRequestCategoryCard(
                icon: Icons.request_page,
                title: "Requests",
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

  Widget _buildCategoryCard(
      {required IconData icon,
      required String title,
      required String itemType,
      Function()? onTap}) {
    return StreamBuilder<int>(
      stream: _getListingCount(itemType),
      builder: (context, snapshot) {
        final count = snapshot.hasData ? snapshot.data.toString() : "Loading";
        return CategoryCard(
            icon: icon, title: title, count: count, onTap: onTap);
      },
    );
  }

  Widget _buildRequestCategoryCard(
      {required IconData icon, required String title}) {
    return StreamBuilder<int>(
      stream: _getRequestsCount(),
      builder: (context, snapshot) {
        final count = snapshot.hasData ? snapshot.data.toString() : "Loading";
        return CategoryCard(icon: icon, title: title, count: count);
      },
    );
  }
}
