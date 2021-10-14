// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusModel _$OrderStatusModelFromJson(Map<String, dynamic> json) {
  return OrderStatusModel(
    orderId: json['order_id'] as String,
    orderStatusId: json['order_status_id'] as String,
    orderStatusNote: json['order_status_note'] as String,
    orderStatus: json['order_status'] as String,
  );
}

Map<String, dynamic> _$OrderStatusModelToJson(OrderStatusModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'order_status_id': instance.orderStatusId,
      'order_status_note': instance.orderStatusNote,
      'order_status': instance.orderStatus,
    };
