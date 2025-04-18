// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhoneRequest _$PhoneRequestFromJson(Map<String, dynamic> json) {
  return _PhoneRequest.fromJson(json);
}

/// @nodoc
mixin _$PhoneRequest {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isDisabled => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  PhoneNumber get item => throw _privateConstructorUsedError;

  /// Serializes this PhoneRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PhoneRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PhoneRequestCopyWith<PhoneRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneRequestCopyWith<$Res> {
  factory $PhoneRequestCopyWith(
          PhoneRequest value, $Res Function(PhoneRequest) then) =
      _$PhoneRequestCopyWithImpl<$Res, PhoneRequest>;
  @useResult
  $Res call(
      {String id,
      double price,
      bool isDisabled,
      String userId,
      PhoneNumber item});

  $PhoneNumberCopyWith<$Res> get item;
}

/// @nodoc
class _$PhoneRequestCopyWithImpl<$Res, $Val extends PhoneRequest>
    implements $PhoneRequestCopyWith<$Res> {
  _$PhoneRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PhoneRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? isDisabled = null,
    Object? userId = null,
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isDisabled: null == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
    ) as $Val);
  }

  /// Create a copy of PhoneRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PhoneNumberCopyWith<$Res> get item {
    return $PhoneNumberCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhoneRequestImplCopyWith<$Res>
    implements $PhoneRequestCopyWith<$Res> {
  factory _$$PhoneRequestImplCopyWith(
          _$PhoneRequestImpl value, $Res Function(_$PhoneRequestImpl) then) =
      __$$PhoneRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      bool isDisabled,
      String userId,
      PhoneNumber item});

  @override
  $PhoneNumberCopyWith<$Res> get item;
}

/// @nodoc
class __$$PhoneRequestImplCopyWithImpl<$Res>
    extends _$PhoneRequestCopyWithImpl<$Res, _$PhoneRequestImpl>
    implements _$$PhoneRequestImplCopyWith<$Res> {
  __$$PhoneRequestImplCopyWithImpl(
      _$PhoneRequestImpl _value, $Res Function(_$PhoneRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PhoneRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? isDisabled = null,
    Object? userId = null,
    Object? item = null,
  }) {
    return _then(_$PhoneRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isDisabled: null == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PhoneNumber,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhoneRequestImpl extends _PhoneRequest {
  _$PhoneRequestImpl(
      {required this.id,
      this.price = 0,
      this.isDisabled = false,
      required this.userId,
      required this.item})
      : super._();

  factory _$PhoneRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhoneRequestImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final bool isDisabled;
  @override
  final String userId;
  @override
  final PhoneNumber item;

  @override
  String toString() {
    return 'PhoneRequest(id: $id, price: $price, isDisabled: $isDisabled, userId: $userId, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhoneRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isDisabled, isDisabled) ||
                other.isDisabled == isDisabled) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, price, isDisabled, userId, item);

  /// Create a copy of PhoneRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PhoneRequestImplCopyWith<_$PhoneRequestImpl> get copyWith =>
      __$$PhoneRequestImplCopyWithImpl<_$PhoneRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhoneRequestImplToJson(
      this,
    );
  }
}

abstract class _PhoneRequest extends PhoneRequest {
  factory _PhoneRequest(
      {required final String id,
      final double price,
      final bool isDisabled,
      required final String userId,
      required final PhoneNumber item}) = _$PhoneRequestImpl;
  _PhoneRequest._() : super._();

  factory _PhoneRequest.fromJson(Map<String, dynamic> json) =
      _$PhoneRequestImpl.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  bool get isDisabled;
  @override
  String get userId;
  @override
  PhoneNumber get item;

  /// Create a copy of PhoneRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PhoneRequestImplCopyWith<_$PhoneRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlateRequest _$PlateRequestFromJson(Map<String, dynamic> json) {
  return _PlateRequest.fromJson(json);
}

/// @nodoc
mixin _$PlateRequest {
  String get id => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isDisabled => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  PlateNumber get item => throw _privateConstructorUsedError;

  /// Serializes this PlateRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlateRequestCopyWith<PlateRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlateRequestCopyWith<$Res> {
  factory $PlateRequestCopyWith(
          PlateRequest value, $Res Function(PlateRequest) then) =
      _$PlateRequestCopyWithImpl<$Res, PlateRequest>;
  @useResult
  $Res call(
      {String id,
      double price,
      bool isDisabled,
      String userId,
      PlateNumber item});

  $PlateNumberCopyWith<$Res> get item;
}

/// @nodoc
class _$PlateRequestCopyWithImpl<$Res, $Val extends PlateRequest>
    implements $PlateRequestCopyWith<$Res> {
  _$PlateRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? isDisabled = null,
    Object? userId = null,
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isDisabled: null == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PlateNumber,
    ) as $Val);
  }

  /// Create a copy of PlateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlateNumberCopyWith<$Res> get item {
    return $PlateNumberCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlateRequestImplCopyWith<$Res>
    implements $PlateRequestCopyWith<$Res> {
  factory _$$PlateRequestImplCopyWith(
          _$PlateRequestImpl value, $Res Function(_$PlateRequestImpl) then) =
      __$$PlateRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double price,
      bool isDisabled,
      String userId,
      PlateNumber item});

  @override
  $PlateNumberCopyWith<$Res> get item;
}

/// @nodoc
class __$$PlateRequestImplCopyWithImpl<$Res>
    extends _$PlateRequestCopyWithImpl<$Res, _$PlateRequestImpl>
    implements _$$PlateRequestImplCopyWith<$Res> {
  __$$PlateRequestImplCopyWithImpl(
      _$PlateRequestImpl _value, $Res Function(_$PlateRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlateRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? price = null,
    Object? isDisabled = null,
    Object? userId = null,
    Object? item = null,
  }) {
    return _then(_$PlateRequestImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isDisabled: null == isDisabled
          ? _value.isDisabled
          : isDisabled // ignore: cast_nullable_to_non_nullable
              as bool,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as PlateNumber,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlateRequestImpl extends _PlateRequest {
  _$PlateRequestImpl(
      {required this.id,
      this.price = 0,
      this.isDisabled = false,
      required this.userId,
      required this.item})
      : super._();

  factory _$PlateRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlateRequestImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final double price;
  @override
  @JsonKey()
  final bool isDisabled;
  @override
  final String userId;
  @override
  final PlateNumber item;

  @override
  String toString() {
    return 'PlateRequest(id: $id, price: $price, isDisabled: $isDisabled, userId: $userId, item: $item)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlateRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isDisabled, isDisabled) ||
                other.isDisabled == isDisabled) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.item, item) || other.item == item));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, price, isDisabled, userId, item);

  /// Create a copy of PlateRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlateRequestImplCopyWith<_$PlateRequestImpl> get copyWith =>
      __$$PlateRequestImplCopyWithImpl<_$PlateRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlateRequestImplToJson(
      this,
    );
  }
}

abstract class _PlateRequest extends PlateRequest {
  factory _PlateRequest(
      {required final String id,
      final double price,
      final bool isDisabled,
      required final String userId,
      required final PlateNumber item}) = _$PlateRequestImpl;
  _PlateRequest._() : super._();

  factory _PlateRequest.fromJson(Map<String, dynamic> json) =
      _$PlateRequestImpl.fromJson;

  @override
  String get id;
  @override
  double get price;
  @override
  bool get isDisabled;
  @override
  String get userId;
  @override
  PlateNumber get item;

  /// Create a copy of PlateRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlateRequestImplCopyWith<_$PlateRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
