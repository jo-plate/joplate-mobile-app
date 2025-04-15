import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/plate_number.dart';
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
  late final Stream<List<PlateNumber>> _platesStream;
  @override
  void initState() {
    super.initState();
    // where ads array size > 0
    _platesStream = FirebaseFirestore.instance
        .collection(carPlatesCollectionId)
        .where('adsCount', isGreaterThan: 0)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => PlateNumber.fromJson(doc.data())).toList());
  }

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

          // leading: IconButton(
          //   icon: const ,

          //   onPressed: () {},
          // )p
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              const CategorySection(),
              const SizedBox(height: 24),
              Text(
                m.home.featured_numbers,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              StreamBuilder<List<PlateNumber>>(
                  stream: _platesStream,
                  builder: (context, snapshot) {
                    final splitNumbers = snapshot.data?.where((plate) => plate.adsCount > 0).toList() ?? [];
                    final chunkedPlates = <List<PlateNumber>>[];
                    for (var i = 0; i < splitNumbers.length; i += 6) {
                      // check
                      chunkedPlates
                          .add(splitNumbers.sublist(i, i + 6 > splitNumbers.length ? splitNumbers.length : i + 6));
                    }

                    return CarouselSlider(
                      options: CarouselOptions(
                          autoPlay: false,
                          padEnds: true,
                          viewportFraction: 1,
                          aspectRatio: 1,
                          enlargeCenterPage: false),
                      items: chunkedPlates
                          .map((plates) => Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: PlatesListingsGrid(
                                  itemList: plates,
                                ),
                              ))
                          .toList(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
