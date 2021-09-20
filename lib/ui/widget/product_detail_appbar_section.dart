import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailAppBarSection extends StatelessWidget {
  final ProductDetailPageControlller controller;

  ProductDetailAppBarSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    ProductModel product = controller.productDetail().data.product;

    return SliverAppBar(
      expandedHeight: Get.size.height / 2.5,
      pinned: true,
      titleSpacing: 0,
      centerTitle: true,
      title: Text(
        product.productName,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Obx(() {
            return IconButtonWithDot(
              Icon(Icons.local_mall_rounded),
              value: controller.cartController.cartQtyTotal.value,
              onPressed: () {
                controller.routeToCartPage();
              },
            );
          }),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          child: CachedNetworkImage(
            imageUrl: product.productCover,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorWidget: (context, url, error) => Image.asset(
              NO_IMG,
              fit: BoxFit.cover,
            ),
            placeholder: (context, url) {
              return ShimmerLoader();
            },
          ),
        ),
      ),
    );
  }
}
