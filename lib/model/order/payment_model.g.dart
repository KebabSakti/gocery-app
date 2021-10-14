// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) {
  return PaymentModel(
    orderId: json['order_id'] as String,
    paymentChannelId: json['payment_channel_id'] as String,
    paymentId: json['payment_id'] as String,
    paymentUserId: json['payment_user_id'] as String,
    paymentUrl: json['payment_url'] as String,
    paymentOther: json['payment_other'] as String,
    paymentOtherValue: json['payment_value'] as String,
    paymentStatus: json['payment_status'] as String,
    paymentExpiryDate: json['payment_expiry_date'] == null
        ? null
        : DateTime.parse(json['payment_expiry_date'] as String),
  );
}

Map<String, dynamic> _$PaymentModelToJson(PaymentModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'payment_channel_id': instance.paymentChannelId,
      'payment_id': instance.paymentId,
      'payment_user_id': instance.paymentUserId,
      'payment_url': instance.paymentUrl,
      'payment_other': instance.paymentOther,
      'payment_value': instance.paymentOtherValue,
      'payment_status': instance.paymentStatus,
      'payment_expiry_date': instance.paymentExpiryDate?.toIso8601String(),
    };
