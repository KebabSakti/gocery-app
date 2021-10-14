// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModel _$OrderItemModelFromJson(Map<String, dynamic> json) {
  return OrderItemModel(
    orderId: json['order_id'] as String,
    productId: json['product_id'] as String,
    orderItemName: json['order_item_name'] as String,
    orderItemDescription: json['order_item_description'] as String,
    orderItemCover: json['order_item_cover'] as String,
    orderItemPrice: json['order_item_price'] as String,
    orderItemDiscount: json['order_item_discount'] as String,
    orderItemFinalPrice: json['order_item_final_price'] as String,
    orderItemUnit: json['order_item_unit'] as String,
    orderItemUnitValue: json['order_item_value'] as int,
    orderItemPoint: json['order_item_point'] as int,
    orderItemId: json['order_item_id'] as int,
    orderItemNote: json['order_item_note'] as String,
    orderItemQtyTotal: json['order_item_qty_total'] as int,
    orderItemPriceTotal: json['order_item_price_description'] as String,
    product: json['product'] == null
        ? null
        : ProductModel.fromJson(json['product'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$OrderItemModelToJson(OrderItemModel instance) =>
    <String, dynamic>{
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'order_item_name': instance.orderItemName,
      'order_item_description': instance.orderItemDescription,
      'order_item_cover': instance.orderItemCover,
      'order_item_price': instance.orderItemPrice,
      'order_item_discount': instance.orderItemDiscount,
      'order_item_final_price': instance.orderItemFinalPrice,
      'order_item_unit': instance.orderItemUnit,
      'order_item_value': instance.orderItemUnitValue,
      'order_item_point': instance.orderItemPoint,
      'order_item_id': instance.orderItemId,
      'order_item_note': instance.orderItemNote,
      'order_item_qty_total': instance.orderItemQtyTotal,
      'order_item_price_description': instance.orderItemPriceTotal,
      'product': instance.product,
    };
