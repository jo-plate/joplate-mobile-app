import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlateCodePickerField extends StatelessWidget {
  final String value;
  final bool enabled;
  final void Function(String) onChanged;

  const PlateCodePickerField({
    super.key,
    required this.value,
    required this.onChanged,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled
          ? () => showPlateCodePicker(
                context: context,
                currentValue: value,
                onSelected: onChanged,
              )
          : null,
      child: InputDecorator(
        decoration: const InputDecoration(
          hintText: 'Code',
        ),
        child: value.isEmpty
            ? Text(
                "Select Code",
                style: TextStyle(color: Colors.grey[500]!, fontSize: 16),
              )
            : Text(value),
      ),
    );
  }

  Future<void> showPlateCodePicker({
    required BuildContext context,
    required String currentValue,
    required void Function(String) onSelected,
  }) async {
    const codes = [
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

    final initialIndex = codes.indexOf(currentValue);
    final controller = FixedExtentScrollController(
        initialItem: initialIndex >= 0 ? initialIndex : 0);
    int selectedIndex = controller.initialItem;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (_) => SizedBox(
        height: 300,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          color: const Color(0xFF981C1E),
                          fontSize: 16,
                          decoration: TextDecoration.none),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      onSelected(codes[selectedIndex]);
                    },
                    child: const Text(
                      'Done',
                      style: TextStyle(
                          color: const Color(0xFF981C1E),
                          fontSize: 16,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: CupertinoPicker(
                scrollController: controller,
                itemExtent: 44,
                onSelectedItemChanged: (index) => selectedIndex = index,
                children: codes.map((c) => Center(child: Text(c))).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
