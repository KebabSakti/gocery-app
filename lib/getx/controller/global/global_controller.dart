import 'package:ayov2/getx/obs/obs.dart';
import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  final GlobalObs _globalObs = Get.find();

  @override
  void onInit() {
    debounce(_globalObs.authState, (AuthStateModel authStateModel) {
      //
    });

    super.onInit();
  }
}
