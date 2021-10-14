import 'package:json_annotation/json_annotation.dart';

part 'order_shipping_status_model.g.dart';

@JsonSerializable(nullable: false)
class OrderShippingStatusModel {
  OrderShippingStatusModel({
    this.orderShippingId,
    this.orderShippingStatusId,
    this.orderShippingStatusNote,
    this.orderShippingStatus,
  });

  @JsonKey(name: 'order_shipping_id', nullable: true)
  String orderShippingId;
  @JsonKey(name: 'order_shipping_status_id', nullable: true)
  String orderShippingStatusId;
  @JsonKey(name: 'order_shipping_status_note', nullable: true)
  String orderShippingStatusNote;
  @JsonKey(name: 'order_shipping_status', nullable: true)
  String orderShippingStatus;

  factory OrderShippingStatusModel.fromJson(Map<String, dynamic> json) =>
      _$OrderShippingStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderShippingStatusModelToJson(this);
}
