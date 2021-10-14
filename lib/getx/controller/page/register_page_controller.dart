import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class RegisterPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final AppPreference _appPreference = Get.find();
  final Helper _helper = Get.find();

  final Fcm _fcm = Fcm();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameField = TextEditingController();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController phoneField = TextEditingController();

  void _phoneSignIn() async {
    try {
      _helper.dialog.loading();

      PhoneNumber phoneNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
          '+62${phoneField.text}', 'ID');

      if (!await _authLocal.exist(
          email: emailField.text, phoneNumber: phoneNumber.toString()))
        throw Failure(PHONE_EMAIL_EXIST);

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

          if (userCredential != null) _register(userCredential);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          UserCredential userCredential =
              await _authFirebase.signInWithCredential(credential);

          _register(userCredential);
        },
      );
    } on Failure catch (e) {
      ErrorHandler(e).toast(e.message);
    } catch (e) {
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
  }

  String fieldValidator(String value) {
    if (value.isEmpty) {
      return FIELD_REQUIRED;
    }
    return null;
  }

  void submitRegisterForm() {
    if (formKey.currentState.validate()) _phoneSignIn();
  }

  void _register(UserCredential userCredential) async {
    try {
      CustomerModel customerModel = await _authLocal.register(
        customerName: nameField.text,
        customerEmail: emailField.text,
        customerPhone: '+62${phoneField.text}',
        customerFcm: await _fcm.token(),
        idToken: await userCredential.user.getIdToken(),
      );

      await _appPreference.customer(data: customerModel);

      _routeToAppPage();
    } catch (e) {
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
  }

  Future<dynamic> _routeToOtpPage(
      String verificationId, int resendToken, String phoneNumber) async {
    return await Get.toNamed(OTP_PAGE,
        arguments: [verificationId, resendToken, phoneNumber]);
  }

  void _routeToAppPage() {
    Get.offAllNamed(APP_PAGE);
  }

  @override
  void onClose() {
    nameField.dispose();
    emailField.dispose();
    phoneField.dispose();

    super.onClose();
  }
}
