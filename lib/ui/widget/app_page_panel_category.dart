import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppPagePanelCategory extends StatelessWidget {
  final List<CategoryModel> categories;
  final AppPageController controller;

  AppPagePanelCategory({
    @required this.categories,
    @required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Ink(
            color: Colors.white,
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Ink(
                      width: 50,
                      height: 50,
                      child: SvgPicture.asset(
                        ALL_CATEGORY,
                        width: 50,
                        height: 50,
                        placeholderBuilder: (context) => ShimmerLoader(
                          width: 50,
                          height: 50,
                          radius: 50,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Semua Produk',
                            style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Solusi segala keperluan dapur kamu',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                controller.routeToProductPage(ProductFilterModel());
              },
            ),
          ),
          Divider(height: 1),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: categories.length,
              separatorBuilder: (context, index) => Divider(height: 1),
              itemBuilder: (context, index) {
                return CategoryItemAlt(
                  category: categories[index],
                  onTap: () {
                    controller.routeToProductPage(
                      ProductFilterModel(
                        category: categories[index].categoryId,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
