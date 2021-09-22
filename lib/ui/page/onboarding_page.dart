import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OnboardingPage extends GetView<OnboardingPageController> {
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
        children: [
          Expanded(
            child: ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                alignment: Alignment.center,
                color: Get.theme.primaryColor,
                padding: EdgeInsets.only(top: 50),
                child: SvgPicture.asset(
                  ONBOARDING_BACKGROUND,
                  width: Get.size.width / 1.1,
                ),
              ),
            ),
          ),
          Text(
            'Selamat Datang :)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Get.theme.primaryColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: FlatButton(
                    color: Get.theme.primaryColor,
                    textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Text('Masuk'),
                    onPressed: controller.routeToLoginPage,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: OutlineButton(
                    highlightedBorderColor: Colors.grey[800],
                    borderSide: BorderSide(
                      color: Colors.grey[800],
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Text('Daftar Baru'),
                    onPressed: controller.routeToRegisterPage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 10.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
