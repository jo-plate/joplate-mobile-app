// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'phone_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhoneNumberImpl _$$PhoneNumberImplFromJson(Map<String, dynamic> json) =>
    _$PhoneNumberImpl(
      number: json['number'] as String,
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$PhoneNumberImplToJson(_$PhoneNumberImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'description': instance.description,
    };
