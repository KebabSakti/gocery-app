import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/service/service.dart';
import 'package:get/get.dart';

class GlobalBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GlobalObs());
    Get.put(AppPreference());
    Get.put(Network());
    Get.put(AuthFirebase());
    Get.put(AuthLocal());
    Get.put(Helper());
    Get.put(CartController());
  }
}
