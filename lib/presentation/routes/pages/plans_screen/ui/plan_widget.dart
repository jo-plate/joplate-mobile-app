import 'package:flutter/material.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';

class PlanWidget extends StatelessWidget {
  const PlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 120, // Adjust as needed
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.brown.shade400, Colors.brown.shade300, Colors.brown.shade500],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: PlateIcon(),
                        ),
                      ),
                      const Text("Plan Name", style: TextStyle(color: Colors.black, fontSize: 16.0)),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text("you can cancel or downgrade/upgrade your subscription at any time",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14.0,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "0",
                              style: TextStyle(
                                  fontFamily: 'Mandatory',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red[700],
                                  fontSize: 28.0)),
                          const TextSpan(
                            text: " JOD / monthly",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 16.0,
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey[600],
                    thickness: 1,
                  ),
                  FilledButton(onPressed: () {}, child: const Text("Subscribe"))
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
