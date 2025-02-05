import 'package:freezed_annotation/freezed_annotation.dart';

part 'plate_number.freezed.dart';
part 'plate_number.g.dart';

@freezed
class PlateNumber with _$PlateNumber {
  const PlateNumber._();

  const factory PlateNumber({
    required String code,
    required String number,
    required String price,
  }) = _PlateNumber;

  static List<PlateNumber> mockList(int number) {
    return List.generate(
      number,
      (index) => PlateNumber(
        code: (10 + index).toString(),
        number: (10044 + index).toString(),
        price: (10000 + index).toString(),
      ),
    );
  }

  factory PlateNumber.fromJson(Map<String, dynamic> json) => _$PlateNumberFromJson(json);

}
