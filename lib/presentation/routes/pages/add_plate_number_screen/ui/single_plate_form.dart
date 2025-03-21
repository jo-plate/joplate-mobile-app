import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/cubit/plate_form_state.dart';

/// A widget for a single plate form.
class SinglePlateForm extends StatelessWidget {
  const SinglePlateForm({
    super.key,
    required this.index,
    required this.formState,
    required this.onCodeChanged,
    required this.onNumberChanged,
    required this.onPriceChanged,
    required this.onDiscountChanged,
    required this.onDiscountToggle,
  });

  final int index;
  final PlateFormState formState;

  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onNumberChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onDiscountChanged;
  final ValueChanged<bool> onDiscountToggle;

  @override
  Widget build(BuildContext context) {
    final codeController = TextEditingController(text: formState.code);
    final numberController = TextEditingController(text: formState.number);
    final priceController = TextEditingController(text: formState.price);
    final discountController = TextEditingController(text: formState.discountPrice ?? '');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (formState.errorMessage != null)
              Text(
                formState.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            TextField(
              controller: codeController,
              keyboardType: TextInputType.text,
              onChanged: onCodeChanged,
              decoration: const InputDecoration(labelText: 'Code'),
              enabled: !formState.isSubmitting,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              onChanged: onNumberChanged,
              decoration: const InputDecoration(labelText: 'Number'),
              enabled: !formState.isSubmitting,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              onChanged: onPriceChanged,
              decoration: const InputDecoration(labelText: 'Price'),
              enabled: !formState.isSubmitting,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("With Discount?", style: TextStyle(fontSize: 16)),
                Switch(
                  value: formState.withDiscount,
                  onChanged: formState.isSubmitting ? null : onDiscountToggle,
                ),
              ],
            ),
            if (formState.withDiscount)
              TextField(
                controller: discountController,
                keyboardType: TextInputType.number,
                onChanged: onDiscountChanged,
                decoration: const InputDecoration(labelText: 'Discount Price'),
                enabled: !formState.isSubmitting,
              ),
            const SizedBox(height: 16),
            if (formState.isSubmitting) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
