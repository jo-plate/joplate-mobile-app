import 'package:flutter/material.dart';
import 'package:joplate/domain/entities/plan.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';

class PlanWidget extends StatelessWidget {
  const PlanWidget({
    super.key,
    required this.plan,
  });

  final Plan plan;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 130,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [plan.color.withAlpha(170), plan.color.withAlpha(130), plan.color.withAlpha(255)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    ),
                    child: Center(
                      child: PlanIcon(size: 75, color: plan.color),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            plan.displayName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 24.0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "you can cancel or downgrade/upgrade your subscription at any time",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (plan.price > 0)
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: plan.price.toDouble().toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Mandatory',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF981C1E),
                                      fontSize: 24.0),
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
                          else
                            const Text(
                              "Free",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20.0,
                              ),
                            ),
                          // const SizedBox(height: 16),
                          Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                          _buildActivePerks(),
                          _buildDisabledPerks(),
                          const Spacer(),
                          Divider(
                            color: Colors.grey[400],
                            thickness: 1,
                          ),
                          FilledButton(
                            onPressed: () {},
                            child: const Text("Subscribe"),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPerk(String perk, bool isActive) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            color: isActive ? const Color(0xFF981C1E) : Colors.grey,
            size: 26,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              perk,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivePerks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...plan.activePerks.map((perk) => _buildPerk(perk, true)),
      ],
    );
  }

  Widget _buildDisabledPerks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...plan.disabledPerks.map((perk) => _buildPerk(perk, false)),
      ],
    );
  }
}
