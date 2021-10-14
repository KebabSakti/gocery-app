import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:ayov2/ui/ui.dart';
import 'package:flutter/material.dart';
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
          header: AppPagePanelHeader(),
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
                return Stack(
                  children: [
                    BottomNavigationBar(
                      backgroundColor: Colors.white,
                      showUnselectedLabels: true,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Get.theme.primaryColor,
                      // selectedFontSize: 10,
                      // unselectedFontSize: 10,
                      selectedIconTheme: IconThemeData(size: 26),
                      unselectedIconTheme: IconThemeData(size: 26),
                      selectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                      unselectedLabelStyle: TextStyle(fontSize: 10),
                      currentIndex: controller.activePage.value,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_rounded),
                          label: 'Beranda',
                        ),
                        BottomNavigationBarItem(
                          icon: IconWithDot(
                            Icon(Icons.list_alt_rounded),
                            value: 1,
                          ),
                          label: 'Orderan',
                        ),
                        BottomNavigationBarItem(
                          icon: IconWithDot(
                            Icon(Icons.receipt_long_rounded),
                            value: 2,
                          ),
                          label: 'Voucher',
                        ),
                        BottomNavigationBarItem(
                          icon: IconWithDot(
                            Icon(Icons.chat_rounded),
                            value: 10,
                          ),
                          label: 'Pesan',
                        ),
                        BottomNavigationBarItem(
                          icon: IconWithDot(
                            Icon(Icons.account_circle_rounded),
                          ),
                          label: 'Akun',
                        ),
                      ],
                      onTap: controller.navigateTo,
                    ),
                  ],
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
                return AppPagePanelCategory(
                  categories: categories,
                  controller: controller,
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
