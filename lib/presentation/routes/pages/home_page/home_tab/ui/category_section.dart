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

  Stream<int> _getPlatesListingCount() {
    return FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('isDisabled', isEqualTo: false)
        .where('expiresAt', isGreaterThan: Timestamp.now())
        .orderBy('featuredUntil', descending: true)
        .orderBy('isSold', descending: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  Stream<int> _getNumbersListingCount() {
    return FirebaseFirestore.instance
        .collection(phoneNumbersCollectionId)
        .where('isDisabled', isEqualTo: false)
        .where('expiresAt', isGreaterThan: Timestamp.now())
        .orderBy('featuredUntil', descending: true)
        .orderBy('isSold', descending: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.size);
  }

  Stream<int> _getPlatesRequestsCount() {
    return FirebaseFirestore.instance
        .collection(platesRequestsCollectionId)
        .where('isDisabled', isEqualTo: false)
        .where('expiresAt', isGreaterThan: Timestamp.now())
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.length;
    });
  }

  Stream<int> _getCategoryCount(ItemType? itemType) {
    switch (itemType) {
      case ItemType.plateNumber:
        return _getPlatesListingCount();
      case ItemType.phoneNumber:
        return _getNumbersListingCount();
      default:
        return _getPlatesRequestsCount();
    }
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildCategoryCard(
              icon: Image.asset(isDark ? 'assets/images/car_numbers_dark.png' : 'assets/images/car_numbers.png',
                  width: 50),
              title: m.home.car_number,
              itemType: ItemType.plateNumber,
              onTap: () => AutoRouter.of(context).push(const PlatesListingsRoute()),
            ),
            _buildCategoryCard(
              icon: Image.asset(isDark ? 'assets/images/phone_numbers_dark.png' : 'assets/images/phone_numbers.png',
                  width: 50),
              title: m.home.phone_numbers,
              itemType: ItemType.phoneNumber,
              onTap: () => AutoRouter.of(context).push(const PhoneListingsRoute()),
            ),
            _buildCategoryCard(
              icon: Image.asset(isDark ? 'assets/images/requests_dark.png' : 'assets/images/requests.png', width: 60),
              title: m.home.requests,
              onTap: () => AutoRouter.of(context).push(const RequestsRoute()),
            ),
          ],
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () => AutoRouter.of(context).push(const QuicksaleRoute()),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF252A41) : const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark ? const Color(0xFF3D4266) : const Color(0xFF981C1E),
                  width: 1.5,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(isDark ? 'assets/images/quicksale_dark.png' : 'assets/images/quicksale.png',
                      width: 20, height: 20, fit: BoxFit.contain),
                  const SizedBox(width: 8),
                  Text(
                    m.home.quick_sale,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isDark ? Colors.white : const Color(0xFF333333),
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

  Widget _buildCategoryCard({
    required Widget icon,
    required String title,
    ItemType? itemType,
    Function()? onTap,
  }) {
    return StreamBuilder<int>(
      stream: _getCategoryCount(itemType),
      builder: (context, snapshot) {
        final count = snapshot.data ?? 0;
        return CategoryCard(
          iconWidget: icon,
          title: title,
          count: count.toString(),
          onTap: onTap,
        );
      },
    );
  }
}
