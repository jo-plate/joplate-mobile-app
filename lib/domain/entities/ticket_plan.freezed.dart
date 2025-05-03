// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TicketPlan _$TicketPlanFromJson(Map<String, dynamic> json) {
  return _TicketPlan.fromJson(json);
}

/// @nodoc
mixin _$TicketPlan {
  int get amount => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  Map<String, String> get productIds => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get titleAr => throw _privateConstructorUsedError;

  /// Serializes this TicketPlan to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TicketPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketPlanCopyWith<TicketPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketPlanCopyWith<$Res> {
  factory $TicketPlanCopyWith(
          TicketPlan value, $Res Function(TicketPlan) then) =
      _$TicketPlanCopyWithImpl<$Res, TicketPlan>;
  @useResult
  $Res call(
      {int amount,
      double price,
      Map<String, String> productIds,
      String title,
      String titleAr});
}

/// @nodoc
class _$TicketPlanCopyWithImpl<$Res, $Val extends TicketPlan>
    implements $TicketPlanCopyWith<$Res> {
  _$TicketPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? price = null,
    Object? productIds = null,
    Object? title = null,
    Object? titleAr = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productIds: null == productIds
          ? _value.productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleAr: null == titleAr
          ? _value.titleAr
          : titleAr // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TicketPlanImplCopyWith<$Res>
    implements $TicketPlanCopyWith<$Res> {
  factory _$$TicketPlanImplCopyWith(
          _$TicketPlanImpl value, $Res Function(_$TicketPlanImpl) then) =
      __$$TicketPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int amount,
      double price,
      Map<String, String> productIds,
      String title,
      String titleAr});
}

/// @nodoc
class __$$TicketPlanImplCopyWithImpl<$Res>
    extends _$TicketPlanCopyWithImpl<$Res, _$TicketPlanImpl>
    implements _$$TicketPlanImplCopyWith<$Res> {
  __$$TicketPlanImplCopyWithImpl(
      _$TicketPlanImpl _value, $Res Function(_$TicketPlanImpl) _then)
      : super(_value, _then);

  /// Create a copy of TicketPlan
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? price = null,
    Object? productIds = null,
    Object? title = null,
    Object? titleAr = null,
  }) {
    return _then(_$TicketPlanImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      productIds: null == productIds
          ? _value._productIds
          : productIds // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      titleAr: null == titleAr
          ? _value.titleAr
          : titleAr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TicketPlanImpl extends _TicketPlan with DiagnosticableTreeMixin {
  const _$TicketPlanImpl(
      {required this.amount,
      required this.price,
      required final Map<String, String> productIds,
      required this.title,
      required this.titleAr})
      : _productIds = productIds,
        super._();

  factory _$TicketPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$TicketPlanImplFromJson(json);

  @override
  final int amount;
  @override
  final double price;
  final Map<String, String> _productIds;
  @override
  Map<String, String> get productIds {
    if (_productIds is EqualUnmodifiableMapView) return _productIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_productIds);
  }

  @override
  final String title;
  @override
  final String titleAr;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TicketPlan(amount: $amount, price: $price, productIds: $productIds, title: $title, titleAr: $titleAr)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TicketPlan'))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('productIds', productIds))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('titleAr', titleAr));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketPlanImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._productIds, _productIds) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.titleAr, titleAr) || other.titleAr == titleAr));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, amount, price,
      const DeepCollectionEquality().hash(_productIds), title, titleAr);

  /// Create a copy of TicketPlan
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketPlanImplCopyWith<_$TicketPlanImpl> get copyWith =>
      __$$TicketPlanImplCopyWithImpl<_$TicketPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TicketPlanImplToJson(
      this,
    );
  }
}

abstract class _TicketPlan extends TicketPlan {
  const factory _TicketPlan(
      {required final int amount,
      required final double price,
      required final Map<String, String> productIds,
      required final String title,
      required final String titleAr}) = _$TicketPlanImpl;
  const _TicketPlan._() : super._();

  factory _TicketPlan.fromJson(Map<String, dynamic> json) =
      _$TicketPlanImpl.fromJson;

  @override
  int get amount;
  @override
  double get price;
  @override
  Map<String, String> get productIds;
  @override
  String get title;
  @override
  String get titleAr;

  /// Create a copy of TicketPlan
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketPlanImplCopyWith<_$TicketPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
