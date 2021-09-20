import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

ProductPaginateModel _parsedPaginate(dynamic data) {
  var parsedData = jsonDecode(data);

  if (!parsedData['success']) throw Exception(parsedData['message']);

  List<ProductModel> products = List<ProductModel>.from(
    parsedData['data']['data'].map(
      (item) => ProductModel.fromJson(item),
    ),
  );

  PaginationModel paginateProduct =
      PaginationModel.fromJson(parsedData['data']);

  //PRODUCT WITH PAGINATION DATA
  return ProductPaginateModel(
    products: products,
    pagination: paginateProduct,
  );
}

List<ProductModel> _parsedProducts(dynamic data) {
  var parsedData = jsonDecode(data);

  if (!parsedData['success']) throw Exception(parsedData['message']);

  List<ProductModel> products = List<ProductModel>.from(
    parsedData['data'].map(
      (item) => ProductModel.fromJson(item),
    ),
  );

  return products;
}

ProductModel _parsedProduct(dynamic data) {
  var parsedData = jsonDecode(data);

  if (!parsedData['success']) throw Exception(parsedData['message']);

  ProductModel product = ProductModel.fromJson(parsedData['data']);

  return product;
}

class ProductData {
  final ProductRepo _productRepo = ProductRepo();

  Future<ProductPaginateModel> product(
    String urlQuery, {
    String deliveryType,
    String category,
    String subCategory,
    String productId,
    String keyword,
    String productPrice,
    String productTag,
    String productBundleId,
    bool highRatingValue,
    bool discount,
    bool highPoint,
    bool highView,
    bool highSell,
    bool highRatingCount,
    bool highSearch,
  }) async {
    var response = await _productRepo.product(
      urlQuery,
      deliveryType: deliveryType,
      category: category,
      subCategory: subCategory,
      productId: productId,
      keyword: keyword,
      productPrice: productPrice,
      productTag: productTag,
      productBundleId: productBundleId,
      discount: discount,
      highPoint: highPoint,
      highView: highView,
      highSell: highSell,
      highRatingCount: highRatingCount,
      highRatingValue: highRatingValue,
      highSearch: highSearch,
    );

    return compute(_parsedPaginate, response.data);
  }

  Future<List<ProductModel>> productTotal({
    String deliveryType,
    String category,
    String subCategory,
    String productId,
    String keyword,
    String productPrice,
    String productTag,
    String productBundleId,
    bool highRatingValue,
    bool discount,
    bool highPoint,
    bool highView,
    bool highSell,
    bool highRatingCount,
    bool highSearch,
  }) async {
    var response = await _productRepo.productTotal(
      deliveryType: deliveryType,
      category: category,
      subCategory: subCategory,
      productId: productId,
      keyword: keyword,
      productPrice: productPrice,
      productTag: productTag,
      productBundleId: productBundleId,
      discount: discount,
      highPoint: highPoint,
      highView: highView,
      highSell: highSell,
      highRatingCount: highRatingCount,
      highRatingValue: highRatingValue,
      highSearch: highSearch,
    );

    return compute(_parsedProducts, response.data);
  }

  Future<ProductModel> favourite({@required String productId}) async {
    var response = await _productRepo.favourite(productId: productId);

    return compute(_parsedProduct, response.data);
  }
}
