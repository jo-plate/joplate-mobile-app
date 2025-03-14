import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});
// plates listing count
  Stream<int> _getPlatesListingCount(String itemType) {
    return FirebaseFirestore.instance
        .collection(platesListingsCollectionId)
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  Stream<int> _getNumbersListingCount(String itemType) {
    return FirebaseFirestore.instance
        .collection(phoneListingsCollectionId)
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  Stream<int> _getPlatesRequestsCount() {
    return FirebaseFirestore.instance
        .collection(platesRequestsCollectionId)
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  Stream<int> _getCategoryCount(ItemType? itemType) {
    switch (itemType) {
      case ItemType.plateNumber:
        return _getPlatesListingCount(itemType.toString());
      case ItemType.phoneNumber:
        return _getNumbersListingCount(itemType.toString());
      default:
        return _getPlatesRequestsCount();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _buildCategoryCard(
              icon: Icons.directions_car,
              title: "Car Numbers",
              itemType: ItemType.plateNumber,
              onTap: () => AutoRouter.of(context).push(const PlatesListingsRoute()),
            ),
            _buildCategoryCard(
                icon: Icons.phone,
                title: "Phone Numbers",
                itemType: ItemType.phoneNumber,
                onTap: () => AutoRouter.of(context).push(const PhoneNumbersRoute())),
            _buildCategoryCard(
                icon: Icons.request_page,
                title: "Requests",
                onTap: () => AutoRouter.of(context).push(const RequestsRoute())),
          ]),
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

  Widget _buildCategoryCard({required IconData icon, required String title, ItemType? itemType, Function()? onTap}) {
    return StreamBuilder<int>(
      stream: _getCategoryCount(itemType),
      builder: (context, snapshot) {
        final count = snapshot.hasData ? snapshot.data.toString() : "Loading";
        return CategoryCard(icon: icon, title: title, count: count, onTap: onTap);
      },
    );
  }
}
