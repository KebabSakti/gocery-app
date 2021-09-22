import 'package:ayov2/const/const.dart';
import 'package:ayov2/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthRepo {
  final Network _network = Get.find();

  Future<dynamic> register({
    @required String customerName,
    @required String customerPhone,
    @required String customerEmail,
    @required String customerFcm,
  }) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_REGISTER_API,
      data: {
        'customer_name': customerName,
        'customer_phone': customerPhone,
        'customer_email': customerEmail,
        'customer_fcm': customerFcm,
      },
    );

    return response;
  }

  Future<dynamic> social({
    @required String customerName,
    @required String customerEmail,
    @required String customerFcm,
    @required String authType,
  }) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_AUTHENTICATE_SOCIAL,
      data: {
        'customer_name': customerName,
        'customer_email': customerEmail,
        'customer_fcm': customerFcm,
        'auth_type': authType,
      },
    );

    return response;
  }

  Future<dynamic> authenticate({
    String customerId,
    String customerPhone,
    String customerFcm,
  }) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_AUTHENTICATE_API,
      data: {
        'customer_id': customerId,
        'customer_phone': customerPhone,
        'customer_fcm': customerFcm,
      },
    );

    return response;
  }

  Future<dynamic> exist({String phoneNumber, String email}) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_EXIST_API,
      data: {
        'customer_phone': phoneNumber,
        'customer_email': email,
      },
    );

    return response;
  }

  Future<dynamic> update({
    @required String customerId,
    @required String customerPhone,
    @required String customerName,
    @required String customerEmail,
    @required String customerPassword,
    @required String customerFcm,
  }) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_UPDATE_API,
      data: {
        'customer_id': customerId,
        'customer_phone': customerPhone,
        'customer_name': customerName,
        'customer_email': customerEmail,
        'customer_password': customerPassword,
        'customer_fcm': customerFcm,
      },
    );

    return response;
  }

  Future<dynamic> customer({
    @required String customerId,
    @required String customerFcm,
  }) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_FETCH_ONE_API,
      data: {
        'customer_id': customerId,
        'customer_fcm': customerFcm,
      },
    );

    return response;
  }

  Future<dynamic> signout({@required String customerId}) async {
    var response = await _network.action(
      Methods.POST,
      CUSTOMER_SIGNOUT_API,
      data: {
        'customer_id': customerId,
      },
    );

    return response;
  }
}
