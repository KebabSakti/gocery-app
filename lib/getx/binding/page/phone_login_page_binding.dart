import 'package:ayov2/getx/getx.dart';
import 'package:get/get.dart';

class PhoneLoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PhoneLoginPageController());
  }
}
