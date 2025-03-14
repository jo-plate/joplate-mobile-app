// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_plans.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserPlans _$UserPlansFromJson(Map<String, dynamic> json) {
  return _UserPlans.fromJson(json);
}

/// @nodoc
mixin _$UserPlans {
  int get tickets => throw _privateConstructorUsedError;
  int get goldenTickets => throw _privateConstructorUsedError;
  PlanType get plan => throw _privateConstructorUsedError;

  /// Serializes this UserPlans to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserPlans
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserPlansCopyWith<UserPlans> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserPlansCopyWith<$Res> {
  factory $UserPlansCopyWith(UserPlans value, $Res Function(UserPlans) then) =
      _$UserPlansCopyWithImpl<$Res, UserPlans>;
  @useResult
  $Res call({int tickets, int goldenTickets, PlanType plan});
}

/// @nodoc
class _$UserPlansCopyWithImpl<$Res, $Val extends UserPlans>
    implements $UserPlansCopyWith<$Res> {
  _$UserPlansCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserPlans
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? goldenTickets = null,
    Object? plan = null,
  }) {
    return _then(_value.copyWith(
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as int,
      goldenTickets: null == goldenTickets
          ? _value.goldenTickets
          : goldenTickets // ignore: cast_nullable_to_non_nullable
              as int,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as PlanType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserPlansImplCopyWith<$Res>
    implements $UserPlansCopyWith<$Res> {
  factory _$$UserPlansImplCopyWith(
          _$UserPlansImpl value, $Res Function(_$UserPlansImpl) then) =
      __$$UserPlansImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int tickets, int goldenTickets, PlanType plan});
}

/// @nodoc
class __$$UserPlansImplCopyWithImpl<$Res>
    extends _$UserPlansCopyWithImpl<$Res, _$UserPlansImpl>
    implements _$$UserPlansImplCopyWith<$Res> {
  __$$UserPlansImplCopyWithImpl(
      _$UserPlansImpl _value, $Res Function(_$UserPlansImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserPlans
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? goldenTickets = null,
    Object? plan = null,
  }) {
    return _then(_$UserPlansImpl(
      tickets: null == tickets
          ? _value.tickets
          : tickets // ignore: cast_nullable_to_non_nullable
              as int,
      goldenTickets: null == goldenTickets
          ? _value.goldenTickets
          : goldenTickets // ignore: cast_nullable_to_non_nullable
              as int,
      plan: null == plan
          ? _value.plan
          : plan // ignore: cast_nullable_to_non_nullable
              as PlanType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserPlansImpl extends _UserPlans {
  const _$UserPlansImpl(
      {this.tickets = 0,
      this.goldenTickets = 0,
      this.plan = PlanType.free_plan})
      : super._();

  factory _$UserPlansImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserPlansImplFromJson(json);

  @override
  @JsonKey()
  final int tickets;
  @override
  @JsonKey()
  final int goldenTickets;
  @override
  @JsonKey()
  final PlanType plan;

  @override
  String toString() {
    return 'UserPlans(tickets: $tickets, goldenTickets: $goldenTickets, plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserPlansImpl &&
            (identical(other.tickets, tickets) || other.tickets == tickets) &&
            (identical(other.goldenTickets, goldenTickets) ||
                other.goldenTickets == goldenTickets) &&
            (identical(other.plan, plan) || other.plan == plan));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tickets, goldenTickets, plan);

  /// Create a copy of UserPlans
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserPlansImplCopyWith<_$UserPlansImpl> get copyWith =>
      __$$UserPlansImplCopyWithImpl<_$UserPlansImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserPlansImplToJson(
      this,
    );
  }
}

abstract class _UserPlans extends UserPlans {
  const factory _UserPlans(
      {final int tickets,
      final int goldenTickets,
      final PlanType plan}) = _$UserPlansImpl;
  const _UserPlans._() : super._();

  factory _UserPlans.fromJson(Map<String, dynamic> json) =
      _$UserPlansImpl.fromJson;

  @override
  int get tickets;
  @override
  int get goldenTickets;
  @override
  PlanType get plan;

  /// Create a copy of UserPlans
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserPlansImplCopyWith<_$UserPlansImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
