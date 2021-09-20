import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends GetWidget<SearchPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 0,
        backgroundColor: Get.theme.colorScheme.secondary,
        iconTheme: IconThemeData(color: Get.theme.primaryColor),
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Container(
            height: 38,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Get.theme.colorScheme.background,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              controller: controller.searchField,
              autofocus: true,
              style: TextStyle(fontSize: 14),
              cursorColor: Colors.grey[600],
              cursorWidth: 1,
              decoration: InputDecoration(
                hintText: 'Cari di sini',
                contentPadding: EdgeInsets.only(top: 4),
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: Get.theme.colorScheme.onSecondary,
                  size: 20,
                ),
                suffixIcon: Obx(() => (controller.keyword.value.length == 0)
                    ? SizedBox.shrink()
                    : IconButton(
                        onPressed: controller.clearSearchField,
                        constraints: BoxConstraints(),
                        iconSize: 20,
                        icon: Icon(
                          Icons.cancel_rounded,
                          color: Get.theme.colorScheme.onSecondary,
                        ),
                      )),
                prefixIconConstraints: BoxConstraints(minWidth: 40),
              ),
              onSubmitted: null,
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (controller.keyword.value.length > 0) {
          SearchResultModel searchResult = controller.searchResult().data;

          if (controller.searchResult().state == States.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (searchResult != null) {
            return CustomScrollView(
              slivers: [
                (searchResult.keywords.length > 0)
                    ? SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
                          if (searchResult.keywords.length > 0) {
                            return ListTile(
                              onTap: () {
                                controller.routeToProductPage(
                                    ProductFilterModel(
                                        keyword: searchResult
                                            .keywords[index].searchKeyword));
                              },
                              visualDensity: VisualDensity.compact,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15),
                              title: Text(
                                searchResult.keywords[index].searchKeyword,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14),
                              ),
                            );
                          }

                          return SizedBox.shrink();
                        }, childCount: searchResult.keywords.length),
                      )
                    : SliverToBoxAdapter(),
                (searchResult.products.length > 0)
                    ? SliverPadding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        sliver: SliverToBoxAdapter(
                          child: Text(
                            'Produk Terkait',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : SliverToBoxAdapter(),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (searchResult.products.length > 0) {
                      return ListTile(
                        onTap: () {},
                        visualDensity: VisualDensity.compact,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 6,
                        ),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                            imageUrl: searchResult.products[index].productCover,
                            fit: BoxFit.cover,
                            height: 40,
                            width: 40,
                            placeholder: (_, __) => ShimmerLoader(
                              radius: 4,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                        title: Text(
                          searchResult.products[index].productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 14),
                        ),
                      );
                    }

                    return SizedBox.shrink();
                  }, childCount: searchResult.products.length),
                ),
              ],
            );
          }

          return SizedBox.shrink();
        }

        return RefreshIndicator(
          onRefresh: () async {
            controller.loadPageData();
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              SearchProductViewSection(controller: controller),
              SizedBox(height: 20),
              SearchHistoriesSection(controller: controller),
              SizedBox(height: 15),
              SearchPopularSearchSection(controller: controller),
            ],
          ),
        );
      }),
    );
  }
}
