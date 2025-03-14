// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_plans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPlansImpl _$$UserPlansImplFromJson(Map<String, dynamic> json) =>
    _$UserPlansImpl(
      tickets: (json['tickets'] as num?)?.toInt() ?? 0,
      goldenTickets: (json['goldenTickets'] as num?)?.toInt() ?? 0,
      plan: $enumDecodeNullable(_$PlanTypeEnumMap, json['plan']) ??
          PlanType.free_plan,
    );

Map<String, dynamic> _$$UserPlansImplToJson(_$UserPlansImpl instance) =>
    <String, dynamic>{
      'tickets': instance.tickets,
      'goldenTickets': instance.goldenTickets,
      'plan': _$PlanTypeEnumMap[instance.plan]!,
    };

const _$PlanTypeEnumMap = {
  PlanType.free_plan: 'free_plan',
  PlanType.gold_plan: 'gold_plan',
  PlanType.diamond_plan: 'diamond_plan',
};
