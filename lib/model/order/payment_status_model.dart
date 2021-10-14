import 'package:json_annotation/json_annotation.dart';

part 'payment_status_model.g.dart';

@JsonSerializable(nullable: false)
class PaymentStatusModel {
  PaymentStatusModel({
    this.paymentId,
    this.paymentStatusId,
    this.paymentStatusNote,
    this.paymentUserId,
    this.paymentUrl,
    this.paymentOther,
    this.paymentOtherValue,
    this.paymentStatus,
    this.paymentExpiryDate,
  });

  @JsonKey(name: 'payment_id', nullable: true)
  String paymentId;
  @JsonKey(name: 'payment_status_id', nullable: true)
  String paymentStatusId;
  @JsonKey(name: 'payment_status_note', nullable: true)
  String paymentStatusNote;
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

  factory PaymentStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentStatusModelToJson(this);
}
