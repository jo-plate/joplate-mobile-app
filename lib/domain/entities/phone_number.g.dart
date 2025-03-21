// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneNumberImpl _$$PhoneNumberImplFromJson(Map<String, dynamic> json) =>
    _$PhoneNumberImpl(
      number: json['number'] as String,
      ad: ListingV2.fromJson(json['ad'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PhoneNumberImplToJson(_$PhoneNumberImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'ad': instance.ad,
    };
