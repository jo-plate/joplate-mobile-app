import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/ui/add_phone_number_form.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/ui/add_plate_number_form.dart';
import 'package:joplate/presentation/routes/router.dart';

@RoutePage()
class AddPhoneNumberPage extends StatefulWidget {
  const AddPhoneNumberPage({super.key});

  @override
  State<AddPhoneNumberPage> createState() => _AddPhoneNumberPageState();
}

class _AddPhoneNumberPageState extends State<AddPhoneNumberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Phone Number"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              AddPhoneNumberForm(
                onSuccess: (input) => AutoRouter.of(context).replace(const MyNumbersRoute()),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
