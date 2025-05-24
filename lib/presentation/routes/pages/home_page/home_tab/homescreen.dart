import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/domain/entities/phone_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'ui/logo_section.dart';
import 'ui/category_section.dart';
import '../../../../widgets/app_bar.dart/plates_listing_grid.dart';
import '../../../../widgets/app_bar.dart/phones_listing_grid.dart';
import '../../../../widgets/notification_badge.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Stream<List<PlateListing>> _platesStream;
  late final Stream<List<PhoneListing>> _phonesStream;
  int _currentCarouselIndex = 0;
  int _selectedTabIndex = 0; // 0 for plates, 1 for phones
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();

    final now = Timestamp.now();

    // Stream for featured plate listings
    _platesStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('featuredUntil', isGreaterThan: now)
        .where('expiresAt', isGreaterThan: now)
        .where('isDisabled', isEqualTo: false)
        .where('isSold', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PlateListing.fromSnapshot(doc)).toList());

    // Stream for featured phone listings
    _phonesStream = FirebaseFirestore.instance
        .collection(phoneNumbersCollectionId)
        .where('featuredUntil', isGreaterThan: now)
        .where('expiresAt', isGreaterThan: now)
        .where('isDisabled', isEqualTo: false)
        .where('isSold', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PhoneListing.fromSnapshot(doc)).toList());
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AbsorbPointer(
                    child: Opacity(
                      opacity: 0,
                      child: NotificationBadge(),
                    ),
                  ),
                  LogoSection(),
                  NotificationBadge(),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                ),
                child: CategorySection(),
              ),

              // Tab toggle for plates and phones
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0, bottom: 16.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: isDark ? const Color(0xFF252A41) : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      // Plates tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedTabIndex = 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedTabIndex == 0 ? const Color(0xFF981C1E) : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                m.home.car_number,
                                style: TextStyle(
                                  color: _selectedTabIndex == 0
                                      ? Colors.white
                                      : isDark
                                          ? Colors.white70
                                          : Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Phone numbers tab
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedTabIndex = 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: _selectedTabIndex == 1 ? const Color(0xFF981C1E) : Colors.transparent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Text(
                                m.home.phone_numbers,
                                style: TextStyle(
                                  color: _selectedTabIndex == 1
                                      ? Colors.white
                                      : isDark
                                          ? Colors.white70
                                          : Colors.black54,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Show plate or phone listings based on selected tab
              _selectedTabIndex == 0 ? _buildPlateListings(isDark) : _buildPhoneListings(isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlateListings(bool isDark) {
    return StreamBuilder<List<PlateListing>>(
        stream: _platesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            print('Plate snapshot error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data ?? [];

          // Split into chunks of 6 for the carousel
          final chunkedPlates = <List<PlateListing>>[];
          for (var i = 0; i < data.length; i += 6) {
            chunkedPlates.add(
              data.sublist(
                i,
                i + 6 > data.length ? data.length : i + 6,
              ),
            );
          }

          if (chunkedPlates.isEmpty) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'No featured plate listings',
                  style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
                ),
              ),
            );
          }

          return Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentCarouselIndex = index;
                      });
                    },
                    padEnds: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: chunkedPlates.length > 1,
                    aspectRatio: 1.13,
                    enlargeCenterPage: false),
                items: chunkedPlates
                    .map((plates) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          child: PlatesListingsGrid(
                            itemList: plates,
                            shrinkWrap: false,
                          ),
                        ))
                    .toList(),
              ),
              if (chunkedPlates.length > 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(chunkedPlates.length, (index) {
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentCarouselIndex == index ? (isDark ? Colors.white : Colors.black) : Colors.grey,
                      ),
                    );
                  }),
                ),
            ],
          );
        });
  }

  Widget _buildPhoneListings(bool isDark) {
    return StreamBuilder<List<PhoneListing>>(
        stream: _phonesStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox(
              height: 300,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.hasError) {
            print('Phone snapshot error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final data = snapshot.data ?? [];

          // Split into chunks of 6 for the carousel
          final chunkedPhones = <List<PhoneListing>>[];
          for (var i = 0; i < data.length; i += 6) {
            chunkedPhones.add(
              data.sublist(
                i,
                i + 6 > data.length ? data.length : i + 6,
              ),
            );
          }

          if (chunkedPhones.isEmpty) {
            return SizedBox(
              height: 200,
              child: Center(
                child: Text(
                  'No featured phone listings',
                  style: TextStyle(color: isDark ? Colors.white70 : Colors.black54),
                ),
              ),
            );
          }

          return Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentCarouselIndex = index;
                      });
                    },
                    padEnds: true,
                    viewportFraction: 1,
                    enableInfiniteScroll: chunkedPhones.length > 1,
                    aspectRatio: 1.08,
                    enlargeCenterPage: false),
                items: chunkedPhones
                    .map((phones) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                          child: PhonesListingGrid(
                            itemList: phones,
                            shrinkWrap: false,
                          ),
                        ))
                    .toList(),
              ),
              if (chunkedPhones.length > 1)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(chunkedPhones.length, (index) {
                    return Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentCarouselIndex == index ? (isDark ? Colors.white : Colors.black) : Colors.grey,
                      ),
                    );
                  }),
                ),
            ],
          );
        });
  }
}
