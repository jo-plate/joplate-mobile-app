import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:joplate/data/constants.dart';
import 'package:joplate/domain/entities/user_plans.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class MyPlanPage extends StatefulWidget {
  const MyPlanPage({super.key});

  @override
  State<MyPlanPage> createState() => _MyPlanPageState();
}

class _MyPlanPageState extends State<MyPlanPage> {
  late final Stream<UserPlans> _userPlansStream;

  @override
  void initState() {
    super.initState();
    _userPlansStream = FirebaseFirestore.instance
        .collection(userPlansCollectionId)
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return UserPlans.fromJson(snapshot.data()!);
      } else {
        return UserPlans.freePlan();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(m.plan.title),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<UserPlans>(
              stream: _userPlansStream,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 8,
                            spreadRadius: 2,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(snapshot.data?.plan.name ?? PlanType.free_plan.name,
                                      style: const TextStyle(color: Colors.black, fontSize: 16.0)),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  RichText(
                                    text: const TextSpan(
                                        text: "30",
                                        style: TextStyle(
                                            fontFamily: 'Mandatory',
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF981C1E),
                                            fontSize: 28.0),
                                        children: [
                                          TextSpan(
                                            text: " /  JOD",
                                            style: TextStyle(
                                                fontFamily: 'Mandatory',
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontSize: 16.0),
                                          )
                                        ]),
                                  )
                                ],
                              ),
                              Container(
                                height: 25,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.red, width: 1.5),
                                  color: Colors.red.withOpacity(0.3),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  m.plan.your_plan_label,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Divider(
                            color: Colors.grey[600],
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(m.plan.renewal_date),
                              const Spacer(),
                              FilledButton(
                                  onPressed: () => AutoRouter.of(context).push(const PlansRoute()),
                                  child: Text(m.plan.change_plan_button)),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                );
              }),
        ));
  }
}
