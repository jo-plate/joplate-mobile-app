// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserProfile {
  String get displayName => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phonenumber => throw _privateConstructorUsedError;
  int get tickets => throw _privateConstructorUsedError;
  int get goldenTickets => throw _privateConstructorUsedError;
  String get plan => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String displayName,
      String id,
      String email,
      String phonenumber,
      int tickets,
      int goldenTickets,
      String plan});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? id = null,
    Object? email = null,
    Object? phonenumber = null,
    Object? tickets = null,
    Object? goldenTickets = null,
    Object? plan = null,
  }) {
    return _then(_value.copyWith(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phonenumber: null == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String displayName,
      String id,
      String email,
      String phonenumber,
      int tickets,
      int goldenTickets,
      String plan});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
    Object? id = null,
    Object? email = null,
    Object? phonenumber = null,
    Object? tickets = null,
    Object? goldenTickets = null,
    Object? plan = null,
  }) {
    return _then(_$UserProfileImpl(
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phonenumber: null == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String,
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
              as String,
    ));
  }
}

/// @nodoc

class _$UserProfileImpl extends _UserProfile {
  const _$UserProfileImpl(
      {this.displayName = 'Guest',
      this.id = '-1',
      this.email = '',
      this.phonenumber = '',
      this.tickets = 0,
      this.goldenTickets = 0,
      this.plan = "free_plan"})
      : super._();

  @override
  @JsonKey()
  final String displayName;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String phonenumber;
  @override
  @JsonKey()
  final int tickets;
  @override
  @JsonKey()
  final int goldenTickets;
  @override
  @JsonKey()
  final String plan;

  @override
  String toString() {
    return 'UserProfile(displayName: $displayName, id: $id, email: $email, phonenumber: $phonenumber, tickets: $tickets, goldenTickets: $goldenTickets, plan: $plan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phonenumber, phonenumber) ||
                other.phonenumber == phonenumber) &&
            (identical(other.tickets, tickets) || other.tickets == tickets) &&
            (identical(other.goldenTickets, goldenTickets) ||
                other.goldenTickets == goldenTickets) &&
            (identical(other.plan, plan) || other.plan == plan));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName, id, email,
      phonenumber, tickets, goldenTickets, plan);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);
}

abstract class _UserProfile extends UserProfile {
  const factory _UserProfile(
      {final String displayName,
      final String id,
      final String email,
      final String phonenumber,
      final int tickets,
      final int goldenTickets,
      final String plan}) = _$UserProfileImpl;
  const _UserProfile._() : super._();

  @override
  String get displayName;
  @override
  String get id;
  @override
  String get email;
  @override
  String get phonenumber;
  @override
  int get tickets;
  @override
  int get goldenTickets;
  @override
  String get plan;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
