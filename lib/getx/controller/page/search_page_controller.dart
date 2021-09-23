import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  final AppPage _appPage = AppPage();
  final Search _searchCore = Search();
  final TextEditingController searchField = TextEditingController();

  final RxString keyword = ''.obs;

  final Rx<StateModel<SearchPageModel>> searchPage =
      StateModel<SearchPageModel>(
    state: States.loading,
    data: SearchPageModel(),
  ).obs;

  final Rx<StateModel<SearchResultModel>> searchResult =
      StateModel<SearchResultModel>(
    state: States.initial,
    data: SearchResultModel(),
  ).obs;

  void loadPageData() async {
    try {
      searchPage(StateModel<SearchPageModel>(state: States.loading));

      await _appPage.search().then((model) {
        searchPage(
            StateModel<SearchPageModel>(state: States.complete, data: model));
      });
    } catch (e) {
      ErrorHandler(e).redirect(loadPageData);
    }
  }

  void searchFieldListener() {
    keyword(searchField.text);
  }

  void clearSearchField() {
    if (keyword.value.length > 0) searchField.text = '';
  }

  void _search() async {
    try {
      searchResult(StateModel<SearchResultModel>(state: States.loading));

      await _searchCore.search(keyword: keyword.value).then((model) {
        searchResult(
            StateModel<SearchResultModel>(state: States.complete, data: model));
      });
    } catch (_) {
      searchResult(StateModel(state: States.error));
    }
  }

  void routeToProductPage(ProductFilterModel filter) async {
    Get.toNamed(PRODUCT_PAGE, arguments: filter);
  }

  void _init() {
    debounce(keyword, (_) {
      if (keyword.value.length > 0)
        _search();
      else
        searchResult(StateModel(state: States.initial));
    }, time: Duration(milliseconds: 200));

    searchField.addListener(searchFieldListener);

    loadPageData();

    searchField.text = Get.arguments;
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }
}
