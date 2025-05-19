import 'package:freezed_annotation/freezed_annotation.dart';

part 'apply_promo_code_dto.freezed.dart';
part 'apply_promo_code_dto.g.dart';

@freezed
class ApplyPromoCodeDto with _$ApplyPromoCodeDto {
  const factory ApplyPromoCodeDto({
    required String promoCode,
  }) = _ApplyPromoCodeDto;

  factory ApplyPromoCodeDto.fromJson(Map<String, dynamic> json) => _$ApplyPromoCodeDtoFromJson(json);
}
