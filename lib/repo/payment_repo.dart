import 'package:ayov2/const/const.dart';
import 'package:ayov2/service/service.dart';
import 'package:get/get.dart';

class PaymentRepo {
  final Network _network = Get.find();

  Future<dynamic> paymentChannel() async {
    var response = await _network.action(
      Methods.GET,
      PAYMENT_CHANNEL_API,
    );

    return response;
  }
}
