import 'package:ayov2/model/model.dart';
import 'package:get/get.dart';

class GlobalObs {
  final Rx<FcmModel> fcmModel = FcmModel().obs;
  final Rx<AuthStateModel> authState = AuthStateModel().obs;
  final RxList<CategoryModel> categoryModel = List<CategoryModel>().obs;
}
