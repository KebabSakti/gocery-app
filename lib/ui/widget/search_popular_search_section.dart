import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPopularSearchSection extends StatelessWidget {
  final SearchPageController controller;

  SearchPopularSearchSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text(
            'Pencarian populer',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: 10),
        Obx(() {
          if (controller.searchPage().state == States.loading) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              padding: EdgeInsets.symmetric(horizontal: 15),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.all(0),
                  leading: ShimmerLoader(
                    radius: 10,
                    height: 45,
                    width: 60,
                  ),
                  title: ShimmerLoader(
                    radius: 6,
                    height: 15,
                  ),
                  subtitle: ShimmerLoader(
                    radius: 6,
                    height: 15,
                  ),
                );
              },
            );
          }

          if (controller.searchPage().data.productViews.length > 0) {
            SearchPageModel searchPage = controller.searchPage().data;

            return ListView.builder(
              shrinkWrap: true,
              itemCount: searchPage.popularSearches.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    controller.routeToProductPage(ProductFilterModel(
                        keyword:
                            searchPage.popularSearches[index].searchKeyword));
                  },
                  dense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: searchPage.popularSearches[index].searchImage,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 60,
                    ),
                  ),
                  title: Text(
                    searchPage.popularSearches[index].searchKeyword,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  subtitle: Text(
                    '${searchPage.popularSearches[index].searchCount} pencarian',
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                      color: Get.theme.primaryColor,
                      fontSize: 12,
                    ),
                  ),
                );
              },
            );
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text('Tidak ada data'),
          );
        }),
      ],
    );
  }
}
