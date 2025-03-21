import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    @Default('Guest') String displayName,
    @Default('-1') String id,
    @Default('') String email,
    @Default('') String phonenumber,
    
  }) = _UserProfile;

  factory UserProfile.empty() => const UserProfile(
        id: '-1',
        displayName: '',
        phonenumber: '',
        email: '',
      );

  factory UserProfile.fromJson(Map<String, dynamic> map) {
    return UserProfile(
      id: map['id'] ?? '',
      displayName: map['displayName'] ?? '',
      email: map['email'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'phonenumber': phonenumber,
    };
  }
}
