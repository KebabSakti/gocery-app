import 'package:ayov2/const/route_const.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ErrorHandler implements Exception {
  dynamic error;

  ErrorHandler(this.error) {
    print('\x1B[31m${error.toString()}\x1B[0m');

    if (Get.isDialogOpen) Get.back();
  }

  void toast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey[100],
      textColor: Colors.black,
    );
  }

  void redirect(Function refresh) async {
    await Get.toNamed(ERROR_PAGE);

    refresh();
  }
}
