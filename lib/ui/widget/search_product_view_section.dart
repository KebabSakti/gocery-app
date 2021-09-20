import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/widget/shimmer_loader.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SearchProductViewSection extends StatelessWidget {
  final SearchPageController controller;

  SearchProductViewSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terakhir dilihat',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 18),
          SizedBox(
            height: 60,
            child: Obx(() {
              if (controller.searchPage().state == States.loading) {
                return ListView.builder(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: (index >= 0 && index != (10 - 1)) ? 10 : 0,
                      ),
                      child: ShimmerLoader(
                        radius: 10,
                        width: (Get.size.width - 30) / 5,
                        height: 60,
                      ),
                    );
                  },
                );
              }

              if (controller.searchPage().data.productViews.length > 0) {
                SearchPageModel searchPage = controller.searchPage().data;

                return Material(
                  child: ListView.builder(
                    itemCount: searchPage.productViews.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          right: (index >= 0 &&
                                  index != (searchPage.productViews.length - 1))
                              ? 10
                              : 0,
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            width: (Get.size.width - 30) / 5,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: CachedNetworkImageProvider(searchPage
                                    .productViews[index].productCover),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () {},
                        ),
                      );
                    },
                  ),
                );
              }

              return Text('Tidak ada data');
            }),
          ),
        ],
      ),
    );
  }
}
