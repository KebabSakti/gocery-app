import 'package:ayov2/const/ayo_icons.dart';
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
                return BottomNavigationBar(
                  backgroundColor: Colors.white,
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Get.theme.primaryColor,
                  // selectedFontSize: 10,
                  // unselectedFontSize: 10,
                  selectedIconTheme: IconThemeData(size: 22),
                  unselectedIconTheme: IconThemeData(size: 20),
                  selectedLabelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                  ),
                  unselectedLabelStyle: TextStyle(fontSize: 10),
                  currentIndex: controller.activePage.value,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Ayo.house),
                      label: 'Beranda',
                    ),
                    BottomNavigationBarItem(
                      icon: IconWithDot(
                        Icon(Ayo.notes),
                        value: 1,
                      ),
                      label: 'Pesanan',
                    ),
                    BottomNavigationBarItem(
                      icon: IconWithDot(
                        Icon(Ayo.slack),
                        value: 4,
                      ),
                      label: 'Voucher',
                    ),
                    BottomNavigationBarItem(
                      icon: IconWithDot(
                        Icon(Ayo.reminders),
                        value: 10,
                      ),
                      label: 'Notifikasi',
                    ),
                    BottomNavigationBarItem(
                      icon: IconWithDot(
                        Icon(Ayo.settings),
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
