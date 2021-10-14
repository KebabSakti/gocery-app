import 'package:ayov2/model/model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_item_model.g.dart';

@JsonSerializable(nullable: false)
class OrderItemModel {
  OrderItemModel({
    this.orderId,
    this.productId,
    this.orderItemName,
    this.orderItemDescription,
    this.orderItemCover,
    this.orderItemPrice,
    this.orderItemDiscount,
    this.orderItemFinalPrice,
    this.orderItemUnit,
    this.orderItemUnitValue,
    this.orderItemPoint,
    this.orderItemId,
    this.orderItemNote,
    this.orderItemQtyTotal,
    this.orderItemPriceTotal,
    this.product,
  });

  @JsonKey(name: 'order_id', nullable: true)
  String orderId;
  @JsonKey(name: 'product_id', nullable: true)
  String productId;
  @JsonKey(name: 'order_item_name', nullable: true)
  String orderItemName;
  @JsonKey(name: 'order_item_description', nullable: true)
  String orderItemDescription;
  @JsonKey(name: 'order_item_cover', nullable: true)
  String orderItemCover;
  @JsonKey(name: 'order_item_price', nullable: true)
  String orderItemPrice;
  @JsonKey(name: 'order_item_discount', nullable: true)
  String orderItemDiscount;
  @JsonKey(name: 'order_item_final_price', nullable: true)
  String orderItemFinalPrice;
  @JsonKey(name: 'order_item_unit', nullable: true)
  String orderItemUnit;
  @JsonKey(name: 'order_item_value', nullable: true)
  int orderItemUnitValue;
  @JsonKey(name: 'order_item_point', nullable: true)
  int orderItemPoint;
  @JsonKey(name: 'order_item_id', nullable: true)
  int orderItemId;
  @JsonKey(name: 'order_item_note', nullable: true)
  String orderItemNote;
  @JsonKey(name: 'order_item_qty_total', nullable: true)
  int orderItemQtyTotal;
  @JsonKey(name: 'order_item_price_description', nullable: true)
  String orderItemPriceTotal;
  @JsonKey(name: 'product', nullable: true)
  ProductModel product;

  factory OrderItemModel.fromJson(Map<String, dynamic> json) =>
      _$OrderItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModelToJson(this);
}
