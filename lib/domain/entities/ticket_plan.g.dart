// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TicketPlanImpl _$$TicketPlanImplFromJson(Map<String, dynamic> json) =>
    _$TicketPlanImpl(
      amount: (json['amount'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
      productIds: Map<String, String>.from(json['productIds'] as Map),
      title: json['title'] as String,
      titleAr: json['titleAr'] as String,
    );

Map<String, dynamic> _$$TicketPlanImplToJson(_$TicketPlanImpl instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'price': instance.price,
      'productIds': instance.productIds,
      'title': instance.title,
      'titleAr': instance.titleAr,
    };
