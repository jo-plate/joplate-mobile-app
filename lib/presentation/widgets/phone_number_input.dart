import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberInput extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool enabled;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldValidator<String>? validator;
  final AutovalidateMode? autovalidateMode;

  const PhoneNumberInput({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.enabled = true,
    this.textInputAction = TextInputAction.next,
    this.onFieldSubmitted,
    this.validator,
    this.autovalidateMode,
  });

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return TextFormField(
      controller: widget.controller,
      keyboardType: TextInputType.phone,
      maxLength: 9, // 9 digits after removing the first 0
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: widget.validator ?? _validateJordanianPhone,
      autovalidateMode: widget.autovalidateMode,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        labelText: widget.labelText ?? 'Phone number',
        hintText: widget.hintText ?? '7X XXX XXXX',
        prefixIcon: Icon(Icons.phone_outlined, color: primaryColor.withOpacity(0.8)),
        prefixText: '+962 ',
        counterText: '', // Hide the character counter
      ),
    );
  }

  String? _validateJordanianPhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // We're already enforcing digit-only input with the inputFormatters
    final digitsOnly = value;

    // Check if it starts with valid Jordanian prefixes (7X without the leading 0)
    if (!digitsOnly.startsWith('7')) {
      return 'Number must start with 7';
    }

    final secondDigit = digitsOnly.length > 1 ? digitsOnly[1] : '';
    if (secondDigit != '7' && secondDigit != '8' && secondDigit != '9') {
      return 'Number must be 77, 78, or 79';
    }

    // Check for 9 digits (without the leading 0)
    if (digitsOnly.length != 9) {
      return 'Phone must be 9 digits after +962';
    }

    return null;
  }
}
