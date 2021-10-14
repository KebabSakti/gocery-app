// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_shipping_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderShippingModel _$OrderShippingModelFromJson(Map<String, dynamic> json) {
  return OrderShippingModel(
    orderId: json['order_id'] as String,
    courierId: json['courier_id'] as String,
    orderShippingId: json['order_shipping_id'] as String,
    orderShippingDeliveryType: json['order_shipping_delivery_type'] as String,
    orderShippingDistance: json['order_shipping_distance'] as int,
    orderShippingFee: json['order_shipping_fee'] as String,
    orderShippingTime: json['order_shipping_time'] as String,
    orderShippingStatus: json['order_shipping_status'] as String,
    orderShippingStatusModel: (json['order_shipping_statuses'] as List)
        ?.map((e) => e == null
            ? null
            : OrderShippingStatusModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderShippingModelToJson(OrderShippingModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'courier_id': instance.courierId,
      'order_shipping_id': instance.orderShippingId,
      'order_shipping_delivery_type': instance.orderShippingDeliveryType,
      'order_shipping_distance': instance.orderShippingDistance,
      'order_shipping_fee': instance.orderShippingFee,
      'order_shipping_time': instance.orderShippingTime,
      'order_shipping_status': instance.orderShippingStatus,
      'order_shipping_statuses': instance.orderShippingStatusModel,
    };
