import 'package:ayov2/getx/controller/controller.dart';
import 'package:get/get.dart';

class OrderPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OrderPageController());
  }
}
