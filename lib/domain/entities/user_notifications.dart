import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joplate/domain/entities/user_notification.dart';
import 'package:joplate/domain/entities/utils/converters.dart';

part 'user_notifications.freezed.dart';
part 'user_notifications.g.dart';

@freezed
class UserNotifications with _$UserNotifications {
  const UserNotifications._();

  const factory UserNotifications({
    required String userId,
    @Default([]) List<UserNotification> notificationsList,
    @TimestampConverter() DateTime? lastUpdated,
  }) = _UserNotifications;

  factory UserNotifications.fromJson(Map<String, dynamic> json) => _$UserNotificationsFromJson(json);

  factory UserNotifications.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) return UserNotifications.empty();

    final notificationsList = (data['notificationsList'] as List<dynamic>?) ?? [];
    return UserNotifications(
      userId: snapshot.id,
      notificationsList: notificationsList.map((e) => UserNotification.fromJson(e)).toList(),
    );
  }

  factory UserNotifications.empty() => const UserNotifications(
        userId: '',
      );
}
