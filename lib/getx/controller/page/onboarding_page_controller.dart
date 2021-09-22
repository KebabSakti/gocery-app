import 'package:ayov2/const/const.dart';
import 'package:get/get.dart';

class OnboardingPageController extends GetxController {
  void routeToLoginPage() {
    Get.toNamed(LOGIN_PAGE);
  }

  void routeToRegisterPage() {
    Get.toNamed(REGISTER_PAGE);
  }
}
