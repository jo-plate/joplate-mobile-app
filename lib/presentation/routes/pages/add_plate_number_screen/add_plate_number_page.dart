import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/ui/add_plate_number_form.dart';

@RoutePage()
class AddPlateNumberPage extends StatefulWidget {
  const AddPlateNumberPage({super.key});

  @override
  State<AddPlateNumberPage> createState() => _AddPlateNumberPageState();
}

class _AddPlateNumberPageState extends State<AddPlateNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Plate Number"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const AddPlateNumberForm(),
                const SizedBox(height: 16),
                const AddPlateNumberForm(),
                const SizedBox(height: 16),
                const AddPlateNumberForm(),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: FilledButton(onPressed: () {}, child: const Text("Add another"))),
                    const SizedBox(width: 16),
                    Expanded(
                      child: FilledButton(
                        onPressed: () {
                          AutoRouter.of(context).pushNamed('/plans');
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
