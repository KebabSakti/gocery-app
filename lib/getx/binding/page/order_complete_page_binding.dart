import 'package:ayov2/getx/controller/controller.dart';
import 'package:get/get.dart';

class OrderCompletePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderCompletePageController());
  }
}
