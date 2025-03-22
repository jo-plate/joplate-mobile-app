// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phone_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhoneNumber _$PhoneNumberFromJson(Map<String, dynamic> json) {
  return _PhoneNumber.fromJson(json);
}

/// @nodoc
mixin _$PhoneNumber {
  String get number => throw _privateConstructorUsedError;
  List<ListingV2> get ads => throw _privateConstructorUsedError;

  /// Serializes this PhoneNumber to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhoneNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneNumberCopyWith<PhoneNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneNumberCopyWith<$Res> {
  factory $PhoneNumberCopyWith(
          PhoneNumber value, $Res Function(PhoneNumber) then) =
      _$PhoneNumberCopyWithImpl<$Res, PhoneNumber>;
  @useResult
  $Res call({String number, List<ListingV2> ads});
}

/// @nodoc
class _$PhoneNumberCopyWithImpl<$Res, $Val extends PhoneNumber>
    implements $PhoneNumberCopyWith<$Res> {
  _$PhoneNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? ads = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      ads: null == ads
          ? _value.ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<ListingV2>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhoneNumberImplCopyWith<$Res>
    implements $PhoneNumberCopyWith<$Res> {
  factory _$$PhoneNumberImplCopyWith(
          _$PhoneNumberImpl value, $Res Function(_$PhoneNumberImpl) then) =
      __$$PhoneNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String number, List<ListingV2> ads});
}

/// @nodoc
class __$$PhoneNumberImplCopyWithImpl<$Res>
    extends _$PhoneNumberCopyWithImpl<$Res, _$PhoneNumberImpl>
    implements _$$PhoneNumberImplCopyWith<$Res> {
  __$$PhoneNumberImplCopyWithImpl(
      _$PhoneNumberImpl _value, $Res Function(_$PhoneNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? ads = null,
  }) {
    return _then(_$PhoneNumberImpl(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      ads: null == ads
          ? _value._ads
          : ads // ignore: cast_nullable_to_non_nullable
              as List<ListingV2>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneNumberImpl extends _PhoneNumber {
  const _$PhoneNumberImpl(
      {required this.number, final List<ListingV2> ads = const []})
      : _ads = ads,
        super._();

  factory _$PhoneNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneNumberImplFromJson(json);

  @override
  final String number;
  final List<ListingV2> _ads;
  @override
  @JsonKey()
  List<ListingV2> get ads {
    if (_ads is EqualUnmodifiableListView) return _ads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ads);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneNumberImpl &&
            (identical(other.number, number) || other.number == number) &&
            const DeepCollectionEquality().equals(other._ads, _ads));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, number, const DeepCollectionEquality().hash(_ads));

  /// Create a copy of PhoneNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneNumberImplCopyWith<_$PhoneNumberImpl> get copyWith =>
      __$$PhoneNumberImplCopyWithImpl<_$PhoneNumberImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneNumberImplToJson(
      this,
    );
  }
}

abstract class _PhoneNumber extends PhoneNumber {
  const factory _PhoneNumber(
      {required final String number,
      final List<ListingV2> ads}) = _$PhoneNumberImpl;
  const _PhoneNumber._() : super._();

  factory _PhoneNumber.fromJson(Map<String, dynamic> json) =
      _$PhoneNumberImpl.fromJson;

  @override
  String get number;
  @override
  List<ListingV2> get ads;

  /// Create a copy of PhoneNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneNumberImplCopyWith<_$PhoneNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
