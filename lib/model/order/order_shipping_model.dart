import 'package:ayov2/model/order/order_shipping_status_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_shipping_model.g.dart';

@JsonSerializable(nullable: false)
class OrderShippingModel {
  OrderShippingModel({
    this.orderId,
    this.courierId,
    this.orderShippingId,
    this.orderShippingDeliveryType,
    this.orderShippingDistance,
    this.orderShippingFee,
    this.orderShippingTime,
    this.orderShippingStatus,
    this.orderShippingStatusModel,
  });

  @JsonKey(name: 'order_id', nullable: true)
  String orderId;
  @JsonKey(name: 'courier_id', nullable: true)
  String courierId;
  @JsonKey(name: 'order_shipping_id', nullable: true)
  String orderShippingId;
  @JsonKey(name: 'order_shipping_delivery_type', nullable: true)
  String orderShippingDeliveryType;
  @JsonKey(name: 'order_shipping_distance', nullable: true)
  int orderShippingDistance;
  @JsonKey(name: 'order_shipping_fee', nullable: true)
  String orderShippingFee;
  @JsonKey(name: 'order_shipping_time', nullable: true)
  String orderShippingTime;
  @JsonKey(name: 'order_shipping_status', nullable: true)
  String orderShippingStatus;
  @JsonKey(name: 'order_shipping_statuses', nullable: true)
  List<OrderShippingStatusModel> orderShippingStatusModel;

  factory OrderShippingModel.fromJson(Map<String, dynamic> json) =>
      _$OrderShippingModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderShippingModelToJson(this);
}
