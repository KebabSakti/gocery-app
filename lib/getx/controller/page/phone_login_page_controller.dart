import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneLoginPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final AppPreference _appPreference = Get.find();
  final Helper _helper = Get.find();

  final Fcm _fcm = Fcm();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneField = TextEditingController();

  final RxString phone = "".obs;

  void _phoneSignIn() async {
    try {
      _helper.dialog.loading();

      PhoneNumber phoneNumber =
          await PhoneNumber.getRegionInfoFromPhoneNumber('+62${phone()}', 'ID');

      if (await _authLocal.exist(phoneNumber: phoneNumber.toString()))
        throw Failure(PHONE_NOT_REGISTERED);

      await _authFirebase.signInWithPhone(
        phoneNumber.toString(),
        codeAutoRetrievalTimeout: (String verificationId) {
          print('TIMEOUT');
          print(verificationId);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw Failure(GENERAL_MESSAGE);
        },
        codeSent: (String verificationId, int resendToken) async {
          var userCredential = await _routeToOtpPage(
              verificationId, resendToken, phoneNumber.toString());

          _authenticate(userCredential);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCredential =
              await _authFirebase.signInWithCredential(credential);

          _authenticate(userCredential);
        },
      );
    } on Failure catch (e) {
      ErrorHandler(e).toast(e.message);
    } catch (e) {
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
  }

  void _authenticate(UserCredential credential) async {
    try {
      CustomerModel customerModel = await _authLocal.authenticate(
        customerPhone: credential.user.phoneNumber,
        customerFcm: await _fcm.token(),
      );

      await _appPreference.customer(data: customerModel);

      _routeToAppPage();
    } catch (e) {
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
  }

  void _phoneFieldListener() {
    phone(phoneField.text);
  }

  void submit() {
    _phoneSignIn();
  }

  Future<dynamic> _routeToOtpPage(
      String verificationId, int resendToken, String phoneNumber) async {
    return await Get.toNamed(OTP_PAGE,
        arguments: [verificationId, resendToken, phoneNumber]);
  }

  void _routeToAppPage() {
    Get.offAllNamed(APP_PAGE);
  }

  void _init() {
    phoneField.addListener(_phoneFieldListener);
  }

  @override
  void onInit() {
    _init();
    super.onInit();
  }

  @override
  void dispose() {
    phoneField.dispose();
    super.dispose();
  }
}
