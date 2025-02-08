import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/domain/entities/listing.dart';
import 'ui/logo_section.dart';
import 'ui/category_section.dart';
import 'ui/plates_listing_grid.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final plateNumbers = Listing.mockPlateNumberList(24);
    final chunkedPlates = List.generate(
      (plateNumbers.length / 6).ceil(),
      (index) => plateNumbers.skip(index * 6).take(6).toList(),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    LogoSection(),
                    SizedBox(height: 10),
                    CategorySection(),
                  ],
                ),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            //   child: Text('Featured', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // ),
            Expanded(
              flex: 4,
              child: CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  padEnds: true,
                  viewportFraction: 0.9,
                  aspectRatio: 1,
                  enlargeCenterPage: true,
                ),
                items: chunkedPlates.map((plates) => PlatesListingsGrid(itemList: plates)).toList(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
