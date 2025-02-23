import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/pages/plans_screen/ui/plan_widget.dart';

@RoutePage()
class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plans'),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
        ),
        body: CarouselSlider.builder(
            options: CarouselOptions(
              autoPlay: true,
              padEnds: true,
              viewportFraction: 1,
              aspectRatio: 9 / 16,
              enlargeCenterPage: false,
            ),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return PlanWidget();
            }));
  }
}
