import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductDetailInfoSection extends StatelessWidget {
  final ProductDetailPageControlller controller;

  ProductDetailInfoSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    ProductModel product = controller.productDetail().data.product;

    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: Utility().currency(
                                    product.productFinalPrice,
                                  ),
                                  style: TextStyle(
                                    color: Get.theme.primaryColor,
                                    fontSize: 18,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '  ( ${product.productUnitValue} ${product.productUnit} )',
                                  style: TextStyle(
                                    color: Get.theme.colorScheme.onSecondary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: Get.theme.colorScheme.primaryVariant,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '9% off',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6),
                              Text(
                                Utility().currency(product.productPrice),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Get.theme.colorScheme.onSecondary,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          controller.addProductFavourite(product.productId);
                        },
                        icon: Icon(
                          Icons.favorite_rounded,
                          color: (product.productFavourite == 0)
                              ? Get.theme.colorScheme.onSecondary
                              : Get.theme.colorScheme.primary,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    product.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        product.productPoint.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Get.theme.colorScheme.primaryVariant,
                        ),
                      ),
                      SizedBox(width: 2),
                      SvgPicture.asset(
                        COIN_ICON,
                        width: 20,
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          right: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Get.theme.colorScheme.secondaryVariant,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color:
                                  (double.parse(product.productRatingValue) > 0)
                                      ? Colors.amber
                                      : Get.theme.colorScheme.onSecondary,
                              size: 20,
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '${product.productRatingValue}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '(${product.productRatingCount})',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                              color: Colors.grey[200],
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Dilihat',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '(${product.productView})',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Terjual',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              '(${product.productSold})',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  ProductDeliveryType(
                    name: 'PENGIRIMAN ${product.productDeliveryType}',
                    color: (product.productDeliveryType == 'LANGSUNG')
                        ? Get.theme.primaryColor
                        : Get.theme.colorScheme.primaryVariant,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
