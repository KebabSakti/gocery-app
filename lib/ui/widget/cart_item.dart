import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CartItem extends StatelessWidget {
  final CartPageController controller;
  final CartItemModel cartItem;

  CartItem({
    @required this.controller,
    @required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      key: ValueKey(cartItem.product.productId),
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 60,
              height: 60,
              child: CachedNetworkImage(
                imageUrl: cartItem.product.productCover,
                errorWidget: (context, url, error) => Image.asset(
                  NO_IMG,
                  fit: BoxFit.cover,
                ),
                placeholder: (context, url) => ShimmerLoader(),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cartItem.product.productName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 6),
                          RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                              ),
                              children: [
                                TextSpan(
                                  text: Utility().currency(
                                    cartItem.product.productFinalPrice,
                                  ),
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      '  ( ${cartItem.product.productUnitValue} ${cartItem.product.productUnit} )',
                                  style: TextStyle(
                                    color: Colors.grey[400],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 15),
                    SizedBox.fromSize(
                      size: Size(30, 30),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () {
                          controller.delete(cartItem.product);
                        },
                        child: Center(
                          child: Icon(
                            Icons.cancel_outlined,
                            size: 24,
                            color: Get.theme.colorScheme.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    ProductDeliveryType(
                      name:
                          'PENGIRIMAN ${cartItem.product.productDeliveryType}',
                      color:
                          (cartItem.product.productDeliveryType == 'LANGSUNG')
                              ? Get.theme.primaryColor
                              : Colors.amber,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SizedBox.fromSize(
                          size: Size(30, 30),
                          child: ClipOval(
                            child: Material(
                              color: Colors.grey[100],
                              child: InkWell(
                                onTap: () {
                                  controller.minus(cartItem.product);
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.remove_rounded,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(40, 40),
                          child: Center(
                            child: TextField(
                              controller: TextEditingController()
                                ..text = controller.initialProductQty(
                                  cartItem.product,
                                ),
                              textAlign: TextAlign.center,
                              showCursor: false,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                              ],
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: InputDecoration(
                                hintText: '0',
                                hintStyle: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              onSubmitted: (value) {
                                controller.setQty(cartItem.product, value);
                              },
                            ),
                          ),
                        ),
                        SizedBox.fromSize(
                          size: Size(30, 30),
                          child: ClipOval(
                            child: Material(
                              color: Colors.grey[100],
                              child: InkWell(
                                onTap: () {
                                  controller.plus(cartItem.product);
                                },
                                child: Center(
                                  child: Icon(
                                    Icons.add_rounded,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
