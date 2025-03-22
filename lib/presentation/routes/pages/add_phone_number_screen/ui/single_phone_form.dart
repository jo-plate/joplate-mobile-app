import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/cubit/phone_form_state.dart';

class SinglePhoneForm extends StatefulWidget {
  const SinglePhoneForm({
    super.key,
    required this.index,
    required this.formState,
    required this.onNumberChanged,
    required this.onPriceChanged,
    required this.onDiscountChanged,
    required this.onDiscountToggle,
  });

  final int index;
  final PhoneFormState formState;

  final ValueChanged<String> onNumberChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onDiscountChanged;
  final ValueChanged<bool> onDiscountToggle;

  @override
  State<SinglePhoneForm> createState() => _SinglePhoneFormState();
}

class _SinglePhoneFormState extends State<SinglePhoneForm> {
  @override
  initState() {
    numberController = TextEditingController(text: widget.formState.number);
    priceController = TextEditingController(text: widget.formState.price);
    discountController = TextEditingController(text: widget.formState.discountPrice ?? '');
    super.initState();
  }

  late final TextEditingController numberController;
  late final TextEditingController priceController;
  late final TextEditingController discountController;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (widget.formState.errorMessage != null)
              Text(
                widget.formState.errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            TextField(
              controller: numberController,
              keyboardType: TextInputType.number,
              onChanged: widget.onNumberChanged,
              decoration: const InputDecoration(labelText: 'Number'),
              enabled: !widget.formState.isSubmitting,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              onChanged: widget.onPriceChanged,
              decoration: const InputDecoration(labelText: 'Price'),
              enabled: !widget.formState.isSubmitting,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("With Discount?", style: TextStyle(fontSize: 16)),
                Switch(
                  value: widget.formState.withDiscount,
                  onChanged: widget.formState.isSubmitting ? null : widget.onDiscountToggle,
                ),
              ],
            ),
            if (widget.formState.withDiscount)
              TextField(
                controller: discountController,
                keyboardType: TextInputType.number,
                onChanged: widget.onDiscountChanged,
                decoration: const InputDecoration(labelText: 'Discount Price'),
                enabled: !widget.formState.isSubmitting,
              ),
            const SizedBox(height: 16),
            if (widget.formState.isSubmitting) const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    );
  }
}
