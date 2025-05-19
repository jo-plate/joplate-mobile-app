// lib/presentation/routes/pages/add_phone_number_screen/ui/single_phone_form.dart

import 'package:flutter/material.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/routes/pages/add_phone_number_screen/cubit/phone_form_state.dart';
import 'package:joplate/presentation/theme.dart';

class SinglePhoneForm extends StatefulWidget {
  const SinglePhoneForm({
    super.key,
    required this.index,
    required this.formState,
    required this.onNumberChanged,
    required this.onPriceChanged,
    required this.onDiscountChanged,
    required this.onDiscountToggle,
    required this.onFeaturedToggle,
    required this.onCallForPriceToggle,
    this.onRemoveForm,
  });

  final int index;
  final PhoneFormState formState;

  final ValueChanged<String> onNumberChanged;
  final ValueChanged<String> onPriceChanged;
  final ValueChanged<String> onDiscountChanged;
  final ValueChanged<bool> onDiscountToggle;
  final ValueChanged<bool> onFeaturedToggle;
  final ValueChanged<bool> onCallForPriceToggle;

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

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!value.startsWith('077') && !value.startsWith('078') && !value.startsWith('079')) {
      return 'Phone number must start with 077, 078, or 079';
    }
    if (value.length != 10) {
      return 'Phone number must be 10 digits';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    final isSubmitting = widget.formState.isSubmitting;
    final hasError = widget.formState.errorMessage != null;
    final errorText = widget.formState.errorMessage ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: getCardContainerStyle(context),
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
                TextFormField(
                  controller: numberController,
                  onChanged: widget.onNumberChanged,
                  decoration: InputDecoration(
                    labelText: m.addphonenumber.number,
                    hintText: "07XXXXXXXX",
                    errorMaxLines: 2,
                  ),
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  enabled: !isSubmitting,
                  validator: _validatePhoneNumber,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 16),
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
                        labelText: widget.formState.withDiscount
                            ? m.addphonenumber.price_before_discount
                            : m.addphonenumber.price),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(m.addphonenumber.with_discount, style: const TextStyle(fontSize: 16)),
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
                      decoration: InputDecoration(labelText: m.addphonenumber.price_after_discount),
                    ),
                ],
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(m.addphonenumber.featured, style: const TextStyle(fontSize: 16)),
                    Switch(
                      value: widget.formState.isFeatured,
                      onChanged: isSubmitting ? null : widget.onFeaturedToggle,
                    ),
                  ],
                ),
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
