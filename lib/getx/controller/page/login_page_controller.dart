import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginPageController extends GetxController {
  final AuthFirebase _authFirebase = Get.find();
  final AuthLocal _authLocal = Get.find();
  final Helper _helper = Get.find();
  final AppPreference _appPreference = Get.find();

  final TextEditingController phoneField = TextEditingController();
  final Fcm _fcm = Fcm();

  void facebookSignIn() async {
    try {
      OAuthCredential facebookCredential =
          await _authFirebase.facebookCredential();

      if (facebookCredential != null) await _socialSignIn(facebookCredential);
    } catch (e) {
      print(e.toString());

      _helper.dialog.close();
      _helper.toast.show(e.toString());
    }
  }

  void googleSignIn() async {
    try {
      OAuthCredential googleCredential = await _authFirebase.googleCredential();

      if (googleCredential != null) _socialSignIn(googleCredential);
    } catch (e) {
      print(e.toString());

      _helper.dialog.close();
      _helper.toast.show(GENERAL_MESSAGE);
    }
  }

  Future _socialSignIn(OAuthCredential credential) async {
    try {
      if (credential != null) {
        _helper.dialog.loading();

        UserCredential userCredential =
            await _authFirebase.signInWithCredential(credential);

        _authLocal
            .social(
          customerName: userCredential.user.displayName,
          customerEmail: userCredential.user.email ??
              userCredential.user.providerData[0].email,
          authType: userCredential.additionalUserInfo.providerId,
          customerFcm: await _fcm.token(),
        )
            .then((result) async {
          await _appPreference.customer(data: result);

          _routeToAppPage();
        }).catchError((k, v) => throw Failure(k.toString()));
      }
    } on Failure catch (e) {
      print(e.toString());

      _helper.dialog.close();
      _helper.toast.show(GENERAL_MESSAGE);
    }
  }

  void phoneSignIn() async {
    try {
      if (phoneField.text.length == 0) throw Failure(PHONE_REQUIRED);

      _helper.dialog.loading();

      PhoneNumber phoneNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
          '+62${phoneField.text}', 'ID');

      var result = await _authLocal.exist(phoneNumber: phoneNumber.toString());

      if (result is DioError) throw Failure(DIOERROR_MESSAGE);

      if (result is! DioError && result) throw Failure(PHONE_NOT_REGISTERED);

      await _authFirebase.signInWithPhone(
        phoneNumber.toString(),
        codeAutoRetrievalTimeout: (String verificationId) {
          print(verificationId);
        },
        verificationFailed: (FirebaseAuthException exception) {
          throw Failure(GENERAL_MESSAGE);
        },
        codeSent: (String verificationId, int resendToken) async {
          _routeToOtpPage(verificationId, resendToken, phoneNumber.toString());

          // if (userCredential == null)
          //   _helper.dialog.close();
          // else
          //   _authenticate(userCredential);
        },
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _authFirebase
              .signInWithCredential(credential)
              .then((result) => _authenticate(result));
        },
      );
    } on Failure catch (e) {
      _helper.dialog.close();
      _helper.toast.show(e.message);
    }
  }

  void _authenticate(UserCredential credential) async {
    try {
      await _authLocal
          .authenticate(
        customerPhone: credential.user.phoneNumber,
        customerFcm: await _fcm.token(),
      )
          .then((result) async {
        await _appPreference.customer(data: result);

        _routeToAppPage();
      }).catchError((k, v) => throw Failure(k.toString()));
    } on Failure catch (e) {
      _helper.dialog.close();
      _helper.toast.show(e.message);
    }
  }

  void _routeToOtpPage(
      String verificationId, int resendToken, String phoneNumber) {
    Get.toNamed(OTP_PAGE,
        arguments: [verificationId, resendToken, phoneNumber]);
  }

  void routeToPhoneLoginPage() {
    Get.toNamed(PHONE_LOGIN_PAGE);
  }

  void _routeToAppPage() {
    Get.offAllNamed(APP_PAGE);
  }

  @override
  void dispose() {
    phoneField.dispose();
    super.dispose();
  }
}
