import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    @Default('') String displayName,
    @Default('') String id,
    @Default('') String email,
    @Default('') String phonenumber,
    @Default(0) int tickets,
    @Default(0) int goldenTickets,
    @Default("free_plan") String plan,
  }) = _UserProfile;

  factory UserProfile.empty() => const UserProfile(
        id: '-1',
        displayName: 'Guest',
        phonenumber: '',
        email: '',
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'phonenumber': phonenumber,
    };
  }

  factory UserProfile.fromJson(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
    );
  }
}
