import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchHistoriesSection extends StatelessWidget {
  final SearchPageController controller;

  SearchHistoriesSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Terakhir dicari',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Obx(() {
            if (controller.searchPage().state == States.loading) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: ShimmerLoader(
                      height: 20,
                      radius: 6,
                    ),
                  );
                },
              );
            }

            if (controller.searchPage().data.searchHistories.length > 0) {
              SearchPageModel searchPage = controller.searchPage().data;

              return ListView.builder(
                shrinkWrap: true,
                itemCount: searchPage.searchHistories.length,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      controller.routeToProductPage(ProductFilterModel(
                          keyword:
                              searchPage.searchHistories[index].searchKeyword));
                    },
                    visualDensity: VisualDensity.compact,
                    contentPadding: EdgeInsets.symmetric(horizontal: 0),
                    leading: Icon(
                      Icons.history_rounded,
                      color: Get.theme.colorScheme.onSecondary,
                    ),
                    title: Text(
                      searchPage.searchHistories[index].searchKeyword,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  );
                },
              );
            }

            return Text('Tidak ada data');
          }),
        ],
      ),
    );
  }
}
