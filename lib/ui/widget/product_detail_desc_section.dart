import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailDescSection extends StatelessWidget {
  final ProductDetailPageControlller controller;

  ProductDetailDescSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    ProductModel product = controller.productDetail().data.product;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SectionHeading(heading: 'Deskripsi Produk'),
            SizedBox(height: 15),
            ExpandablePanel(
              collapsed: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.productDescription,
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                  (product.productDescription.length > 100)
                      ? Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: ExpandableButton(
                            child: Text(
                              "Lihat Detail",
                              style: TextStyle(
                                color: Get.theme.primaryColor,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
              expanded: Text(
                product.productDescription,
                softWrap: true,
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
