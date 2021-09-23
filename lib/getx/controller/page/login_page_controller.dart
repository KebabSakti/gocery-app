import 'package:ayov2/const/const.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/helper/helper.dart';
import 'package:ayov2/model/model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
  }

  void googleSignIn() async {
    try {
      OAuthCredential googleCredential = await _authFirebase.googleCredential();

      if (googleCredential != null) _socialSignIn(googleCredential);
    } catch (e) {
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
  }

  Future _socialSignIn(OAuthCredential credential) async {
    try {
      if (credential != null) {
        _helper.dialog.loading();

        UserCredential userCredential =
            await _authFirebase.signInWithCredential(credential);

        CustomerModel customerModel = await _authLocal.social(
          customerName: userCredential.user.displayName,
          customerEmail: userCredential.user.email ??
              userCredential.user.providerData[0].email,
          authType: userCredential.additionalUserInfo.providerId,
          customerFcm: await _fcm.token(),
        );

        await _appPreference.customer(data: customerModel);

        _routeToAppPage();
      }
    } catch (e) {
      ErrorHandler(e).toast(GENERAL_MESSAGE);
    }
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
