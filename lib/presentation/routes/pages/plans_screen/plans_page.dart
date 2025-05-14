import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plan.dart';
import 'package:joplate/presentation/routes/pages/plans_screen/ui/plan_widget.dart';

@RoutePage()
class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  late final Stream<List<Plan>> plans;
  final _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    _logPlansPageViewed();

    plans = FirebaseFirestore.instance.collection('plans').snapshots().map((snapshot) {
      snapshot.docs.forEach((e) => print(e.data()));
      return snapshot.docs.map((doc) => Plan.fromJson(doc.data())).toList();
    });
  }

  void _logPlansPageViewed() {
    _analytics.logEvent(
      name: 'plans_page_viewed',
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

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
            child: StreamBuilder<List<Plan>>(
                stream: plans,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return CarouselSlider.builder(
                      options: CarouselOptions(
                        autoPlay: true,
                        padEnds: true,
                        viewportFraction: 1,
                        height: MediaQuery.of(context).size.height,
                        enlargeCenterPage: false,
                      ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index, int realIndex) {
                        return PlanWidget(plan: snapshot.data![index]);
                      });
                })));
  }
}
