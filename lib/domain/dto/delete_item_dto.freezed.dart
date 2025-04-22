// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeleteItemDto _$DeleteItemDtoFromJson(Map<String, dynamic> json) {
  return _DeleteItemDto.fromJson(json);
}

/// @nodoc
mixin _$DeleteItemDto {
  String get id => throw _privateConstructorUsedError;
  ItemType get itemType => throw _privateConstructorUsedError;
  ListingType get listingType => throw _privateConstructorUsedError;
  bool get isSold => throw _privateConstructorUsedError;

  /// Serializes this DeleteItemDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeleteItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeleteItemDtoCopyWith<DeleteItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteItemDtoCopyWith<$Res> {
  factory $DeleteItemDtoCopyWith(
          DeleteItemDto value, $Res Function(DeleteItemDto) then) =
      _$DeleteItemDtoCopyWithImpl<$Res, DeleteItemDto>;
  @useResult
  $Res call(
      {String id, ItemType itemType, ListingType listingType, bool isSold});
}

/// @nodoc
class _$DeleteItemDtoCopyWithImpl<$Res, $Val extends DeleteItemDto>
    implements $DeleteItemDtoCopyWith<$Res> {
  _$DeleteItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeleteItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemType = null,
    Object? listingType = null,
    Object? isSold = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteItemDtoImplCopyWith<$Res>
    implements $DeleteItemDtoCopyWith<$Res> {
  factory _$$DeleteItemDtoImplCopyWith(
          _$DeleteItemDtoImpl value, $Res Function(_$DeleteItemDtoImpl) then) =
      __$$DeleteItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, ItemType itemType, ListingType listingType, bool isSold});
}

/// @nodoc
class __$$DeleteItemDtoImplCopyWithImpl<$Res>
    extends _$DeleteItemDtoCopyWithImpl<$Res, _$DeleteItemDtoImpl>
    implements _$$DeleteItemDtoImplCopyWith<$Res> {
  __$$DeleteItemDtoImplCopyWithImpl(
      _$DeleteItemDtoImpl _value, $Res Function(_$DeleteItemDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeleteItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemType = null,
    Object? listingType = null,
    Object? isSold = null,
  }) {
    return _then(_$DeleteItemDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      itemType: null == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as ItemType,
      listingType: null == listingType
          ? _value.listingType
          : listingType // ignore: cast_nullable_to_non_nullable
              as ListingType,
      isSold: null == isSold
          ? _value.isSold
          : isSold // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeleteItemDtoImpl extends _DeleteItemDto {
  const _$DeleteItemDtoImpl(
      {required this.id,
      required this.itemType,
      required this.listingType,
      this.isSold = false})
      : super._();

  factory _$DeleteItemDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeleteItemDtoImplFromJson(json);

  @override
  final String id;
  @override
  final ItemType itemType;
  @override
  final ListingType listingType;
  @override
  @JsonKey()
  final bool isSold;

  @override
  String toString() {
    return 'DeleteItemDto(id: $id, itemType: $itemType, listingType: $listingType, isSold: $isSold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteItemDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType) &&
            (identical(other.listingType, listingType) ||
                other.listingType == listingType) &&
            (identical(other.isSold, isSold) || other.isSold == isSold));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, itemType, listingType, isSold);

  /// Create a copy of DeleteItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteItemDtoImplCopyWith<_$DeleteItemDtoImpl> get copyWith =>
      __$$DeleteItemDtoImplCopyWithImpl<_$DeleteItemDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeleteItemDtoImplToJson(
      this,
    );
  }
}

abstract class _DeleteItemDto extends DeleteItemDto {
  const factory _DeleteItemDto(
      {required final String id,
      required final ItemType itemType,
      required final ListingType listingType,
      final bool isSold}) = _$DeleteItemDtoImpl;
  const _DeleteItemDto._() : super._();

  factory _DeleteItemDto.fromJson(Map<String, dynamic> json) =
      _$DeleteItemDtoImpl.fromJson;

  @override
  String get id;
  @override
  ItemType get itemType;
  @override
  ListingType get listingType;
  @override
  bool get isSold;

  /// Create a copy of DeleteItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteItemDtoImplCopyWith<_$DeleteItemDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
