// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      displayName: json['displayName'] as String? ?? 'Guest',
      name: json['name'] as String? ?? 'Guest',
      id: json['id'] as String? ?? '-1',
      email: json['email'] as String? ?? '',
      phonenumber: json['phonenumber'] as String? ?? '',
      isVerified: json['isVerified'] as bool? ?? false,
      pendingVerification: json['pendingVerification'] as bool? ?? false,
      imageUrl: json['imageUrl'] as String? ?? '',
      followingList: (json['followingList'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'name': instance.name,
      'id': instance.id,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'isVerified': instance.isVerified,
      'pendingVerification': instance.pendingVerification,
      'imageUrl': instance.imageUrl,
      'followingList': instance.followingList,
      'fcmTokens': instance.fcmTokens,
    };
