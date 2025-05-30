// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_notifications.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserNotifications _$UserNotificationsFromJson(Map<String, dynamic> json) {
  return _UserNotifications.fromJson(json);
}

/// @nodoc
mixin _$UserNotifications {
  String get userId => throw _privateConstructorUsedError;
  List<UserNotification> get notificationsList =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this UserNotifications to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserNotificationsCopyWith<UserNotifications> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserNotificationsCopyWith<$Res> {
  factory $UserNotificationsCopyWith(
          UserNotifications value, $Res Function(UserNotifications) then) =
      _$UserNotificationsCopyWithImpl<$Res, UserNotifications>;
  @useResult
  $Res call(
      {String userId,
      List<UserNotification> notificationsList,
      @TimestampConverter() DateTime? lastUpdated});
}

/// @nodoc
class _$UserNotificationsCopyWithImpl<$Res, $Val extends UserNotifications>
    implements $UserNotificationsCopyWith<$Res> {
  _$UserNotificationsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? notificationsList = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsList: null == notificationsList
          ? _value.notificationsList
          : notificationsList // ignore: cast_nullable_to_non_nullable
              as List<UserNotification>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserNotificationsImplCopyWith<$Res>
    implements $UserNotificationsCopyWith<$Res> {
  factory _$$UserNotificationsImplCopyWith(_$UserNotificationsImpl value,
          $Res Function(_$UserNotificationsImpl) then) =
      __$$UserNotificationsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      List<UserNotification> notificationsList,
      @TimestampConverter() DateTime? lastUpdated});
}

/// @nodoc
class __$$UserNotificationsImplCopyWithImpl<$Res>
    extends _$UserNotificationsCopyWithImpl<$Res, _$UserNotificationsImpl>
    implements _$$UserNotificationsImplCopyWith<$Res> {
  __$$UserNotificationsImplCopyWithImpl(_$UserNotificationsImpl _value,
      $Res Function(_$UserNotificationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? notificationsList = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$UserNotificationsImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationsList: null == notificationsList
          ? _value._notificationsList
          : notificationsList // ignore: cast_nullable_to_non_nullable
              as List<UserNotification>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserNotificationsImpl extends _UserNotifications {
  const _$UserNotificationsImpl(
      {required this.userId,
      final List<UserNotification> notificationsList = const [],
      @TimestampConverter() this.lastUpdated})
      : _notificationsList = notificationsList,
        super._();

  factory _$UserNotificationsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserNotificationsImplFromJson(json);

  @override
  final String userId;
  final List<UserNotification> _notificationsList;
  @override
  @JsonKey()
  List<UserNotification> get notificationsList {
    if (_notificationsList is EqualUnmodifiableListView)
      return _notificationsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notificationsList);
  }

  @override
  @TimestampConverter()
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'UserNotifications(userId: $userId, notificationsList: $notificationsList, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserNotificationsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality()
                .equals(other._notificationsList, _notificationsList) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId,
      const DeepCollectionEquality().hash(_notificationsList), lastUpdated);

  /// Create a copy of UserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserNotificationsImplCopyWith<_$UserNotificationsImpl> get copyWith =>
      __$$UserNotificationsImplCopyWithImpl<_$UserNotificationsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserNotificationsImplToJson(
      this,
    );
  }
}

abstract class _UserNotifications extends UserNotifications {
  const factory _UserNotifications(
          {required final String userId,
          final List<UserNotification> notificationsList,
          @TimestampConverter() final DateTime? lastUpdated}) =
      _$UserNotificationsImpl;
  const _UserNotifications._() : super._();

  factory _UserNotifications.fromJson(Map<String, dynamic> json) =
      _$UserNotificationsImpl.fromJson;

  @override
  String get userId;
  @override
  List<UserNotification> get notificationsList;
  @override
  @TimestampConverter()
  DateTime? get lastUpdated;

  /// Create a copy of UserNotifications
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserNotificationsImplCopyWith<_$UserNotificationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
