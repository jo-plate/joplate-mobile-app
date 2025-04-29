import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_listing.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'ui/logo_section.dart';
import 'ui/category_section.dart';
import '../../../../widgets/app_bar.dart/plates_listing_grid.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Stream<List<PlateListing>> _platesStream;
  @override
  void initState() {
    super.initState();
    _platesStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('featuredUntil', isGreaterThan: DateTime.now())
        .where('expiresAt', isGreaterThan: DateTime.now())
        .where('isDisabled', isEqualTo: false)
        .where('isSold', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PlateListing.fromSnapshot(doc)).toList());
  }

  int _currentCarouselIndex = 0;
  final CarouselSliderController _carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const LogoSection(),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.grey[100],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: CategorySection(),
              ),
              Text(
                m.home.featured_numbers,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 8,
              ),
              StreamBuilder<List<PlateListing>>(
                  stream: _platesStream,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (snapshot.hasError) {
                      print('snapshot error: ${snapshot.error}');
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
                      return const SizedBox.shrink(); // Or show "No featured numbers"
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
                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                    child: PlatesListingsGrid(
                                      itemList: plates,
                                      shrinkWrap: false,
                                    ),
                                  ))
                              .toList(),
                        ),
                        // const SizedBox(height: 2),
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
                                  color: _currentCarouselIndex == index ? Colors.black : Colors.grey,
                                ),
                              );
                            }),
                          ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
