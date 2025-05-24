// lib/presentation/routes/pages/add_plate_number_screen/ui/single_plate_form.dart

import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/add_plate_number_screen/cubit/plate_form_state.dart';
import 'package:joplate/presentation/theme.dart';
import 'package:joplate/presentation/widgets/plate_code_picker_field.dart';
import 'package:joplate/presentation/widgets/plate_number_field.dart';

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
    required this.onFeaturedToggle,
    required this.onDiscountToggle,
    required this.onCallForPriceToggle,
    required this.onDescriptionChanged,
    this.onRemoveForm,
  });

  final int index;
  final PlateFormState formState;
  final ValueChanged<String> onCodeChanged;
  final ValueChanged<String> onNumberChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onDiscountChanged;
  final ValueChanged<bool> onDiscountToggle;
  final ValueChanged<bool> onFeaturedToggle;
  final ValueChanged<bool> onCallForPriceToggle;
  final ValueChanged<String> onDescriptionChanged;
  final VoidCallback? onRemoveForm;

  @override
  State<SinglePlateForm> createState() => _SinglePlateFormState();
}

class _SinglePlateFormState extends State<SinglePlateForm> {
  late final TextEditingController numberController;
  late final TextEditingController priceController;
  late final TextEditingController discountController;
  late final TextEditingController codeController;

  @override
  void initState() {
    super.initState();
    numberController = TextEditingController(text: widget.formState.number);
    priceController = TextEditingController(text: widget.formState.price);
    discountController = TextEditingController(text: widget.formState.discountPrice ?? '');
    codeController = TextEditingController(text: widget.formState.code);
  }

  @override
  void didUpdateWidget(SinglePlateForm oldWidget) {
    super.didUpdateWidget(oldWidget);

    // If the underlying cubit state changes from outside the text field,
    // we can sync controllers with the new data:
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
    if (oldWidget.formState.code != widget.formState.code && codeController.text != widget.formState.code) {
      _updateControllerText(codeController, widget.formState.code);
    }
    if (oldWidget.formState.isSubmitting != widget.formState.isSubmitting) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    numberController.dispose();
    priceController.dispose();
    discountController.dispose();
    codeController.dispose();
    super.dispose();
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
    final m = Localization.of(context);
    final isSubmitting = widget.formState.isSubmitting;
    final hasError = widget.formState.errorMessage != null;
    final errorText = widget.formState.errorMessage ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: getCardContainerStyle(context),
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
                PlateCodePickerField(
                  value: widget.formState.code,
                  enabled: !widget.formState.isSubmitting,
                  onChanged: widget.onCodeChanged,
                  controller: codeController,
                ),
                const SizedBox(height: 16),
                PlateNumberField(
                  value: widget.formState.number,
                  enabled: !widget.formState.isSubmitting,
                  onChanged: widget.onNumberChanged,
                  controller: numberController,
                ),
                const SizedBox(height: 16),

                // Call for price toggle
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(m.platesdetails.call_for_price, style: const TextStyle(fontSize: 16)),
                    Switch(
                      value: widget.formState.callForPrice,
                      onChanged: isSubmitting ? null : widget.onCallForPriceToggle,
                    ),
                  ],
                ),

                // Only show price fields if not "Call for Price"
                if (!widget.formState.callForPrice) ...[
                  const SizedBox(height: 16),
                  TextField(
                    controller: priceController,
                    onChanged: widget.onPriceChanged,
                    keyboardType: TextInputType.number,
                    enabled: !isSubmitting,
                    decoration: InputDecoration(
                        labelText: widget.formState.withDiscount ? m.addplate.price_before_discount : m.addplate.price),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(m.addplate.with_discount, style: const TextStyle(fontSize: 16)),
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
                      decoration: InputDecoration(labelText: m.addplate.price_after_discount),
                    ),
                ],
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(m.addplate.featured, style: const TextStyle(fontSize: 16)),
                    Switch(
                      value: widget.formState.isFeatured,
                      onChanged: isSubmitting ? null : widget.onFeaturedToggle,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextField(
                  maxLines: 3,
                  maxLength: 150,
                  enabled: !isSubmitting,
                  textAlign: TextAlign.justify,
                  textAlignVertical: TextAlignVertical.top,
                  expands: false,
                  decoration: InputDecoration(
                    labelText: m.common.description_optional,

                    hintText: m.common.description_hint,
                    errorText: widget.formState.description.length > 150 ? m.common.description_too_long : null,
                    alignLabelWithHint: true,
                  ),
                  onChanged: widget.onDescriptionChanged,
                ),
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
