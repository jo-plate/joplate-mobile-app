import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/widgets/icons/plan_icon.dart';

const kDialogBG = Color.fromARGB(255, 255, 255, 255);
const kCardBG = Color(0xFFFFFFFF);
const kAccent = Color(0xFF981C1E);
const kGold = Color(0xFFFFC107);

class BuyTicketsDialog extends StatefulWidget {
  const BuyTicketsDialog({super.key});

  @override
  State<BuyTicketsDialog> createState() => _BuyTicketsDialogState();
}

class _BuyTicketsDialogState extends State<BuyTicketsDialog> {
  int current = 0;
  bool submitting = false;

  final plans = const [
    _TicketPlan(tickets: 3, price: 12),
    _TicketPlan(tickets: 5, price: 18),
    _TicketPlan(tickets: 10, price: 30),
  ];

  Future<void> _purchaseTickets(_TicketPlan plan) async {
    setState(() => submitting = true);

    final dto = {
      'ticketCount': plan.tickets,
      'amountJOD': plan.price,
    };

    try {
      final callable = FirebaseFunctions.instance.httpsCallable('purchaseTickets');
      await callable.call(dto);

      if (mounted) {
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('تم شراء التذاكر بنجاح')),
        );
      }
    } on FirebaseFunctionsException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'فشل شراء التذاكر')),
      );
      setState(() => submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: kDialogBG,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CarouselSlider.builder(
              itemCount: plans.length,
              options: CarouselOptions(
                height: 270,
                enlargeCenterPage: true,
                viewportFraction: 1, // Full width
                onPageChanged: (i, __) => setState(() => current = i),
              ),
              itemBuilder: (_, i, __) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                child: _TicketCard(plan: plans[i]),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                plans.length,
                (i) => Container(
                  width: 8,
                  height: 8,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: current == i ? kAccent : kAccent.withOpacity(0.3),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kGold,
                  minimumSize: const Size.fromHeight(50),
                  elevation: 0,
                  textStyle: const TextStyle(color: Colors.white),
                ),
                onPressed: submitting ? null : () => _purchaseTickets(plans[current]),
                child: submitting
                    ? const CircularProgressIndicator()
                    : const Text(
                        'اشترِ الآن',
                        style: TextStyle(color: Colors.white),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TicketPlan {
  const _TicketPlan({required this.tickets, required this.price});
  final int tickets;
  final int price;
}

class _TicketCard extends StatelessWidget {
  const _TicketCard({required this.plan});
  final _TicketPlan plan;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: kCardBG,
      elevation: 2,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: kCardBG,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const PlanIcon(size: 32, color: Colors.white, borderColor: Colors.black),
            const SizedBox(height: 12),
            Text(
              '${plan.tickets} Tickets',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'JOD ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  TextSpan(
                    text: '${plan.price}',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                      color: kAccent,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
