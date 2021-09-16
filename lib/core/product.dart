import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/cupertino.dart';

class Product {
  final ProductData _productData = ProductData();

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
    return await _productData.product(
      urlQuery,
      deliveryType: deliveryType,
      category: category,
      subCategory: subCategory,
      productId: productId,
      keyword: keyword,
      discount: discount,
      productPrice: productPrice,
      productTag: productTag,
      productBundleId: productBundleId,
      highPoint: highPoint,
      highView: highView,
      highSell: highSell,
      highRatingCount: highRatingCount,
      highRatingValue: highRatingValue,
      highSearch: highSearch,
    );
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
    return await _productData.productTotal(
      deliveryType: deliveryType,
      category: category,
      subCategory: subCategory,
      productId: productId,
      keyword: keyword,
      discount: discount,
      productPrice: productPrice,
      productTag: productTag,
      productBundleId: productBundleId,
      highPoint: highPoint,
      highView: highView,
      highSell: highSell,
      highRatingCount: highRatingCount,
      highRatingValue: highRatingValue,
      highSearch: highSearch,
    );
  }

  Future<ProductModel> favourite({@required String productId}) async {
    return await _productData.favourite(productId: productId);
  }
}
