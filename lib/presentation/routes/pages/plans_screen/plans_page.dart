import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plan.dart';
import 'package:joplate/presentation/routes/pages/plans_screen/ui/plan_widget.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

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
      final firebasePlans = snapshot.docs.map((doc) => Plan.fromJson(doc.data())).toList();

      // Add the Basic (bronze) plan if it doesn't exist
      if (!firebasePlans.any((plan) => plan.displayName == 'Basic')) {
        firebasePlans.insert(0, _createBasicPlan());
      }

      return firebasePlans;
    });
  }

  Plan _createBasicPlan() {
    return const Plan(
      displayName: 'Basic',
      price: 0,
      color: Color(0xFFCD7F32), // Bronze color
      activePerks: ['Post up to 3 listings per month', 'Basic search features', 'Contact sellers directly'],
      disabledPerks: ['Premium listings', 'Featured listings', 'Verified badge'],
      activePerksAr: ['نشر ما يصل إلى 5 إعلانات شهريًا', 'ميزات البحث الأساسية', 'التواصل مع البائعين مباشرة'],
      disabledPerksAr: ['إعلانات مميزة', 'إعلانات مميزة', 'شارة موثقة'],
      productIds: {
        'ios': '',
        'android': '',
      }, // Empty product IDs as it's a free plan
    );
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
    final m = Localization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(m.profile.packages),
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
            
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Text(
                    m.profile.my_current_plan,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.all(12),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return PlanWidget(
                        plan: snapshot.data![index],
                        isSmallCard: true,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
