import 'package:ayov2/getx/controller/controller.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBundleSection extends StatelessWidget {
  final HomePageController controller;

  HomeBundleSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Obx(() {
        if (controller.home().state == States.loading) {
          return ShimmerLoader(height: 300);
        }

        if (controller.home().data.bundles.length > 0) {
          return MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.home().data.bundles.length,
              separatorBuilder: (context, index) => Divider(
                height: 8,
                color: Colors.grey[100],
                thickness: 8,
              ),
              itemBuilder: (context, index) {
                return BundleItem(
                  controller: controller,
                  indexBundle: index,
                );
              },
            ),
          );
        }

        return SizedBox.shrink();
      }),
    );
  }
}
