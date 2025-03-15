import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/ui/add_plate_number_form.dart';
import 'package:joplate/presentation/routes/router.dart';

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
            child: Column(children: [
              AddPlateNumberForm(
                onSuccess: (input) => AutoRouter.of(context).replace(const MyNumbersRoute()),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
