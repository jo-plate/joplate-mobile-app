import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/dto/add_listing_dto.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';
import 'category_card.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  Stream<int> _getPlatesListingCount(String itemType) {
    return FirebaseFirestore.instance.collection(carPlatesCollectionId).snapshots().map((snapshot) => snapshot.size);
  }

  Stream<int> _getNumbersListingCount(String itemType) {
    return FirebaseFirestore.instance.collection(phoneNumbersCollectionId).snapshots().map((snapshot) => snapshot.size);
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
    final m = Localization.of(context);

    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          _buildCategoryCard(
            icon: Image.asset(
              'assets/images/car_numbers.png',
              width: 50,
              // height: 40,
            ),
            title: m.home.car_number,
            itemType: ItemType.plateNumber,
            onTap: () => AutoRouter.of(context).push(const PlatesListingsRoute()),
          ),
          _buildCategoryCard(
              icon: Image.asset(
                'assets/images/phone_numbers.png',
                width: 50,
                // height: 40,
              ),
              title: m.home.phone_numbers,
              itemType: ItemType.phoneNumber,
              onTap: () => AutoRouter.of(context).push(const PhoneListingsRoute())),
          _buildCategoryCard(
              icon: Image.asset(
                'assets/images/requests.png',
                width: 50,
                // height: 40,
              ),
              title: m.home.requests,
              onTap: () => AutoRouter.of(context).push(const RequestsRoute())),
        ]),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {
            AutoRouter.of(context).push(const QuicksaleRoute());
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF981C1E), width: 1.5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/quicksale.png',
                    width: 20,
                    height: 20,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    m.home.quick_sale,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF333333),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard({required Widget icon, required String title, ItemType? itemType, Function()? onTap}) {
    return StreamBuilder<int>(
      stream: _getCategoryCount(itemType),
      builder: (context, snapshot) {
        final count = snapshot.hasData ? snapshot.data.toString() : "Loading";
        return CategoryCard(iconWidget: icon, title: title, count: count, onTap: onTap);
      },
    );
  }
}
