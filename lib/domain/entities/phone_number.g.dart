// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneNumberImpl _$$PhoneNumberImplFromJson(Map<String, dynamic> json) =>
    _$PhoneNumberImpl(
      number: json['number'] as String,
      ads: (json['ads'] as List<dynamic>?)
              ?.map((e) => ListingV2.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PhoneNumberImplToJson(_$PhoneNumberImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'ads': instance.ads,
    };
