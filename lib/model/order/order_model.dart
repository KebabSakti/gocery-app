import 'package:ayov2/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable(nullable: false)
class OrderModel {
  OrderModel({
    this.id,
    this.customerId,
    this.orderId,
    this.orderQtyTotal,
    this.orderPriceTotal,
    this.orderShippingTotal,
    this.orderVoucherDeduction,
    this.orderPointDeduction,
    this.orderPayTotal,
    this.orderShippingPlaceId,
    this.orderShippingLatitude,
    this.orderShippingLongitude,
    this.orderShippingAddress,
    this.orderShippingNote,
    this.orderShippingReceiverName,
    this.orderShippingReceiverPhone,
    this.orderStatus,
    this.paymentChannel,
    this.payment,
    this.orderItems,
    this.orderShippings,
    this.vouchers,
    this.voucherHistories,
    this.orderStatuses,
  });

  @JsonKey(name: 'id', nullable: true)
  int id;
  @JsonKey(name: 'customer_id', nullable: true)
  String customerId;
  @JsonKey(name: 'order_id', nullable: true)
  String orderId;
  @JsonKey(name: 'order_qty_total', nullable: true)
  int orderQtyTotal;
  @JsonKey(name: 'order_price_total', nullable: true)
  String orderPriceTotal;
  @JsonKey(name: 'order_shipping_total', nullable: true)
  String orderShippingTotal;
  @JsonKey(name: 'order_voucher_deduction', nullable: true)
  String orderVoucherDeduction;
  @JsonKey(name: 'order_point_deduction', nullable: true)
  String orderPointDeduction;
  @JsonKey(name: 'order_pay_total', nullable: true)
  String orderPayTotal;
  @JsonKey(name: 'order_shipping_place_id', nullable: true)
  String orderShippingPlaceId;
  @JsonKey(name: 'order_shipping_latitude', nullable: true)
  String orderShippingLatitude;
  @JsonKey(name: 'order_shipping_longitude', nullable: true)
  String orderShippingLongitude;
  @JsonKey(name: 'order_shipping_address', nullable: true)
  String orderShippingAddress;
  @JsonKey(name: 'order_shipping_note', nullable: true)
  String orderShippingNote;
  @JsonKey(name: 'order_shipping_receiver_name', nullable: true)
  String orderShippingReceiverName;
  @JsonKey(name: 'order_shipping_receiver_phone', nullable: true)
  String orderShippingReceiverPhone;
  @JsonKey(name: 'order_status', nullable: true)
  String orderStatus;
  @JsonKey(name: 'payment_channel', nullable: true)
  PaymentChannelModel paymentChannel;
  @JsonKey(name: 'payment', nullable: true)
  PaymentModel payment;
  @JsonKey(name: 'order_items', nullable: true)
  List<OrderItemModel> orderItems;
  @JsonKey(name: 'order_shippings', nullable: true)
  List<OrderShippingModel> orderShippings;
  @JsonKey(name: 'vouchers', nullable: true)
  List<VoucherModel> vouchers;
  @JsonKey(name: 'voucher_histories', nullable: true)
  List<VoucherHistoryModel> voucherHistories;
  @JsonKey(name: 'order_statuses', nullable: true)
  List<OrderStatusModel> orderStatuses;

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
