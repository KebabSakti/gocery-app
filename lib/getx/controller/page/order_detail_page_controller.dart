import 'package:ayov2/const/const.dart';
import 'package:get/get.dart';

class OrderDetailPageController extends GetxController {
  void routeToChatPage() {
    Get.toNamed(CHAT_PAGE);
  }

  void routeToTrackingPage() {
    Get.toNamed(TRACKING_PAGE);
  }
}
