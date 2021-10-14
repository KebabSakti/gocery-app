import 'package:json_annotation/json_annotation.dart';

part 'payment_model.g.dart';

@JsonSerializable(nullable: false)
class PaymentModel {
  PaymentModel({
    this.orderId,
    this.paymentChannelId,
    this.paymentId,
    this.paymentUserId,
    this.paymentUrl,
    this.paymentOther,
    this.paymentOtherValue,
    this.paymentStatus,
    this.paymentExpiryDate,
  });

  @JsonKey(name: 'order_id', nullable: true)
  String orderId;
  @JsonKey(name: 'payment_channel_id', nullable: true)
  String paymentChannelId;
  @JsonKey(name: 'payment_id', nullable: true)
  String paymentId;
  @JsonKey(name: 'payment_user_id', nullable: true)
  String paymentUserId;
  @JsonKey(name: 'payment_url', nullable: true)
  String paymentUrl;
  @JsonKey(name: 'payment_other', nullable: true)
  String paymentOther;
  @JsonKey(name: 'payment_value', nullable: true)
  String paymentOtherValue;
  @JsonKey(name: 'payment_status', nullable: true)
  String paymentStatus;
  @JsonKey(name: 'payment_expiry_date', nullable: true)
  DateTime paymentExpiryDate;

  factory PaymentModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModelToJson(this);
}
