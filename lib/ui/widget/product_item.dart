import 'package:ayov2/const/const.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final Function onTap;

  ProductItem({@required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[50],
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Ink(
          width: (Get.size.width - 70) / 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.productCover,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 260 / 2,
                      errorWidget: (context, url, error) => Image.asset(
                        NO_IMG,
                        fit: BoxFit.cover,
                      ),
                      placeholder: (context, url) =>
                          ShimmerLoader(height: 260 / 2),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, top: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            color: Colors.black38,
                            padding: EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 4,
                            ),
                            child: Text(
                              '${product.productUnitValue} ${product.productUnit}',
                              style: TextStyle(
                                color: Get.theme.colorScheme.secondary,
                                fontWeight: FontWeight.w600,
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          product.productName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              product.productPoint.toString().length > 3
                                  ? product.productPoint.toString() + '+'
                                  : product.productPoint.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Get.theme.colorScheme.primaryVariant,
                              ),
                            ),
                            SizedBox(width: 2),
                            SvgPicture.asset(
                              COIN_ICON,
                              width: 10,
                              height: 10,
                            ),
                          ],
                        ),
                        (double.parse(product.productDiscount) == 0)
                            ? SizedBox.shrink()
                            : Text(
                                Utility().currency(product.productPrice),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Get.theme.colorScheme.onSecondary,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                        Text(
                          Utility().currency(product.productFinalPrice),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Get.theme.primaryColor,
                          ),
                        ),
                        Spacer(),
                        Rating(double.parse(product.productRatingValue)),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
