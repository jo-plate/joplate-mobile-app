import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_plate_number_input.freezed.dart';

@freezed
class AddPlateNumberInput with _$AddPlateNumberInput {
  const factory AddPlateNumberInput({
    required String code,
    required String number,
    required int price,
    int? discountPrice,
  }) = _AddPlateNumberInput;
}
