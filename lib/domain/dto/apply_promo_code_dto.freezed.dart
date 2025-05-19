// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'apply_promo_code_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApplyPromoCodeDto _$ApplyPromoCodeDtoFromJson(Map<String, dynamic> json) {
  return _ApplyPromoCodeDto.fromJson(json);
}

/// @nodoc
mixin _$ApplyPromoCodeDto {
  String get promoCode => throw _privateConstructorUsedError;

  /// Serializes this ApplyPromoCodeDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApplyPromoCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApplyPromoCodeDtoCopyWith<ApplyPromoCodeDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApplyPromoCodeDtoCopyWith<$Res> {
  factory $ApplyPromoCodeDtoCopyWith(
          ApplyPromoCodeDto value, $Res Function(ApplyPromoCodeDto) then) =
      _$ApplyPromoCodeDtoCopyWithImpl<$Res, ApplyPromoCodeDto>;
  @useResult
  $Res call({String promoCode});
}

/// @nodoc
class _$ApplyPromoCodeDtoCopyWithImpl<$Res, $Val extends ApplyPromoCodeDto>
    implements $ApplyPromoCodeDtoCopyWith<$Res> {
  _$ApplyPromoCodeDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApplyPromoCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = null,
  }) {
    return _then(_value.copyWith(
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApplyPromoCodeDtoImplCopyWith<$Res>
    implements $ApplyPromoCodeDtoCopyWith<$Res> {
  factory _$$ApplyPromoCodeDtoImplCopyWith(_$ApplyPromoCodeDtoImpl value,
          $Res Function(_$ApplyPromoCodeDtoImpl) then) =
      __$$ApplyPromoCodeDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String promoCode});
}

/// @nodoc
class __$$ApplyPromoCodeDtoImplCopyWithImpl<$Res>
    extends _$ApplyPromoCodeDtoCopyWithImpl<$Res, _$ApplyPromoCodeDtoImpl>
    implements _$$ApplyPromoCodeDtoImplCopyWith<$Res> {
  __$$ApplyPromoCodeDtoImplCopyWithImpl(_$ApplyPromoCodeDtoImpl _value,
      $Res Function(_$ApplyPromoCodeDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApplyPromoCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? promoCode = null,
  }) {
    return _then(_$ApplyPromoCodeDtoImpl(
      promoCode: null == promoCode
          ? _value.promoCode
          : promoCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApplyPromoCodeDtoImpl implements _ApplyPromoCodeDto {
  const _$ApplyPromoCodeDtoImpl({required this.promoCode});

  factory _$ApplyPromoCodeDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApplyPromoCodeDtoImplFromJson(json);

  @override
  final String promoCode;

  @override
  String toString() {
    return 'ApplyPromoCodeDto(promoCode: $promoCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApplyPromoCodeDtoImpl &&
            (identical(other.promoCode, promoCode) ||
                other.promoCode == promoCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, promoCode);

  /// Create a copy of ApplyPromoCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApplyPromoCodeDtoImplCopyWith<_$ApplyPromoCodeDtoImpl> get copyWith =>
      __$$ApplyPromoCodeDtoImplCopyWithImpl<_$ApplyPromoCodeDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApplyPromoCodeDtoImplToJson(
      this,
    );
  }
}

abstract class _ApplyPromoCodeDto implements ApplyPromoCodeDto {
  const factory _ApplyPromoCodeDto({required final String promoCode}) =
      _$ApplyPromoCodeDtoImpl;

  factory _ApplyPromoCodeDto.fromJson(Map<String, dynamic> json) =
      _$ApplyPromoCodeDtoImpl.fromJson;

  @override
  String get promoCode;

  /// Create a copy of ApplyPromoCodeDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApplyPromoCodeDtoImplCopyWith<_$ApplyPromoCodeDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
