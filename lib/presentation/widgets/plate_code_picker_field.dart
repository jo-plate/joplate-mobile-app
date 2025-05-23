import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:joplate/presentation/i18n/localization_provider.dart';

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

  String? validatePlateCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Plate code is required';
    }
    if (!validCodes.contains(value)) {
      return 'Invalid plate code';
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
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        labelText: m.plates.code,
        hintText: m.addplate.select_code,
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
      ),
      validator: validatePlateCode,
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
