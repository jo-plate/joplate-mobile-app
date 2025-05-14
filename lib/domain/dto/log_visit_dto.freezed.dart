// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'log_visit_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LogVisitDto _$LogVisitDtoFromJson(Map<String, dynamic> json) {
  return _LogVisitDto.fromJson(json);
}

/// @nodoc
mixin _$LogVisitDto {
  String get listingId => throw _privateConstructorUsedError;
  ListingType get listingType => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;

  /// Serializes this LogVisitDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LogVisitDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LogVisitDtoCopyWith<LogVisitDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LogVisitDtoCopyWith<$Res> {
  factory $LogVisitDtoCopyWith(
          LogVisitDto value, $Res Function(LogVisitDto) then) =
      _$LogVisitDtoCopyWithImpl<$Res, LogVisitDto>;
  @useResult
  $Res call({String listingId, ListingType listingType, ItemType itemType});
}

/// @nodoc
class _$LogVisitDtoCopyWithImpl<$Res, $Val extends LogVisitDto>
    implements $LogVisitDtoCopyWith<$Res> {
  _$LogVisitDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LogVisitDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? listingType = null,
    Object? itemType = null,
  }) {
    return _then(_value.copyWith(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LogVisitDtoImplCopyWith<$Res>
    implements $LogVisitDtoCopyWith<$Res> {
  factory _$$LogVisitDtoImplCopyWith(
          _$LogVisitDtoImpl value, $Res Function(_$LogVisitDtoImpl) then) =
      __$$LogVisitDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String listingId, ListingType listingType, ItemType itemType});
}

/// @nodoc
class __$$LogVisitDtoImplCopyWithImpl<$Res>
    extends _$LogVisitDtoCopyWithImpl<$Res, _$LogVisitDtoImpl>
    implements _$$LogVisitDtoImplCopyWith<$Res> {
  __$$LogVisitDtoImplCopyWithImpl(
      _$LogVisitDtoImpl _value, $Res Function(_$LogVisitDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of LogVisitDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? listingType = null,
    Object? itemType = null,
  }) {
    return _then(_$LogVisitDtoImpl(
      listingId: null == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LogVisitDtoImpl implements _LogVisitDto {
  const _$LogVisitDtoImpl(
      {required this.listingId,
      required this.listingType,
      required this.itemType});

  factory _$LogVisitDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$LogVisitDtoImplFromJson(json);

  @override
  final String listingId;
  @override
  final ListingType listingType;
  @override
  final ItemType itemType;

  @override
  String toString() {
    return 'LogVisitDto(listingId: $listingId, listingType: $listingType, itemType: $itemType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogVisitDtoImpl &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, listingId, listingType, itemType);

  /// Create a copy of LogVisitDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogVisitDtoImplCopyWith<_$LogVisitDtoImpl> get copyWith =>
      __$$LogVisitDtoImplCopyWithImpl<_$LogVisitDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LogVisitDtoImplToJson(
      this,
    );
  }
}

abstract class _LogVisitDto implements LogVisitDto {
  const factory _LogVisitDto(
      {required final String listingId,
      required final ListingType listingType,
      required final ItemType itemType}) = _$LogVisitDtoImpl;

  factory _LogVisitDto.fromJson(Map<String, dynamic> json) =
      _$LogVisitDtoImpl.fromJson;

  @override
  String get listingId;
  @override
  ListingType get listingType;
  @override
  ItemType get itemType;

  /// Create a copy of LogVisitDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogVisitDtoImplCopyWith<_$LogVisitDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
