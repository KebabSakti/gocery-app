import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:ayov2/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductPage extends GetWidget<ProductPageController> {
  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 10.0;
    var _mainAxisSpacing = 10.0;
    var _screenWidth = Get.size.width;
    var _crossAxisCount = 2;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var _cellHeight = 620 / 2;
    var _aspectRatio = _width / _cellHeight;

    return DefaultTabController(
      length: controller.globalObs.categoryModel.length + 1,
      initialIndex: controller.getDefaultTab() + 1,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Obx(() {
                return ShoppingCartIcon(
                  value: controller.cartController.cartQtyTotal.value,
                  onPressed: () {
                    controller.routeToCartPage();
                  },
                );
              }),
            ),
          ],
          title: StaticSearchField(
            onTap: controller.routeToSearchPage,
            text:
                controller.filterModel.value.keyword ?? 'mau belanja apa kak ?',
          ),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
                  Row(
                    children: [
                      SvgPicture.asset(ALL_CATEGORY, width: 15, height: 15),
                      SizedBox(width: 5),
                      Tab(
                        child: Text('Semua Produk'),
                      ),
                    ],
                  ),
                ] +
                controller.globalObs.categoryModel
                    .map((item) => Row(
                          children: [
                            SvgPicture.network(
                              item.categoryImage,
                              width: 15,
                              height: 15,
                              placeholderBuilder: (context) => SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(),
                              ),
                            ),
                            SizedBox(width: 5),
                            Tab(child: Text(item.categoryName)),
                          ],
                        ))
                    .toList(),
            onTap: (index) {
              controller.selectCategory(index);
            },
          ),
        ),
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                controller.loadFilteredProduct();
              },
              child: CustomScrollView(
                controller: controller.scrollController,
                slivers: [
                  SliverStickyHeader(
                    header: Material(
                      color: Get.theme.backgroundColor,
                      child: SizedBox(
                        height: 50,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: ProductFilter(
                            productFilterModel: controller.filterModel,
                            onFilterTap: controller.routeToFilterPage,
                          ),
                        ),
                      ),
                    ),
                    sliver: SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 10),
                        child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          removeBottom: true,
                          child: Obx(() {
                            if (controller.pageState().state ==
                                States.loading) {
                              return GridView.builder(
                                shrinkWrap: true,
                                itemCount: 6,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: _crossAxisCount,
                                  crossAxisSpacing: _crossAxisSpacing,
                                  mainAxisSpacing: _mainAxisSpacing,
                                  childAspectRatio: _aspectRatio,
                                ),
                                itemBuilder: (context, index) {
                                  return ShimmerLoader(radius: 15);
                                },
                              );
                            }

                            if (controller.pageState().state == States.empty) {
                              return Container(
                                height: Get.size.height - 200,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: PageState(
                                  iconData: Icons.inventory,
                                  title: 'Produk Tidak Ditemukan',
                                  text:
                                      'Gunakan filter produk untuk pencarian lebih detail',
                                ),
                              );
                            }

                            if (controller.pageState().state == States.error) {
                              return Container(
                                height: Get.size.height - 200,
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: PageState(
                                  iconData: Icons.sync_problem_rounded,
                                  title: 'Terjadi Kesalahan',
                                  text:
                                      'Jangan panik, sentuh tombol di bawah untuk mencoba kembali',
                                  buttonText: 'Coba Lagi',
                                  onTap: controller.loadFilteredProduct,
                                ),
                              );
                            }

                            if (controller.pageState().data.products.length >
                                0) {
                              return Column(
                                children: [
                                  GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller
                                        .pageState()
                                        .data
                                        .products
                                        .length,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: _crossAxisCount,
                                      crossAxisSpacing: _crossAxisSpacing,
                                      mainAxisSpacing: _mainAxisSpacing,
                                      childAspectRatio: _aspectRatio,
                                    ),
                                    itemBuilder: (context, index) {
                                      return ProductItem(
                                        onTap: () {
                                          controller.routeToProductDetailPage(
                                              controller
                                                  .pageState()
                                                  .data
                                                  .products[index]);
                                        },
                                        product: controller
                                            .pageState()
                                            .data
                                            .products[index],
                                      );
                                    },
                                  ),
                                  (controller.pageState().state ==
                                          States.paging)
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15),
                                          child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 3,
                                              backgroundColor: Colors.grey[100],
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Theme.of(context)
                                                          .primaryColor),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              );
                            }

                            return SizedBox.shrink();
                          }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 5,
                  bottom: 5,
                ),
                child: ScrollTopButton(
                  tag: Utility().randomString(10),
                  scrollController: controller.scrollController,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
