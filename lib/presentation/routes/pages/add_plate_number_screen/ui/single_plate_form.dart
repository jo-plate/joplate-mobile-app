// lib/presentation/routes/pages/add_plate_number_screen/ui/single_plate_form.dart

import 'package:flutter/material.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/cubit/plate_form_state.dart';

/// A single plate form row, with an optional remove button in the top-right corner.
class SinglePlateForm extends StatefulWidget {
  const SinglePlateForm({
    super.key,
    required this.index,
    required this.formState,
    required this.onCodeChanged,
    required this.onNumberChanged,
    required this.onPriceChanged,
    required this.onDiscountChanged,
    required this.onDiscountToggle,
    this.onRemoveForm,
  });

  final int index;
  final PlateFormState formState;
  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onNumberChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onDiscountChanged;
  final ValueChanged<bool> onDiscountToggle;
  final VoidCallback? onRemoveForm;

  @override
  State<SinglePlateForm> createState() => _SinglePlateFormState();
}

class _SinglePlateFormState extends State<SinglePlateForm> {
  late final TextEditingController codeController;
  late final TextEditingController numberController;
  late final TextEditingController priceController;
  late final TextEditingController discountController;

  @override
  void initState() {
    super.initState();
    codeController = TextEditingController(text: widget.formState.code);
    numberController = TextEditingController(text: widget.formState.number);
    priceController = TextEditingController(text: widget.formState.price);
    discountController = TextEditingController(text: widget.formState.discountPrice ?? '');
  }

  @override
  void didUpdateWidget(SinglePlateForm oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the underlying cubit state changes from outside the text field,
    // we can sync controllers with the new data:
    if (oldWidget.formState.code != widget.formState.code && codeController.text != widget.formState.code) {
      _updateControllerText(codeController, widget.formState.code);
    }
    if (oldWidget.formState.number != widget.formState.number && numberController.text != widget.formState.number) {
      _updateControllerText(numberController, widget.formState.number);
    }
    if (oldWidget.formState.price != widget.formState.price && priceController.text != widget.formState.price) {
      _updateControllerText(priceController, widget.formState.price);
    }
    if (oldWidget.formState.discountPrice != widget.formState.discountPrice &&
        discountController.text != (widget.formState.discountPrice ?? '')) {
      _updateControllerText(discountController, widget.formState.discountPrice ?? '');
    }
  }

  /// Helper to preserve cursor position if we set text manually
  void _updateControllerText(TextEditingController controller, String newText) {
    final cursorPos = controller.selection;
    controller.text = newText;
    final length = newText.length;
    controller.selection = cursorPos.copyWith(
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
      clipBehavior: Clip.none,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (hasError) Text(errorText, style: const TextStyle(color: Colors.red)),
                TextField(
                  controller: codeController,
                  onChanged: widget.onCodeChanged,
                  keyboardType: TextInputType.text,
                  enabled: !isSubmitting,
                  decoration: const InputDecoration(labelText: 'Code'),
                ),
                const SizedBox(height: 16),
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
          if (widget.index != 0)
            Positioned(
              right: -14,
              top: -14,
              child: GestureDetector(
                onTap: isSubmitting ? null : widget.onRemoveForm,
                child: const CircleAvatar(
                  radius: 14,
                  backgroundColor: Color(0xFF981C1E),
                  child: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
