// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Plan {
  String get displayName => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  List<String> get activePerks => throw _privateConstructorUsedError;
  List<String> get disabledPerks => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  Map<String, String> get productIds => throw _privateConstructorUsedError;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlanCopyWith<Plan> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlanCopyWith<$Res> {
  factory $PlanCopyWith(Plan value, $Res Function(Plan) then) =
      _$PlanCopyWithImpl<$Res, Plan>;
  @useResult
  $Res call(
      {String displayName,
      int price,
      List<String> activePerks,
      List<String> disabledPerks,
      Color color,
      Map<String, String> productIds});
}

/// @nodoc
class _$PlanCopyWithImpl<$Res, $Val extends Plan>
    implements $PlanCopyWith<$Res> {
  _$PlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? price = null,
    Object? activePerks = null,
    Object? disabledPerks = null,
    Object? color = null,
    Object? productIds = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      activePerks: null == activePerks
          ? _value.activePerks
          : activePerks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      disabledPerks: null == disabledPerks
          ? _value.disabledPerks
          : disabledPerks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      productIds: null == productIds
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlanImplCopyWith<$Res> implements $PlanCopyWith<$Res> {
  factory _$$PlanImplCopyWith(
          _$PlanImpl value, $Res Function(_$PlanImpl) then) =
      __$$PlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String displayName,
      int price,
      List<String> activePerks,
      List<String> disabledPerks,
      Color color,
      Map<String, String> productIds});
}

/// @nodoc
class __$$PlanImplCopyWithImpl<$Res>
    extends _$PlanCopyWithImpl<$Res, _$PlanImpl>
    implements _$$PlanImplCopyWith<$Res> {
  __$$PlanImplCopyWithImpl(_$PlanImpl _value, $Res Function(_$PlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? price = null,
    Object? activePerks = null,
    Object? disabledPerks = null,
    Object? color = null,
    Object? productIds = null,
  }) {
    return _then(_$PlanImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      activePerks: null == activePerks
          ? _value._activePerks
          : activePerks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      disabledPerks: null == disabledPerks
          ? _value._disabledPerks
          : disabledPerks // ignore: cast_nullable_to_non_nullable
              as List<String>,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      productIds: null == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$PlanImpl extends _Plan with DiagnosticableTreeMixin {
  const _$PlanImpl(
      {this.displayName = "Plan",
      this.price = 0,
      final List<String> activePerks = const [],
      final List<String> disabledPerks = const [],
      this.color = Colors.white,
      final Map<String, String> productIds = const {}})
      : _activePerks = activePerks,
        _disabledPerks = disabledPerks,
        _productIds = productIds,
        super._();

  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final int price;
  final List<String> _activePerks;
  @override
  @JsonKey()
  List<String> get activePerks {
    if (_activePerks is EqualUnmodifiableListView) return _activePerks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activePerks);
  }

  final List<String> _disabledPerks;
  @override
  @JsonKey()
  List<String> get disabledPerks {
    if (_disabledPerks is EqualUnmodifiableListView) return _disabledPerks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disabledPerks);
  }

  @override
  @JsonKey()
  final Color color;
  final Map<String, String> _productIds;
  @override
  @JsonKey()
  Map<String, String> get productIds {
    if (_productIds is EqualUnmodifiableMapView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_productIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Plan(displayName: $displayName, price: $price, activePerks: $activePerks, disabledPerks: $disabledPerks, color: $color, productIds: $productIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Plan'))
      ..add(DiagnosticsProperty('displayName', displayName))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('activePerks', activePerks))
      ..add(DiagnosticsProperty('disabledPerks', disabledPerks))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('productIds', productIds));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlanImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._activePerks, _activePerks) &&
            const DeepCollectionEquality()
                .equals(other._disabledPerks, _disabledPerks) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      displayName,
      price,
      const DeepCollectionEquality().hash(_activePerks),
      const DeepCollectionEquality().hash(_disabledPerks),
      color,
      const DeepCollectionEquality().hash(_productIds));

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      __$$PlanImplCopyWithImpl<_$PlanImpl>(this, _$identity);
}

abstract class _Plan extends Plan {
  const factory _Plan(
      {final String displayName,
      final int price,
      final List<String> activePerks,
      final List<String> disabledPerks,
      final Color color,
      final Map<String, String> productIds}) = _$PlanImpl;
  const _Plan._() : super._();

  @override
  String get displayName;
  @override
  int get price;
  @override
  List<String> get activePerks;
  @override
  List<String> get disabledPerks;
  @override
  Color get color;
  @override
  Map<String, String> get productIds;

  /// Create a copy of Plan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlanImplCopyWith<_$PlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
