import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartPage extends GetView<CartPageController> {
  @override
  Widget build(BuildContext context) {
    List<CartItemModel> products = controller.cartController.cartItems;
    return Obx(() {
      return Scaffold(
        body: (products.length == 0) //if cart is empty
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      EMPTY_CART,
                      width: Get.size.width / 1.5,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Yah keranjang kamu masih kosong, ayo belanja dulu.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    centerTitle: true,
                    pinned: true,
                    title: Text(
                      'Keranjang Belanja',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Ink(
                        key: ValueKey(products[index].product.productId),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: (index != products.length - 1)
                                ? BorderSide(color: Colors.grey[200])
                                : BorderSide.none,
                          ),
                        ),
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
                                  imageUrl:
                                      products[index].product.productCover,
                                  errorWidget: (context, url, error) =>
                                      Image.asset(
                                    NO_IMG,
                                    fit: BoxFit.cover,
                                  ),
                                  placeholder: (context, url) =>
                                      ShimmerLoader(),
                                ),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              products[index]
                                                  .product
                                                  .productName,
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
                                                      products[index]
                                                          .product
                                                          .productFinalPrice,
                                                    ),
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        '  ( ${products[index].product.productUnitValue} ${products[index].product.productUnit} )',
                                                    style: TextStyle(
                                                      color: Colors.grey[400],
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 10,
                                                      fontStyle:
                                                          FontStyle.italic,
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
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          onTap: () {
                                            controller.delete(
                                                products[index].product);
                                          },
                                          child: Center(
                                            child: Icon(
                                              Icons.cancel_outlined,
                                              size: 24,
                                              color:
                                                  Get.theme.colorScheme.primary,
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
                                            'PENGIRIMAN ${products[index].product.productDeliveryType}',
                                        color: (products[index]
                                                    .product
                                                    .productDeliveryType ==
                                                'LANGSUNG')
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
                                                    controller.minus(
                                                        products[index]
                                                            .product);
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
                                                controller:
                                                    TextEditingController()
                                                      ..text = controller
                                                          .initialProductQty(
                                                        products[index].product,
                                                      ),
                                                textAlign: TextAlign.center,
                                                showCursor: false,
                                                keyboardType:
                                                    TextInputType.number,
                                                inputFormatters: [
                                                  LengthLimitingTextInputFormatter(
                                                    3,
                                                  ),
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
                                                  controller.setQty(
                                                      products[index].product,
                                                      value);
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
                                                    controller.plus(
                                                        products[index]
                                                            .product);
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
                    }, childCount: controller.cartController.cartItems.length),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(height: 70),
                  ),
                ],
              ),
        bottomSheet: (products.length == 0)
            ? SizedBox.shrink()
            : Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Colors.grey[200],
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[800]),
                        ),
                        Text(
                          '${controller.cartController.cartQtyTotal} Item',
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              color: Colors.grey[800]),
                        ),
                      ],
                    ),
                    Text(
                      Utility().currency(
                          controller.cartController.cartPriceTotal.toString()),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        controller.routeToOrderSummaryPage();
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      color: Get.theme.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Lanjut',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
      );
    });
  }
}
