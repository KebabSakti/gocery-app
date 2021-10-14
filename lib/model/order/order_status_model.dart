import 'package:json_annotation/json_annotation.dart';

part 'order_status_model.g.dart';

@JsonSerializable(nullable: false)
class OrderStatusModel {
  OrderStatusModel({
    this.orderId,
    this.orderStatusId,
    this.orderStatusNote,
    this.orderStatus,
  });

  @JsonKey(name: 'order_id', nullable: true)
  String orderId;
  @JsonKey(name: 'order_status_id', nullable: true)
  String orderStatusId;
  @JsonKey(name: 'order_status_note', nullable: true)
  String orderStatusNote;
  @JsonKey(name: 'order_status', nullable: true)
  String orderStatus;

  factory OrderStatusModel.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStatusModelToJson(this);
}
