import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProductDetailPageControlller extends GetxController {
  final AppPage _appPage = AppPage();
  final Product _productCore = Product();

  final TextEditingController qtyField = TextEditingController();

  final Rx<StateModel<ProductDetailPageModel>> productDetail =
      StateModel<ProductDetailPageModel>(
    state: States.loading,
    data: ProductDetailPageModel(),
  ).obs;

  final CartController cartController = Get.find();

  ProductModel productModel = Get.arguments;

  void loadPageData() async {
    try {
      productDetail(StateModel(state: States.loading));

      await _appPage.product(productId: productModel.productId).then((model) {
        productDetail(StateModel<ProductDetailPageModel>(
            state: States.complete, data: model));
      }).catchError((e, k) => throw Failure(DIOERROR_MESSAGE));
    } on Failure catch (_) {
      _routeToErrorPage();
    }
  }

  void _initialProductQty() {
    int index = cartController.getProductIndex(productModel);

    if (index >= 0) {
      qtyField.text = cartController.cartItems[index].cartItemQty.toString();
    } else {
      qtyField.text = '0';
    }
  }

  void addProductFavourite(String productId) async {
    productDetail(productDetail().copyWith(state: States.other1));

    await _productCore.favourite(productId: productId).then((model) {
      productDetail(StateModel<ProductDetailPageModel>(
          state: States.complete,
          data: productDetail().data.copyWith(product: model)));
    });
  }

  void routeToProductDetailPage(ProductModel product) async {
    Get.toNamed(PRODUCT_DETAIL_PAGE,
        arguments: product, preventDuplicates: false);
  }

  void plus() {
    qtyField.text = (int.parse(qtyField.text) + 1).toString();
  }

  void minus() {
    if (int.parse(qtyField.text) > 0)
      qtyField.text = (int.parse(qtyField.text) - 1).toString();
  }

  void qtyFieldListener() {
    cartController.setQty(productModel, int.parse(qtyField.text));
  }

  void routeToCartPage() async {
    await Get.toNamed(CART_PAGE);
    _initialProductQty();
  }

  void routeToProductPage(ProductFilterModel filter) async {
    Get.toNamed(PRODUCT_PAGE, arguments: filter);
  }

  void _routeToErrorPage() async {
    await Get.toNamed(ERROR_PAGE);
    loadPageData();
    _initialProductQty();
  }

  Future<void> _init() async {
    loadPageData();

    _initialProductQty();

    qtyField.addListener(qtyFieldListener);
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
