import 'package:ayov2/const/const.dart';
import 'package:get/get.dart';

class OrderPageController extends GetxController {
  void onTabPressed(int index) {
    print(index.toString());
  }

  void routeToOrderDetail() {
    Get.toNamed(ORDER_DETAIL_PAGE);
  }
}
