// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plate_number.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlateNumberImpl _$$PlateNumberImplFromJson(Map<String, dynamic> json) =>
    _$PlateNumberImpl(
      code: json['code'] as String,
      number: json['number'] as String,
      ads: (json['ads'] as List<dynamic>?)
              ?.map((e) => ListingV2.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PlateNumberImplToJson(_$PlateNumberImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'number': instance.number,
      'ads': instance.ads,
    };
