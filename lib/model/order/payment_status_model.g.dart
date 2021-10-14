// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentStatusModel _$PaymentStatusModelFromJson(Map<String, dynamic> json) {
  return PaymentStatusModel(
    paymentId: json['payment_id'] as String,
    paymentStatusId: json['payment_status_id'] as String,
    paymentStatusNote: json['payment_status_note'] as String,
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

Map<String, dynamic> _$PaymentStatusModelToJson(PaymentStatusModel instance) =>
    <String, dynamic>{
      'payment_id': instance.paymentId,
      'payment_status_id': instance.paymentStatusId,
      'payment_status_note': instance.paymentStatusNote,
      'payment_user_id': instance.paymentUserId,
      'payment_url': instance.paymentUrl,
      'payment_other': instance.paymentOther,
      'payment_value': instance.paymentOtherValue,
      'payment_status': instance.paymentStatus,
      'payment_expiry_date': instance.paymentExpiryDate?.toIso8601String(),
    };
