import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeQrPointSection extends StatelessWidget {
  final HomePageController controller;

  HomeQrPointSection({@required this.controller});
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Get.theme.dividerColor),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Ink(
                height: 50,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset(QR_ICON, width: 20),
                        SizedBox(width: 10),
                        Text('scan qr'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 1,
              color: Get.theme.dividerColor,
            ),
            Expanded(
              child: Ink(
                height: 50,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('0 Point'),
                        SizedBox(width: 10),
                        SvgPicture.asset(COIN_ICON, width: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
