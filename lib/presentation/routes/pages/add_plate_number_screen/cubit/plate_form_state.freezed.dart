// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plate_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PlateFormState {
  String get code => throw _privateConstructorUsedError;
  String get number => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  bool get withDiscount => throw _privateConstructorUsedError;
  String? get discountPrice => throw _privateConstructorUsedError;
  bool get isSubmitting => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of PlateFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlateFormStateCopyWith<PlateFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlateFormStateCopyWith<$Res> {
  factory $PlateFormStateCopyWith(
          PlateFormState value, $Res Function(PlateFormState) then) =
      _$PlateFormStateCopyWithImpl<$Res, PlateFormState>;
  @useResult
  $Res call(
      {String code,
      String number,
      String price,
      bool withDiscount,
      String? discountPrice,
      bool isSubmitting,
      String? errorMessage});
}

/// @nodoc
class _$PlateFormStateCopyWithImpl<$Res, $Val extends PlateFormState>
    implements $PlateFormStateCopyWith<$Res> {
  _$PlateFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlateFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? number = null,
    Object? price = null,
    Object? withDiscount = null,
    Object? discountPrice = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      withDiscount: null == withDiscount
          ? _value.withDiscount
          : withDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlateFormStateImplCopyWith<$Res>
    implements $PlateFormStateCopyWith<$Res> {
  factory _$$PlateFormStateImplCopyWith(_$PlateFormStateImpl value,
          $Res Function(_$PlateFormStateImpl) then) =
      __$$PlateFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String code,
      String number,
      String price,
      bool withDiscount,
      String? discountPrice,
      bool isSubmitting,
      String? errorMessage});
}

/// @nodoc
class __$$PlateFormStateImplCopyWithImpl<$Res>
    extends _$PlateFormStateCopyWithImpl<$Res, _$PlateFormStateImpl>
    implements _$$PlateFormStateImplCopyWith<$Res> {
  __$$PlateFormStateImplCopyWithImpl(
      _$PlateFormStateImpl _value, $Res Function(_$PlateFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlateFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? number = null,
    Object? price = null,
    Object? withDiscount = null,
    Object? discountPrice = freezed,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$PlateFormStateImpl(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      withDiscount: null == withDiscount
          ? _value.withDiscount
          : withDiscount // ignore: cast_nullable_to_non_nullable
              as bool,
      discountPrice: freezed == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      isSubmitting: null == isSubmitting
          ? _value.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PlateFormStateImpl implements _PlateFormState {
  const _$PlateFormStateImpl(
      {required this.code,
      required this.number,
      required this.price,
      required this.withDiscount,
      this.discountPrice,
      this.isSubmitting = false,
      this.errorMessage});

  @override
  final String code;
  @override
  final String number;
  @override
  final String price;
  @override
  final bool withDiscount;
  @override
  final String? discountPrice;
  @override
  @JsonKey()
  final bool isSubmitting;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'PlateFormState(code: $code, number: $number, price: $price, withDiscount: $withDiscount, discountPrice: $discountPrice, isSubmitting: $isSubmitting, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlateFormStateImpl &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.withDiscount, withDiscount) ||
                other.withDiscount == withDiscount) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, code, number, price,
      withDiscount, discountPrice, isSubmitting, errorMessage);

  /// Create a copy of PlateFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlateFormStateImplCopyWith<_$PlateFormStateImpl> get copyWith =>
      __$$PlateFormStateImplCopyWithImpl<_$PlateFormStateImpl>(
          this, _$identity);
}

abstract class _PlateFormState implements PlateFormState {
  const factory _PlateFormState(
      {required final String code,
      required final String number,
      required final String price,
      required final bool withDiscount,
      final String? discountPrice,
      final bool isSubmitting,
      final String? errorMessage}) = _$PlateFormStateImpl;

  @override
  String get code;
  @override
  String get number;
  @override
  String get price;
  @override
  bool get withDiscount;
  @override
  String? get discountPrice;
  @override
  bool get isSubmitting;
  @override
  String? get errorMessage;

  /// Create a copy of PlateFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlateFormStateImplCopyWith<_$PlateFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AddPlateNumbersState {
  List<PlateFormState> get forms => throw _privateConstructorUsedError;

  /// Create a copy of AddPlateNumbersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddPlateNumbersStateCopyWith<AddPlateNumbersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPlateNumbersStateCopyWith<$Res> {
  factory $AddPlateNumbersStateCopyWith(AddPlateNumbersState value,
          $Res Function(AddPlateNumbersState) then) =
      _$AddPlateNumbersStateCopyWithImpl<$Res, AddPlateNumbersState>;
  @useResult
  $Res call({List<PlateFormState> forms});
}

/// @nodoc
class _$AddPlateNumbersStateCopyWithImpl<$Res,
        $Val extends AddPlateNumbersState>
    implements $AddPlateNumbersStateCopyWith<$Res> {
  _$AddPlateNumbersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddPlateNumbersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forms = null,
  }) {
    return _then(_value.copyWith(
      forms: null == forms
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<PlateFormState>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddPlateNumbersStateImplCopyWith<$Res>
    implements $AddPlateNumbersStateCopyWith<$Res> {
  factory _$$AddPlateNumbersStateImplCopyWith(_$AddPlateNumbersStateImpl value,
          $Res Function(_$AddPlateNumbersStateImpl) then) =
      __$$AddPlateNumbersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PlateFormState> forms});
}

/// @nodoc
class __$$AddPlateNumbersStateImplCopyWithImpl<$Res>
    extends _$AddPlateNumbersStateCopyWithImpl<$Res, _$AddPlateNumbersStateImpl>
    implements _$$AddPlateNumbersStateImplCopyWith<$Res> {
  __$$AddPlateNumbersStateImplCopyWithImpl(_$AddPlateNumbersStateImpl _value,
      $Res Function(_$AddPlateNumbersStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddPlateNumbersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? forms = null,
  }) {
    return _then(_$AddPlateNumbersStateImpl(
      forms: null == forms
          ? _value._forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<PlateFormState>,
    ));
  }
}

/// @nodoc

class _$AddPlateNumbersStateImpl implements _AddPlateNumbersState {
  const _$AddPlateNumbersStateImpl({required final List<PlateFormState> forms})
      : _forms = forms;

  final List<PlateFormState> _forms;
  @override
  List<PlateFormState> get forms {
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forms);
  }

  @override
  String toString() {
    return 'AddPlateNumbersState(forms: $forms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPlateNumbersStateImpl &&
            const DeepCollectionEquality().equals(other._forms, _forms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_forms));

  /// Create a copy of AddPlateNumbersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPlateNumbersStateImplCopyWith<_$AddPlateNumbersStateImpl>
      get copyWith =>
          __$$AddPlateNumbersStateImplCopyWithImpl<_$AddPlateNumbersStateImpl>(
              this, _$identity);
}

abstract class _AddPlateNumbersState implements AddPlateNumbersState {
  const factory _AddPlateNumbersState(
      {required final List<PlateFormState> forms}) = _$AddPlateNumbersStateImpl;

  @override
  List<PlateFormState> get forms;

  /// Create a copy of AddPlateNumbersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPlateNumbersStateImplCopyWith<_$AddPlateNumbersStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
