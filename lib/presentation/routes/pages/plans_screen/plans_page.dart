import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plan.dart';
import 'package:joplate/domain/entities/user_profile.dart';
import 'package:joplate/injection/injector.dart';
import 'package:joplate/presentation/cubits/auth/auth_cubit.dart';
import 'package:joplate/presentation/routes/pages/plans_screen/ui/plan_widget.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PlansPage extends StatefulWidget {
  const PlansPage({super.key});

  @override
  State<PlansPage> createState() => _PlansPageState();
}

class _PlansPageState extends State<PlansPage> {
  late final Stream<List<Plan>> plans;
  final _analytics = FirebaseAnalytics.instance;
  String? currentPlanName;

  @override
  void initState() {
    super.initState();
    _logPlansPageViewed();
    _getCurrentPlan();

    plans = FirebaseFirestore.instance.collection('plans').snapshots().map((snapshot) {
      for (var e in snapshot.docs) {
        print(e.data());
      }
      final firebasePlans = snapshot.docs.map((doc) => Plan.fromJson(doc.data())).toList();

      // Add the Basic (bronze) plan if it doesn't exist
      if (!firebasePlans.any((plan) => plan.displayName == 'Basic')) {
        firebasePlans.insert(0, _createBasicPlan());
      }

      // Sort plans by price (low to high)
      firebasePlans.sort((a, b) => a.price.compareTo(b.price));
      
      return firebasePlans;
    });
  }

  void _getCurrentPlan() {
    // For now, default to Basic plan
    // In a real implementation, you would fetch the current plan from a subscription service
    // or from user metadata in Firestore
    setState(() {
      currentPlanName = 'Basic';

      // TODO: Fetch actual plan from user subscription data
      // This could be implemented by adding a 'planId' or 'planName' field to UserProfile
      // or by querying a separate subscriptions collection
    });

    // Example of how you might fetch it if it were stored in a separate document:
    // final user = FirebaseAuth.instance.currentUser;
    // if (user != null) {
    //   FirebaseFirestore.instance
    //     .collection('subscriptions')
    //     .doc(user.uid)
    //     .get()
    //     .then((doc) {
    //       if (doc.exists) {
    //         setState(() {
    //           currentPlanName = doc.data()?['planName'] ?? 'Basic';
    //         });
    //       }
    //     });
    // }
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
      ),
      body: StreamBuilder<List<Plan>>(
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
                child: Row(
                  children: [
                    Text(
                      m.profile.my_current_plan,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 8),
                    if (currentPlanName != null) _buildPlanBadge(currentPlanName!),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return PlanWidget(
                      plan: snapshot.data![index],
                      isSmallCard: false,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildPlanBadge(String planName) {
    Color badgeColor;
    IconData badgeIcon;

    switch (planName) {
      case 'Gold':
        badgeColor = const Color(0xFFFFD700); // Gold color
        badgeIcon = Icons.workspace_premium;
        break;
      case 'Diamond':
        badgeColor = const Color(0xFFB9F2FF); // Diamond light blue
        badgeIcon = Icons.diamond;
        break;
      case 'Basic':
      default:
        badgeColor = const Color(0xFFCD7F32); // Bronze color
        badgeIcon = Icons.account_circle;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: badgeColor.withOpacity(0.15),
        border: Border.all(color: badgeColor, width: 1.5),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: badgeColor.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(badgeIcon, color: badgeColor, size: 16),
          const SizedBox(width: 4),
          Text(
            planName,
            style: TextStyle(
              color: badgeColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
