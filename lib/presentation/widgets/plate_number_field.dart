import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/utils/formatters/upper_case_text_formatter.dart';

class PlateNumberField extends StatelessWidget {
  final String value;
  final bool enabled;
  final void Function(String) onChanged;
  final TextEditingController controller;

  const PlateNumberField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.enabled,
    required this.controller,
  });

  bool _isValidNumber(String number) {
    if (number.isEmpty) return false;
    if (number.length > 5) return false;

    // Check if it contains only valid characters
    if (!RegExp(r'^[0-9XY]+$').hasMatch(number)) {
      return false;
    }

    // If it contains X or Y, ensure the rest are numbers
    if (number.contains('X') || number.contains('Y')) {
      final digits = number.replaceAll('X', '').replaceAll('Y', '');
      if (!RegExp(r'^[0-9]+$').hasMatch(digits)) {
        return false;
      }
    }

    return true;
  }

  String? validateNumber(String? value, BuildContext context) {
    final m = Localization.of(context);
    if (value == null || value.isEmpty) {
      return m.addplate.number_required;
    }

    if (!_isValidNumber(value)) {
      return m.addplate.invalid_number;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return TextFormField(
      controller: controller,
      enabled: enabled,
      maxLength: 5,
      keyboardType: TextInputType.text,
      inputFormatters: [
        UppercaseTextFormatter(),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9XY]')),
      ],
      decoration: InputDecoration(
        labelText: m.addplate.number,
        counterText: '',
        labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        suffixIcon: Tooltip(
          message: m.addplate.mask_instructions,
          child: Icon(
            Icons.info_outline,
            color: Colors.grey.shade600,
            size: 20,
          ),
        ),
      ),
      validator: (value) => validateNumber(value, context),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
