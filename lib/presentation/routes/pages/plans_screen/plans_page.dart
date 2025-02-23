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
  List<Color> get colors => const [Color(0xFF6D4C41), Color(0xFFD4AF37), Color.fromARGB(255, 75, 140, 160)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Plans'),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
        ),
        body: SafeArea(
          child: CarouselSlider.builder(
              options: CarouselOptions(
                autoPlay: true,
                padEnds: true,
                viewportFraction: 1,
                height: MediaQuery.of(context).size.height,
                enlargeCenterPage: false,
              ),
              itemCount: 3,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Expanded(child: PlanWidget(color: colors[index]));
              }),
        ));
  }
}
