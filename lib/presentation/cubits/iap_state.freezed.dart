// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iap_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$IAPState {
  bool get isPurchasing => throw _privateConstructorUsedError;
  String? get listingId => throw _privateConstructorUsedError;
  String? get itemType => throw _privateConstructorUsedError;

  /// Create a copy of IAPState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IAPStateCopyWith<IAPState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IAPStateCopyWith<$Res> {
  factory $IAPStateCopyWith(IAPState value, $Res Function(IAPState) then) =
      _$IAPStateCopyWithImpl<$Res, IAPState>;
  @useResult
  $Res call({bool isPurchasing, String? listingId, String? itemType});
}

/// @nodoc
class _$IAPStateCopyWithImpl<$Res, $Val extends IAPState>
    implements $IAPStateCopyWith<$Res> {
  _$IAPStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IAPState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPurchasing = null,
    Object? listingId = freezed,
    Object? itemType = freezed,
  }) {
    return _then(_value.copyWith(
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      listingId: freezed == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemType: freezed == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IAPStateImplCopyWith<$Res>
    implements $IAPStateCopyWith<$Res> {
  factory _$$IAPStateImplCopyWith(
          _$IAPStateImpl value, $Res Function(_$IAPStateImpl) then) =
      __$$IAPStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isPurchasing, String? listingId, String? itemType});
}

/// @nodoc
class __$$IAPStateImplCopyWithImpl<$Res>
    extends _$IAPStateCopyWithImpl<$Res, _$IAPStateImpl>
    implements _$$IAPStateImplCopyWith<$Res> {
  __$$IAPStateImplCopyWithImpl(
      _$IAPStateImpl _value, $Res Function(_$IAPStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of IAPState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPurchasing = null,
    Object? listingId = freezed,
    Object? itemType = freezed,
  }) {
    return _then(_$IAPStateImpl(
      isPurchasing: null == isPurchasing
          ? _value.isPurchasing
          : isPurchasing // ignore: cast_nullable_to_non_nullable
              as bool,
      listingId: freezed == listingId
          ? _value.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String?,
      itemType: freezed == itemType
          ? _value.itemType
          : itemType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$IAPStateImpl implements _IAPState {
  const _$IAPStateImpl(
      {this.isPurchasing = false, this.listingId, this.itemType});

  @override
  @JsonKey()
  final bool isPurchasing;
  @override
  final String? listingId;
  @override
  final String? itemType;

  @override
  String toString() {
    return 'IAPState(isPurchasing: $isPurchasing, listingId: $listingId, itemType: $itemType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IAPStateImpl &&
            (identical(other.isPurchasing, isPurchasing) ||
                other.isPurchasing == isPurchasing) &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.itemType, itemType) ||
                other.itemType == itemType));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isPurchasing, listingId, itemType);

  /// Create a copy of IAPState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IAPStateImplCopyWith<_$IAPStateImpl> get copyWith =>
      __$$IAPStateImplCopyWithImpl<_$IAPStateImpl>(this, _$identity);
}

abstract class _IAPState implements IAPState {
  const factory _IAPState(
      {final bool isPurchasing,
      final String? listingId,
      final String? itemType}) = _$IAPStateImpl;

  @override
  bool get isPurchasing;
  @override
  String? get listingId;
  @override
  String? get itemType;

  /// Create a copy of IAPState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IAPStateImplCopyWith<_$IAPStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
