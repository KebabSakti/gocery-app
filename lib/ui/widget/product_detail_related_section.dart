import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';

class ProductDetailRelatedSection extends StatelessWidget {
  final ProductDetailPageControlller controller;

  ProductDetailRelatedSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    ProductDetailPageModel pageModel = controller.productDetail().data;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SectionHeading(
              heading: 'Produk Terkait',
              onPressed: () {},
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 280,
              child: ListView.builder(
                itemCount: pageModel.relatedProducts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      right: (index >= 0 &&
                              index != (pageModel.relatedProducts.length - 1))
                          ? 10
                          : 0,
                    ),
                    child: ProductItem(
                      onTap: () {
                        controller.routeToProductDetailPage(
                            pageModel.relatedProducts[index]);
                      },
                      product: pageModel.relatedProducts[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
