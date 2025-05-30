import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/utils/converters.dart';

part 'user_notification.freezed.dart';
part 'user_notification.g.dart';

@freezed
class UserNotification with _$UserNotification {
  const UserNotification._();

  const factory UserNotification({
    required String notificationId,
    @Default('') String title,
    @Default('') String body,
    @Default(false) bool read,
    @Default('default') String type,
    String? targetId,
    @TimestampConverter() DateTime? timestamp,
  }) = _UserNotification;

  factory UserNotification.fromJson(Map<String, dynamic> json) => _$UserNotificationFromJson(json);

  factory UserNotification.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) return UserNotification.empty();
    return UserNotification.fromJson({
      'notificationId': snapshot.id,
      ...data,
    });
  }

  factory UserNotification.empty() => const UserNotification(
        notificationId: '',
      );
}
