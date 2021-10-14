// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) {
  return OrderModel(
    id: json['id'] as int,
    customerId: json['customer_id'] as String,
    orderId: json['order_id'] as String,
    orderQtyTotal: json['order_qty_total'] as int,
    orderPriceTotal: json['order_price_total'] as String,
    orderShippingTotal: json['order_shipping_total'] as String,
    orderVoucherDeduction: json['order_voucher_deduction'] as String,
    orderPointDeduction: json['order_point_deduction'] as String,
    orderPayTotal: json['order_pay_total'] as String,
    orderShippingPlaceId: json['order_shipping_place_id'] as String,
    orderShippingLatitude: json['order_shipping_latitude'] as String,
    orderShippingLongitude: json['order_shipping_longitude'] as String,
    orderShippingAddress: json['order_shipping_address'] as String,
    orderShippingNote: json['order_shipping_note'] as String,
    orderShippingReceiverName: json['order_shipping_receiver_name'] as String,
    orderShippingReceiverPhone: json['order_shipping_receiver_phone'] as String,
    orderStatus: json['order_status'] as String,
    paymentChannel: json['payment_channel'] == null
        ? null
        : PaymentChannelModel.fromJson(
            json['payment_channel'] as Map<String, dynamic>),
    payment: json['payment'] == null
        ? null
        : PaymentModel.fromJson(json['payment'] as Map<String, dynamic>),
    orderItems: (json['order_items'] as List)
        ?.map((e) => e == null
            ? null
            : OrderItemModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orderShippings: (json['order_shippings'] as List)
        ?.map((e) => e == null
            ? null
            : OrderShippingModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    vouchers: (json['vouchers'] as List)
        ?.map((e) =>
            e == null ? null : VoucherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    voucherHistories: (json['voucher_histories'] as List)
        ?.map((e) => e == null
            ? null
            : VoucherHistoryModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    orderStatuses: (json['order_statuses'] as List)
        ?.map((e) => e == null
            ? null
            : OrderStatusModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customer_id': instance.customerId,
      'order_id': instance.orderId,
      'order_qty_total': instance.orderQtyTotal,
      'order_price_total': instance.orderPriceTotal,
      'order_shipping_total': instance.orderShippingTotal,
      'order_voucher_deduction': instance.orderVoucherDeduction,
      'order_point_deduction': instance.orderPointDeduction,
      'order_pay_total': instance.orderPayTotal,
      'order_shipping_place_id': instance.orderShippingPlaceId,
      'order_shipping_latitude': instance.orderShippingLatitude,
      'order_shipping_longitude': instance.orderShippingLongitude,
      'order_shipping_address': instance.orderShippingAddress,
      'order_shipping_note': instance.orderShippingNote,
      'order_shipping_receiver_name': instance.orderShippingReceiverName,
      'order_shipping_receiver_phone': instance.orderShippingReceiverPhone,
      'order_status': instance.orderStatus,
      'payment_channel': instance.paymentChannel,
      'payment': instance.payment,
      'order_items': instance.orderItems,
      'order_shippings': instance.orderShippings,
      'vouchers': instance.vouchers,
      'voucher_histories': instance.voucherHistories,
      'order_statuses': instance.orderStatuses,
    };
