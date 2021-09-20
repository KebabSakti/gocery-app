import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<CartItemModel> _parsedCartItem(dynamic data) {
  var parsedData = jsonDecode(data);

  if (!parsedData['success']) throw Exception(parsedData['message']);

  List<CartItemModel> cartItems = List<CartItemModel>.from(
    parsedData['data'].map(
      (item) => CartItemModel.fromJson(item),
    ),
  );

  return cartItems;
}

class CartData {
  final CartRepo _cartRepo = CartRepo();

  Future<List<CartItemModel>> cart() async {
    var response = await _cartRepo.cart();

    return compute(_parsedCartItem, response.data);
  }

  Future<List<CartItemModel>> cartUpdate({
    @required List<CartItemModel> cartItems,
  }) async {
    var response = await _cartRepo.cartUpdate(cartItems: cartItems);

    return compute(_parsedCartItem, response.data);
  }
}
