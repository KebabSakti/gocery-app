import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/getx/getx.dart';
import 'package:ayov2/model/model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class IntroPageController extends GetxController {
  final GlobalObs _globalObs = Get.find();
  final AppPreference _appPreference = Get.find();
  final AuthLocal _authLocal = Get.find();

  final Fcm _fcm = Fcm();

  void _authState() async {
    CustomerModel user = await _appPreference.customer();

    if (user == null) {
      _routeToOnboardingPage();
    } else {
      _authenticate();
    }
  }

  void _authenticate() async {
    try {
      CustomerModel user = await _appPreference.customer();

      CustomerModel customerModel = await _authLocal.authenticate(
        customerId: user.customerId,
        customerFcm: await _fcm.token(),
      );

      await _appPreference.customer(data: customerModel);

      _routeToAppPage();
    } catch (e) {
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
  }

  Future _initFirebase() async {
    await Firebase.initializeApp();
  }

  Future _initFcm() async {
    await _fcm.registerNotificationChannel();

    _fcm.handleMessageEvent(
      onMessage: (Map<String, dynamic> payload) {
        _globalObs
            .fcmModel(FcmModel(event: FcmEvent.onMessage, payload: payload));
      },
      onLaunch: (Map<String, dynamic> payload) {
        _globalObs
            .fcmModel(FcmModel(event: FcmEvent.onLaunch, payload: payload));
      },
      onResume: (Map<String, dynamic> payload) {
        _globalObs
            .fcmModel(FcmModel(event: FcmEvent.onResume, payload: payload));
      },
    );
  }

  Future _cacheSvgAssets() async {
    Future.wait([
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, ONBOARDING_BACKGROUND),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, GOOGLE),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, LOGO),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, QR_ICON),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, COIN_ICON),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, ARROW_UP_ICON),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, EMPTY_CART),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, ALL_CATEGORY),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, NO_DATA),
        null,
      ),
      precachePicture(
        ExactAssetPicture(SvgPicture.svgStringDecoder, ERROR),
        null,
      ),
    ]);
  }

  Future _init() async {
    await _initFirebase();
    await _initFcm();
    await _cacheSvgAssets();
    _authState();
  }

  void _routeToOnboardingPage() {
    Get.offAllNamed(ONBOARDING_PAGE);
  }

  void _routeToAppPage() {
    Get.offAllNamed(APP_PAGE);
  }

  @override
  void onInit() async {
    await _init();
    super.onInit();
  }
}
