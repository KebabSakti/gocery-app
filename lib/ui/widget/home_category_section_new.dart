import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeCategorySectionNew extends StatelessWidget {
  final HomePageController controller;

  HomeCategorySectionNew({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        child: Ink(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Obx(() {
            StateModel<HomePageModel> home = controller.home();

            if (home.state == States.loading) {
              return Wrap(
                runSpacing: 20,
                spacing: 20,
                children: List<Widget>.generate(
                  8,
                  (index) => Column(
                    children: [
                      ShimmerLoader(
                        width: (Get.size.width - 80) / 4,
                        height: (Get.size.width - 80) / 4,
                        radius: 25,
                      ),
                      SizedBox(height: 6),
                      ShimmerLoader(
                        width: 50,
                        height: 10,
                        radius: 10,
                      ),
                    ],
                  ),
                ),
              );
            }

            if (home.data.categoryModel.length > 0) {
              List<CategoryModel> categories = home.data.categoryModel;

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: categories
                    .asMap()
                    .map((index, item) {
                      return MapEntry(
                        index,
                        Builder(
                          builder: (context) {
                            if (index < 8) {
                              return CategoryItem(
                                name:
                                    (index == 7) ? 'Semua' : item.categoryName,
                                icon: (index == 7)
                                    ? Icon(
                                        Icons.more_horiz_rounded,
                                        color: Get.theme.primaryColor,
                                        size: 40,
                                      )
                                    : SvgPicture.network(
                                        item.categoryImage,
                                        placeholderBuilder: (context) =>
                                            ShimmerLoader(
                                          width: 40,
                                          height: 40,
                                          radius: 40,
                                        ),
                                      ),
                                onTap: () {
                                  if (index == 7) {
                                    controller.allCategory();
                                  } else {
                                    controller.categoryOnClick(item.categoryId);
                                  }
                                },
                              );
                            }

                            return SizedBox.shrink();
                          },
                        ),
                      );
                    })
                    .values
                    .toList(),
              );
            }

            return SizedBox.shrink();
          }),
        ),
      ),
    );
  }
}
