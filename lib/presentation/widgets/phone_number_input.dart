import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

class PhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final AutovalidateMode autoValidateMode;
  final String? labelText;
  final String hintText;
  final TextInputAction textInputAction;
  final bool enabled;
  const PhoneNumberInput({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.labelText,
    this.hintText = '7X XXX XXXX',
    this.textInputAction = TextInputAction.done,
    this.enabled = true,
  });

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  String? _validatePhoneNumber(String? value) {
    final m = Localization.of(context);

    if (value == null || value.isEmpty) {
      return m.common.phone_required;
    }

    // Remove any non-digit characters
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');

    // Check if number starts with 7
    if (!digits.startsWith('7')) {
      return m.common.phone_start_with_7;
    }

    // Check if number starts with 77, 78, or 79
    if (!digits.startsWith('77') && !digits.startsWith('78') && !digits.startsWith('79')) {
      return m.common.phone_start_with_77_78_79;
    }

    // Check if number is exactly 9 digits
    if (digits.length != 9) {
      return m.common.phone_length;
    }

    return null;
  }

  void _formatPhoneNumber(String value) {
    // Remove any non-digit characters
    final digits = value.replaceAll(RegExp(r'[^\d]'), '');

    // If empty, just update the controller
    if (digits.isEmpty) {
      widget.controller.text = '';
      if (widget.onChanged != null) {
        widget.onChanged!('');
      }
      return;
    }

    // Ensure the number starts with 7
    if (!digits.startsWith('7')) {
      return;
    }

    // Format the number as +962 XXXX XXXX
    final formattedNumber = '+962 ${digits.substring(0, 2)} ${digits.substring(2, 5)} ${digits.substring(5)}';

    // Update the controller with the formatted number
    widget.controller.text = formattedNumber;

    // Call onChanged with the formatted number
    if (widget.onChanged != null) {
      widget.onChanged!(formattedNumber);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(9),
      ],
      decoration: InputDecoration(
        prefixText: '+962 ',
        hintText: widget.hintText,
        border: const OutlineInputBorder(),
        labelText: widget.labelText,
      ),
      validator: widget.validator ?? _validatePhoneNumber,
      autovalidateMode: widget.autoValidateMode,
      onChanged: _formatPhoneNumber,
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
    );
  }
}
