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
        appBar: AppBar(
          title: const LogoSection(),
          centerTitle: true,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CategorySection(),
                const SizedBox(height: 16),
                CarouselSlider(
                  options: CarouselOptions(
                      autoPlay: true, padEnds: true, viewportFraction: 1, aspectRatio: 1, enlargeCenterPage: false),
                  items: chunkedPlates
                      .map((plates) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: PlatesListingsGrid(itemList: plates),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
