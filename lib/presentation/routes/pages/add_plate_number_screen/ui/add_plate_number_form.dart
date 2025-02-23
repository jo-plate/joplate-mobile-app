import 'package:flutter/material.dart';
import 'package:joplate/domain/dto/add_plate_number_input.dart';
import 'package:joplate/presentation/theme.dart';

class AddPlateNumberForm extends StatefulWidget {
  const AddPlateNumberForm({
    super.key,
    this.onSubmit,
  });

  final Function(AddPlateNumberInput input)? onSubmit;

  @override
  State<AddPlateNumberForm> createState() => _AddPlateNumberFormState();
}

class _AddPlateNumberFormState extends State<AddPlateNumberForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  bool _withDiscount = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    priceController.dispose();
    discountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: cardContainerStyle,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: emailController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Code',
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: passwordController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Number',
            ),
          ),
          const SizedBox(height: 30),
          TextField(
            controller: priceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Price',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "With Discount?",
                style: TextStyle(fontSize: 16),
              ),
              Switch(
                value: _withDiscount,
                onChanged: (value) {
                  setState(() {
                    _withDiscount = value;
                  });
                },
              ),
            ],
          ),
          if (_withDiscount) ...[
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: discountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Discount price',
              ),
            ),
          ]
        ],
      ),
    );
  }
}
