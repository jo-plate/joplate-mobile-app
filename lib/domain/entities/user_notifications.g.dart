// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserNotificationsImpl _$$UserNotificationsImplFromJson(
        Map<String, dynamic> json) =>
    _$UserNotificationsImpl(
      userId: json['userId'] as String,
      notificationsList: (json['notificationsList'] as List<dynamic>?)
              ?.map((e) => UserNotification.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastUpdated: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastUpdated'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$UserNotificationsImplToJson(
        _$UserNotificationsImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'notificationsList': instance.notificationsList,
      'lastUpdated': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastUpdated, const TimestampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
