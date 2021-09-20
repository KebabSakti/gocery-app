import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:ayov2/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVoucherSection extends StatelessWidget {
  final HomePageController controller;

  HomeVoucherSection({@required this.controller});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SectionHeading(heading: 'Voucher Belanja'),
            SizedBox(height: 15),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var images = [
                    'https://image.freepik.com/free-vector/gradient-sale-background_23-2148948683.jpg?size=500&ext=webp',
                    'https://image.freepik.com/free-vector/gradient-10-10-background_23-2149058126.jpg?size=500&ext=webp',
                    'https://image.freepik.com/free-vector/gradient-flash-sale-background_23-2149027975.jpg?size=500&ext=webp',
                  ];

                  return Padding(
                    padding: EdgeInsets.only(
                      right: (index >= 0 && index != 2) ? 10 : 0,
                    ),
                    child: Obx(() {
                      StateModel<HomePageModel> home = controller.home();

                      if (home.state == States.loading) {
                        return ShimmerLoader(
                          radius: 15,
                          width: Get.size.width - 60,
                        );
                      }

                      if (images.length > 0) {
                        return HomeVoucherItem(url: images[index]);
                      }

                      return SizedBox.shrink();
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
