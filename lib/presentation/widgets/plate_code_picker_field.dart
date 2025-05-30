import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';
import 'package:joplate/presentation/utils/formatters/upper_case_text_formatter.dart';

class PlateCodePickerField extends StatelessWidget {
  final String value;
  final bool enabled;
  final void Function(String) onChanged;
  final TextEditingController controller;

  const PlateCodePickerField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.enabled,
    required this.controller,
  });

  static const validCodes = [
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '77',
    '80',
    '88',
  ];

  bool _isValidCode(String code) {
    // Check if it's a direct match with valid codes
    if (validCodes.contains(code)) {
      return true;
    }

    // Check if it's a valid code with X or Y
    if (code.length == 2) {
      // Replace X or Y with 0-9 and check if any combination matches a valid code
      final firstChar = code[0];
      final secondChar = code[1];

      if (secondChar == 'X' || secondChar == 'Y') {
        // Try all possible numbers for the second position
        for (var i = 0; i <= 9; i++) {
          final testCode = '$firstChar$i';
          if (validCodes.contains(testCode)) {
            return true;
          }
        }
      }

      if (firstChar == 'X' || firstChar == 'Y') {
        // Try all possible numbers for the first position
        for (var i = 0; i <= 9; i++) {
          final testCode = '$i$secondChar';
          if (validCodes.contains(testCode)) {
            return true;
          }
        }
      }
    }

    return false;
  }

  String? validatePlateCode(String? value, BuildContext context) {
    final m = Localization.of(context);
    if (value == null || value.isEmpty) {
      return m.addplate.code_required;
    }

    // Remove any spaces
    final cleanValue = value.replaceAll(' ', '');

    // Check if it's a valid code
    if (!_isValidCode(cleanValue)) {
      return m.addplate.invalid_code;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final m = Localization.of(context);
    return TextFormField(
      controller: controller,
      enabled: enabled,
      maxLength: 2,
      keyboardType: TextInputType.text,
      inputFormatters: [
        UppercaseTextFormatter(),
        FilteringTextInputFormatter.allow(RegExp(r'[0-9XY]')),
      ],
      decoration: InputDecoration(
        labelText: m.plates.code,
        hintText: m.addplate.select_code,
        counterText: '',
        labelStyle: const TextStyle(fontSize: 14),
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
      validator: (value) => validatePlateCode(value, context),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
