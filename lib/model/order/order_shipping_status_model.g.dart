// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_shipping_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderShippingStatusModel _$OrderShippingStatusModelFromJson(
    Map<String, dynamic> json) {
  return OrderShippingStatusModel(
    orderShippingId: json['order_shipping_id'] as String,
    orderShippingStatusId: json['order_shipping_status_id'] as String,
    orderShippingStatusNote: json['order_shipping_status_note'] as String,
    orderShippingStatus: json['order_shipping_status'] as String,
  );
}

Map<String, dynamic> _$OrderShippingStatusModelToJson(
        OrderShippingStatusModel instance) =>
    <String, dynamic>{
      'order_shipping_id': instance.orderShippingId,
      'order_shipping_status_id': instance.orderShippingStatusId,
      'order_shipping_status_note': instance.orderShippingStatusNote,
      'order_shipping_status': instance.orderShippingStatus,
    };
