import 'package:freezed_annotation/freezed_annotation.dart';

part 'plate_number.freezed.dart';
part 'plate_number.g.dart';

@freezed
class PlateNumber with _$PlateNumber {
  const PlateNumber._();

  const factory PlateNumber({
    required String code,
    required String number,
  }) = _PlateNumber;

  static List<PlateNumber> mockList(int number) {
    return List.generate(
      number,
      (index) => PlateNumber(
        code: (10 + index).toString(),
        number: (1004 + index).toString(),
      ),
    );
  }

  factory PlateNumber.fromJson(Map<String, dynamic> json) =>
      _$PlateNumberFromJson(json);

  factory PlateNumber.fromString(String plateNumber) {
    final parts = plateNumber.split('-');
    return PlateNumber(code: parts[0], number: parts[1]);
  }
  

String get format {
  final n = number;

  if (_hasRepeatedDigits(n, 2)) return "Contains Digit Repeated 2 Times";
  if (_hasRepeatedDigits(n, 3)) return "Contains Digit Repeated 3 Times";
  if (_hasRepeatedDigits(n, 4)) return "Contains Digit Repeated 4 Times";

  final patterns = <String, RegExp>{
    "X???X (5 Digits)": RegExp(r'^(\d)\d{3}\1$'),
    "XYZYX (5 Digits)": RegExp(r'^(\d)(\d)(\d)\2\1$'),
    "XXXZX (5 Digits)": RegExp(r'^(\d)\1\1\d\1$'),
    "?XXX? (5 Digits)": RegExp(r'^\d(\d{3})\d$'),
    "XYXYX (5 Digits)": RegExp(r'^(\d)(\d)\1\2\1$'),
    "XYYYX (5 Digits)": RegExp(r'^(\d)(\d)\2\2\1$'),
    "??XXX (5 Digits)": RegExp(r'^\d{2}(\d)\1\1$'),
    "XXX?? (5 Digits)": RegExp(r'^(\d)\1\1\d{2}$'),
    "XXXXX (5 Digits)": RegExp(r'^(\d)\1{4}$'),
    "X??X (4 Digits)": RegExp(r'^(\d)\d{2}\1$'),
    "XYXX (4 Digits)": RegExp(r'^(\d)(\d)\1\1$'),
    "XYXY (4 Digits)": RegExp(r'^(\d)(\d)\1\2$'),
    "?XX? (4 Digits)": RegExp(r'^\d(\d{2})\d$'),
    "XXXY (4 Digits)": RegExp(r'^(\d)\1\1\d$'),
    "XYYY (4 Digits)": RegExp(r'^(\d)(\d)\2\2$'),
    "XXXX (4 Digits)": RegExp(r'^(\d)\1{3}$'),
    "XYX (3 Digits)": RegExp(r'^(\d)(\d)\1$'),
    "XYZ (3 Digits)": RegExp(r'^(\d)(\d)(\d)$'),
    "XYY (3 Digits)": RegExp(r'^(\d)(\d)\2$'),
    "XXY (3 Digits)": RegExp(r'^(\d)\1(\d)$'),
    "XXX (3 Digits)": RegExp(r'^(\d)\1{2}$'),
  };

  for (final entry in patterns.entries) {
    if (entry.value.hasMatch(n)) return entry.key;
  }

  return "Unknown Format";
}

bool _hasRepeatedDigits(String input, int count) {
  final digitCounts = <String, int>{};
  for (final char in input.split('')) {
    digitCounts[char] = (digitCounts[char] ?? 0) + 1;
  }
  return digitCounts.values.any((v) => v >= count);
}


  @override
  String toString() => '$code-$number';
}
