import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class MyPlanPage extends StatefulWidget {
  const MyPlanPage({super.key});

  @override
  State<MyPlanPage> createState() => _MyPlanPageState();
}

class _MyPlanPageState extends State<MyPlanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Current Plan'),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                            const Text("Plan Name", style: TextStyle(color: Colors.black, fontSize: 16.0)),
                            const SizedBox(
                              height: 8,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "0",
                                  style: TextStyle(
                                      fontFamily: 'Mandatory',
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red[700],
                                      fontSize: 28.0),
                                  children: const [
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
                          child: const Text(
                            "Your plan",
                            style: TextStyle(
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
                        const Text("Renew on 3-8-2024"),
                        const Spacer(),
                        FilledButton(
                            onPressed: () => AutoRouter.of(context).push(const PlansRoute()),
                            child: const Text("Change plan"))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
