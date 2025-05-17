// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserNotificationImpl _$$UserNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$UserNotificationImpl(
      notificationId: json['notificationId'] as String,
      title: json['title'] as String? ?? '',
      body: json['body'] as String? ?? '',
      read: json['read'] as bool? ?? false,
      type: json['type'] as String? ?? 'default',
      targetId: json['targetId'] as String?,
      fcmToken: json['fcmToken'] as String?,
      timestamp: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['timestamp'], const TimestampConverter().fromJson),
    );

Map<String, dynamic> _$$UserNotificationImplToJson(
        _$UserNotificationImpl instance) =>
    <String, dynamic>{
      'notificationId': instance.notificationId,
      'title': instance.title,
      'body': instance.body,
      'read': instance.read,
      'type': instance.type,
      'targetId': instance.targetId,
      'fcmToken': instance.fcmToken,
      'timestamp': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.timestamp, const TimestampConverter().toJson),
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
