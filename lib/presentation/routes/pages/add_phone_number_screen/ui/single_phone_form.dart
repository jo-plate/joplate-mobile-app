// lib/presentation/routes/pages/add_phone_number_screen/ui/single_phone_form.dart

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
    this.onRemoveForm,
  });

  final int index;
  final PhoneFormState formState;

  final ValueChanged<String> onNumberChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onDiscountChanged;
  final ValueChanged<bool> onDiscountToggle;

  /// Callback to remove this form from the parent
  final VoidCallback? onRemoveForm;

  @override
  State<SinglePhoneForm> createState() => _SinglePhoneFormState();
}

class _SinglePhoneFormState extends State<SinglePhoneForm> {
  late final TextEditingController numberController;
  late final TextEditingController priceController;
  late final TextEditingController discountController;

  @override
  void initState() {
    super.initState();
    numberController = TextEditingController(text: widget.formState.number);
    priceController = TextEditingController(text: widget.formState.price);
    discountController = TextEditingController(text: widget.formState.discountPrice ?? '');
  }

  @override
  void didUpdateWidget(covariant SinglePhoneForm oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the underlying state changed from outside, sync text fields
    if (oldWidget.formState.number != widget.formState.number && numberController.text != widget.formState.number) {
      _syncText(numberController, widget.formState.number);
    }
    if (oldWidget.formState.price != widget.formState.price && priceController.text != widget.formState.price) {
      _syncText(priceController, widget.formState.price);
    }
    if (oldWidget.formState.discountPrice != widget.formState.discountPrice &&
        discountController.text != (widget.formState.discountPrice ?? '')) {
      _syncText(discountController, widget.formState.discountPrice ?? '');
    }
  }

  void _syncText(TextEditingController controller, String newText) {
    // Attempt to preserve cursor position
    final selection = controller.selection;
    controller.text = newText;
    final length = newText.length;
    controller.selection = selection.copyWith(
      baseOffset: length,
      extentOffset: length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final isSubmitting = widget.formState.isSubmitting;
    final hasError = widget.formState.errorMessage != null;
    final errorText = widget.formState.errorMessage ?? '';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Form Fields
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (hasError) Text(errorText, style: const TextStyle(color: Colors.red)),
                TextField(
                  controller: numberController,
                  onChanged: widget.onNumberChanged,
                  keyboardType: TextInputType.number,
                  enabled: !isSubmitting,
                  decoration: const InputDecoration(labelText: 'Number'),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: priceController,
                  onChanged: widget.onPriceChanged,
                  keyboardType: TextInputType.number,
                  enabled: !isSubmitting,
                  decoration: const InputDecoration(labelText: 'Price'),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("With Discount?", style: TextStyle(fontSize: 16)),
                    Switch(
                      value: widget.formState.withDiscount,
                      onChanged: isSubmitting ? null : widget.onDiscountToggle,
                    ),
                  ],
                ),
                if (widget.formState.withDiscount)
                  TextField(
                    controller: discountController,
                    onChanged: widget.onDiscountChanged,
                    keyboardType: TextInputType.number,
                    enabled: !isSubmitting,
                    decoration: const InputDecoration(labelText: 'Discount Price'),
                  ),
                const SizedBox(height: 16),
                if (isSubmitting) const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),

          // Minus remove button in top-right corner
          if (widget.index != 0)
            Positioned(
              right: -14,
              top: -14,
              child: GestureDetector(
                onTap: isSubmitting ? null : widget.onRemoveForm,
                child: const CircleAvatar(
                  radius: 16,
                  backgroundColor: Color(0xFF981C1E),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
