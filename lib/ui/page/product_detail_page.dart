import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/ui/widget/product_detail_rating_section.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailPage extends GetWidget<ProductDetailPageControlller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.productDetail().state == States.loading) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerLoader(height: Get.size.height / 2.5),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ShimmerLoader(
                    height: 15,
                    width: 150,
                    radius: 6,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ShimmerLoader(
                    height: 15,
                    width: 200,
                    radius: 6,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ShimmerLoader(
                    height: 15,
                    width: 200,
                    radius: 6,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ShimmerLoader(
                    height: 15,
                    width: 150,
                    radius: 6,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 8,
                  color: Colors.grey[100],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ShimmerLoader(
                    height: 15,
                    width: 150,
                    radius: 6,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ShimmerLoader(
                    height: 15,
                    width: 200,
                    radius: 6,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ShimmerLoader(
                    height: 15,
                    width: 200,
                    radius: 6,
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ShimmerLoader(
                    height: 15,
                    width: 150,
                    radius: 6,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 8,
                  color: Colors.grey[100],
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 280,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ListView.builder(
                      itemCount: 3,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            right: (index >= 0 && index != 2) ? 10 : 0,
                          ),
                          child: ShimmerLoader(
                            radius: 15,
                            width: (Get.size.width - 70) / 2,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          );
        }

        if (controller.productDetail().data != null) {
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    ProductDetailAppBarSection(controller: controller),
                    ProductDetailInfoSection(controller: controller),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 8,
                        color: Colors.grey[100],
                      ),
                    ),
                    ProductDetailDescSection(controller: controller),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 8,
                        color: Colors.grey[100],
                      ),
                    ),
                    ProductDetailRatingSection(controller: controller),
                    SliverToBoxAdapter(
                      child: Container(
                        height: 8,
                        color: Colors.grey[100],
                      ),
                    ),
                    ProductDetailRelatedSection(controller: controller),
                  ],
                ),
              ),
              ProductDetailQtySection(
                controller: controller,
                onTap: () {},
              ),
            ],
          );
        }

        return SizedBox.shrink();
      }),
    );
  }
}
