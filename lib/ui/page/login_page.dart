import 'package:ayov2/const/asset_const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.primaryColor,
      appBar: AppBar(elevation: 0),
      body: Column(
        children: [
          Expanded(
            child: Center(child: SvgPicture.asset(LOGO)),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          GOOGLE,
                          width: 20,
                        ),
                        Text('Masuk Dengan Google'),
                        SizedBox.shrink(),
                      ],
                    ),
                    onPressed: controller.googleSignIn,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(
                          FACEBOOK,
                          width: 20,
                        ),
                        Text('Masuk Dengan Facebook'),
                        SizedBox.shrink(),
                      ],
                    ),
                    onPressed: controller.facebookSignIn,
                  ),
                ),
                Divider(height: 45),
                SizedBox(
                  height: 45,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.phone_rounded,
                          size: 20,
                        ),
                        Text('Masuk Dengan Nomor Hp'),
                        SizedBox.shrink(),
                      ],
                    ),
                    onPressed: controller.routeToPhoneLoginPage,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
