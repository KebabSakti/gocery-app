import 'package:ayov2/getx/controller/controller.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BundleItem extends StatelessWidget {
  final HomePageController controller;
  final int indexBundle;

  BundleItem({
    @required this.controller,
    @required this.indexBundle,
  });

  @override
  Widget build(BuildContext context) {
    BundleModel bundle = controller.home().data.bundles[indexBundle];

    List<ProductModel> products = bundle.products;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: SectionHeading(
            heading: bundle.bundleName,
            onPressed: () {},
          ),
        ),
        Ink(
          height: 300,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(
                bundle.bundleBackground,
              ),
            ),
          ),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              GestureDetector(
                child: Container(
                  width: (Get.size.width - 70) / 2,
                  padding: EdgeInsets.only(right: 10),
                  child: CachedNetworkImage(
                    fit: BoxFit.contain,
                    imageUrl: bundle.bundleImage,
                  ),
                ),
                onTap: () {},
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  ProductModel product = products[index];

                  return Padding(
                    padding: EdgeInsets.only(
                      right: (index >= 0 && index != products.length) ? 10 : 0,
                    ),
                    child: ProductItem(
                      product: product,
                      onTap: () {},
                    ),
                  );
                },
              ),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                child: Ink(
                  width: (Get.size.width - 70) / 2,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.background,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 60,
                        color: Get.theme.primaryColor,
                      ),
                      SizedBox(height: 5),
                      Text('Lihat Semua'),
                    ],
                  ),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
