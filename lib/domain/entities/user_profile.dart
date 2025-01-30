import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    required String displayName,
    required String id,
    required String email,
    required String phonenumber,
  }) = _UserProfile;

  factory UserProfile.empty() => const UserProfile(
        id: '',
        displayName: '',
        phonenumber: '',
        email: '',
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'phonenumber': phonenumber,
    };
  }
}
