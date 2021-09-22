import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends GetView<CartPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Keranjang Belanja',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              List<CartItemModel> products =
                  controller.cartController.cartItems;

              if (products.length == 0) {
                return PageState(
                  iconData: Icons.shopping_cart_rounded,
                  title: 'Keranjang Kosong',
                  text: 'Ayo belanja dulu, banyak barang murah meriah loh.',
                );
              }

              return ListView.separated(
                itemCount: products.length,
                separatorBuilder: (context, index) =>
                    Divider(color: Colors.grey[200]),
                itemBuilder: (context, index) {
                  return CartItem(
                    controller: controller,
                    cartItem: products[index],
                  );
                },
              );
            }),
          ),
          Container(
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
                          fontWeight: FontWeight.w600, color: Colors.grey[800]),
                    ),
                    Obx(() {
                      return Text(
                        '${controller.cartController.cartQtyTotal} Item',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.grey[800]),
                      );
                    }),
                  ],
                ),
                Obx(() {
                  return Text(
                    Utility().currency(
                        controller.cartController.cartPriceTotal.toString()),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: Get.theme.primaryColor,
                    ),
                  );
                }),
                Obx(() {
                  return FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    color: Get.theme.primaryColor,
                    disabledColor: Get.theme.colorScheme.onSecondary,
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
                    onPressed: (controller.cartController.cartItems.length == 0)
                        ? null
                        : controller.routeToOrderSummaryPage,
                  );
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
