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

  InputDecoration get inputFieldStyle => InputDecoration(
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
      );

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
        decoration: inputFieldStyle.copyWith(
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
    final controller = FixedExtentScrollController(initialItem: initialIndex >= 0 ? initialIndex : 0);
    int selectedIndex = controller.initialItem;

    await showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      builder: (_) => Container(
        color: Colors.white,
        child: SizedBox(
          height: 300,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 50,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Color(0xFF981C1E), fontSize: 16, decoration: TextDecoration.none),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        onSelected(codes[selectedIndex]);
                      },
                      child: const Text(
                        'Done',
                        style: TextStyle(color: Color(0xFF981C1E), fontSize: 16, decoration: TextDecoration.none),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: CupertinoTheme(
                    data: const CupertinoThemeData(
                      primaryColor: Color(0xFF981C1E),
                      brightness: Brightness.light,
                    ),
                    child: CupertinoPicker(
                      scrollController: controller,
                      itemExtent: 44,
                      backgroundColor: Colors.white,
                      onSelectedItemChanged: (index) => selectedIndex = index,
                      children: codes
                          .map((c) => Center(
                                child: Text(
                                  c,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
