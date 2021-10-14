import 'package:ayov2/getx/getx.dart';
import 'package:get/get.dart';

class ChatPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ChatPageController());
  }
}
