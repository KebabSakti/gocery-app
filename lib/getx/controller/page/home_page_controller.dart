import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final Helper _helper = Get.find();
  final GlobalObs _globalObs = Get.find();
  final CartController cartController = Get.find();
  final AppPageController appPageController = Get.find();

  final Rx<ProductFilterModel> filterModel = ProductFilterModel().obs;
  final Rx<StateModel<HomePageModel>> home = StateModel<HomePageModel>(
    state: States.loading,
    data: HomePageModel(),
  ).obs;
  final Rx<StateModel<ProductPaginateModel>> product =
      StateModel<ProductPaginateModel>(
    state: States.loading,
    data: ProductPaginateModel(),
  ).obs;

  final AppPage _appPage = AppPage();
  final Product _product = Product();
  final ScrollController homePageScrollController = ScrollController();

  void signOutButton() async {
    try {
      _helper.dialog.loading();

      await _authLocal.signout();
      await _authFirebase.signOut();

      _routeToOnboardingPage();
    } catch (e) {
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
  }

  void qrScanner() async {
    if (!await Permission.camera.isGranted) {
      _helper.dialog.show(
        'Aplikasi memerlukan izin kamera untuk melanjutkan',
        buttonText: 'Lanjutkan',
        headingText: "PERHATIAN",
        color: Colors.amber[600],
        headingIcon: Icons.warning_amber_rounded,
        dismissible: true,
        onPressed: () async {
          _helper.dialog.close();
          await Permission.camera.request().then((status) {
            _routeToQrPage();
          });
        },
      );
    } else {
      _routeToQrPage();
    }
  }

  Future<ProductPaginateModel> _loadProduct(String urlQuery) async {
    return await _product.product(
      urlQuery,
      category: filterModel.value.category,
      deliveryType: filterModel.value.deliveryType,
      discount: filterModel.value.discount,
      highPoint: filterModel.value.highPoint,
      highRatingCount: filterModel.value.highRatingCount,
      highRatingValue: filterModel.value.highRatingValue,
      highSearch: filterModel.value.highSearch,
      highSell: filterModel.value.highSell,
      highView: filterModel.value.highView,
      keyword: filterModel.value.keyword,
      productId: filterModel.value.productId,
      productPrice: filterModel.value.productPrice,
      subCategory: filterModel.value.subCategory,
    );
  }

  void _loadFilteredProduct() async {
    try {
      product(StateModel(state: States.loading));

      await _loadProduct("?page=1").then((model) {
        product(
          StateModel(
            data: model,
            state:
                (model.products.length == 0) ? States.empty : States.complete,
          ),
        );
      });
    } catch (_) {
      product(StateModel(state: States.error));
    }
  }

  void _loadMoreProduct(double offset, double maxScroll) async {
    try {
      bool fetch = ((offset == maxScroll) &&
          product().state == States.complete &&
          product().data.products.length > 0 &&
          product().data.pagination.nextPageUrl != null);

      if (fetch) {
        product(product().copyWith(state: States.paging));

        await _loadProduct("?page=${product().data.pagination.currentPage + 1}")
            .then((model) {
          ProductPaginateModel productPaginateModel = ProductPaginateModel(
            pagination: model.pagination,
            products: product().data.products + model.products,
          );

          product(
            StateModel(
              data: productPaginateModel,
              state: States.complete,
            ),
          );
        });
      }
    } catch (_) {
      product(StateModel(state: States.error));
    }
  }

  void _scrollListener() {
    double offset = homePageScrollController.offset;
    double maxScroll = homePageScrollController.position.maxScrollExtent;

    //product pagination
    _loadMoreProduct(offset, maxScroll);
  }

  Future homeData() async {
    try {
      home(StateModel(state: States.loading));

      await _appPage.home().then((model) {
        _globalObs.categoryModel(model.categoryModel);

        product(StateModel<ProductPaginateModel>(
          state: States.complete,
          data: model.productPaginateModel,
        ));

        home(StateModel<HomePageModel>(
          state: States.complete,
          data: model,
        ));
      });
    } catch (e) {
      ErrorHandler(e).redirect(homeData);
    }
  }

  void refresh() async {
    homeData();

    filterModel(ProductFilterModel());
  }

  void allCategory() {
    appPageController.openPanel(PanelBody.category);
  }

  void bundleClick(String link) {
    routeToProductPage(ProductFilterModel(productBundleId: link));
  }

  void categoryOnClick(String category) {
    routeToProductPage(ProductFilterModel(category: category));
  }

  void _routeToQrPage() async {
    var result = await Get.toNamed(QR_PAGE);

    if (result != null) print(result);
  }

  void routeToCategoryPage() {
    Get.toNamed(
      CATEGORY_PAGE,
      arguments: CategoryPageModel(
        categories: home().data.categoryModel,
        subCategories: home().data.subCategoryModel,
      ),
    );
  }

  void routeToCategoryDetailPage(CategoryModel category) {
    Get.toNamed(
      CATEGORY_DETAIL_PAGE,
      arguments: CategoryDetailPageModel(
        bannerSecondaries: home().data.bannerSecondaryModel,
        category: category,
        subCategories: home().data.subCategoryModel,
      ),
    );
  }

  void routeToSearchPage() {
    Get.toNamed(SEARCH_PAGE, arguments: '');
  }

  void routeToFilterPage() async {
    var result =
        await Get.toNamed(PRODUCT_FILTER_PAGE, arguments: filterModel.value);

    if (result != null) filterModel(result);
  }

  void routeToProductPage(ProductFilterModel filter) async {
    Get.toNamed(PRODUCT_PAGE, arguments: filter);
  }

  void routeToProductDetailPage(ProductModel product) async {
    Get.toNamed(PRODUCT_DETAIL_PAGE, arguments: product);
  }

  void routeToCartPage() {
    Get.toNamed(CART_PAGE);
  }

  void _routeToOnboardingPage() {
    Get.offAllNamed(ONBOARDING_PAGE);
  }

  void init() async {
    homePageScrollController.addListener(_scrollListener);

    debounce(filterModel, (_) {
      _loadFilteredProduct();
    }, time: Duration(milliseconds: 500));

    homeData();
  }

  @override
  void onInit() {
    init();

    super.onInit();
  }

  @override
  void onClose() {
    homePageScrollController.dispose();
    super.onClose();
  }
}
