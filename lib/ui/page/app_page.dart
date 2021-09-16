import 'package:ayov2/const/const.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class AppPage extends GetView<AppPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: controller.backButtonHandler,
        child: SlidingUpPanel(
          controller: controller.panelController,
          backdropEnabled: true,
          minHeight: 0,
          maxHeight: Get.height - 100,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          header: Container(
            width: Get.size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey[100],
                ),
              ),
            ),
            child: Icon(
              Icons.drag_handle_rounded,
              color: Colors.grey[400],
              size: 30,
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller.pageController,
                  children: controller.pages,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
              Obx(() {
                return BottomNavigationBar(
                  backgroundColor: Colors.white,
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Get.theme.primaryColor,
                  selectedFontSize: 12,
                  unselectedFontSize: 10,
                  // selectedIconTheme: IconThemeData(size: 30),
                  currentIndex: controller.activePage.value,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(FontAwesomeIcons.shopify),
                      label: 'Belanja',
                    ),
                    BottomNavigationBarItem(
                      icon: IconWithDot(
                        Icon(Icons.assignment_rounded),
                        value: 1,
                      ),
                      label: 'Pesanan',
                    ),
                    BottomNavigationBarItem(
                      icon: IconWithDot(
                        Icon(Icons.ballot_rounded),
                        value: 4,
                      ),
                      label: 'Voucher',
                    ),
                    BottomNavigationBarItem(
                      icon: IconWithDot(
                        Icon(Icons.notifications_rounded),
                        value: 10,
                      ),
                      label: 'Notifikasi',
                    ),
                    BottomNavigationBarItem(
                      icon: IconWithDot(
                        Icon(Icons.account_circle_rounded),
                      ),
                      label: 'Akun',
                    ),
                  ],
                  onTap: controller.navigateTo,
                );
              }),
            ],
          ),
          panel: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Obx(() {
              final List<CategoryModel> categories =
                  controller.globalObs.categoryModel;

              if (controller.panelBody() == PanelBody.category) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Ink(
                        color: Colors.white,
                        child: InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Ink(
                                  width: 50,
                                  height: 50,
                                  child: SvgPicture.asset(
                                    ALL_CATEGORY,
                                    width: 50,
                                    height: 50,
                                    placeholderBuilder: (context) =>
                                        ShimmerLoader(
                                      width: 50,
                                      height: 50,
                                      radius: 50,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Semua Produk',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        'Solusi segala keperluan dapur kamu',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            controller.routeToProductPage(ProductFilterModel());
                          },
                        ),
                      ),
                      Divider(height: 1),
                      MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          separatorBuilder: (context, index) =>
                              Divider(height: 1),
                          itemBuilder: (context, index) {
                            return Ink(
                              color: Colors.white,
                              child: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Ink(
                                        width: 50,
                                        height: 50,
                                        child: SvgPicture.network(
                                          categories[index].categoryImage,
                                          width: 50,
                                          height: 50,
                                          placeholderBuilder: (context) =>
                                              ShimmerLoader(
                                            width: 50,
                                            height: 50,
                                            radius: 50,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              categories[index].categoryName,
                                              style: TextStyle(
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              categories[index]
                                                  .categoryDescription,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  controller.routeToProductPage(
                                    ProductFilterModel(
                                      category: categories[index].categoryId,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              if (controller.panelBody() == PanelBody.other) {
                return Container(
                  child: Center(
                    child: Text('OTHER'),
                  ),
                );
              }

              return SizedBox.shrink();
            }),
          ),
        ),
      ),
    );
  }
}
