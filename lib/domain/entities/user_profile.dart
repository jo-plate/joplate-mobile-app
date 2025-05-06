import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

@freezed
class UserProfile with _$UserProfile {
  const UserProfile._();

  const factory UserProfile({
    @Default('Guest') String displayName,
    @Default('Guest') String name,
    @Default('-1') String id,
    @Default('') String email,
    @Default('') String phonenumber,
    @Default(false) bool isVerified,
    @Default(false) bool pendingVerification,
  }) = _UserProfile;

  factory UserProfile.fromSnapshot(DocumentSnapshot snapshot) {
    return UserProfile.fromJson(
      {'id': snapshot.id, ...snapshot.data() as Map<String, dynamic>},
    );
  }

  factory UserProfile.empty() => const UserProfile(id: '-1', displayName: '', phonenumber: '', email: '', name: '');

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'displayName': displayName,
      'email': email,
      'phonenumber': phonenumber,
      'name': name,
    };
  }
}
