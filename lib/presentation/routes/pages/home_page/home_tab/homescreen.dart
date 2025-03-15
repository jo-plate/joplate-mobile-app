import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:joplate/domain/entities/plate_number.dart';
import 'ui/logo_section.dart';
import 'ui/category_section.dart';
import 'ui/plates_listing_grid.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  List<PlateNumber> get mockPlateNumberList => PlateNumber.mockList(24);

  @override
  Widget build(BuildContext context) {
    final plateNumbers = mockPlateNumberList;
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
              const Text(
                "Featured Numbers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true, padEnds: true, viewportFraction: 1, aspectRatio: 1, enlargeCenterPage: false),
                items: chunkedPlates
                    .map((plates) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: PlatesListingsGrid(
                            itemList: plates,
                            isFeatured: true,
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
