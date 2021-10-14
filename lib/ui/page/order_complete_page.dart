import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderCompletePage extends GetView<OrderCompletePageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 200,
        leading: SvgPicture.asset(LOGO),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Get.theme.primaryColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.check_rounded,
              color: Get.theme.primaryColor,
              size: 60,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Order Berhasil',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 6),
          SizedBox(
            width: Get.size.width / 1.2,
            child: Text(
              'Terima Kasih telah melakukan order, kurir kami akan segera menghubungin anda',
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: FlatButton.icon(
              color: Get.theme.primaryColor,
              icon: Icon(
                Icons.list_alt_rounded,
                color: Colors.white,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              label: Text(
                'Status Orderan',
                style: TextStyle(
                  color: Get.theme.colorScheme.secondary,
                ),
              ),
              onPressed: controller.routeToHomePage,
            ),
          ),
        ],
      ),
    );
  }
}
