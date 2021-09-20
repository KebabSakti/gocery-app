import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailRatingSection extends StatelessWidget {
  final ProductDetailPageControlller controller;

  ProductDetailRatingSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    ProductDetailPageModel pageModel = controller.productDetail().data;
    ProductModel product = pageModel.product;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionHeading(
              onPressed: () {},
              heading: 'Ulasan Pembeli',
            ),
            SizedBox(height: 15),
            Builder(
              builder: (context) {
                if (pageModel.reviews.length > 0) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color:
                                (double.parse(product.productRatingValue) > 0)
                                    ? Get.theme.colorScheme.primaryVariant
                                    : Get.theme.colorScheme.onSecondary,
                            size: 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            (double.parse(product.productRatingValue) > 0)
                                ? product.productRatingValue
                                : '0',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'dari ${product.productRatingCount} ulasan',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Rating(double.parse(product.productRatingValue)),
                          SizedBox(width: 4),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.grey[800],
                              ),
                              children: [
                                TextSpan(
                                  text: 'oleh ',
                                  style: TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Kebab',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      ExpandablePanel(
                        collapsed: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              pageModel.reviews[0].ratingProductComment,
                              softWrap: true,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                            ),
                            (pageModel.reviews[0].ratingProductComment.length >
                                    100)
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
                          pageModel.reviews[0].ratingProductComment,
                          softWrap: true,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  );
                }

                return Text('Belum ada ulasan');
              },
            ),
          ],
        ),
      ),
    );
  }
}
