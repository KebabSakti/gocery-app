import 'package:ayov2/core/core.dart';
import 'package:ayov2/data/data.dart';
import 'package:ayov2/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLocal {
  final AppPreference _appPreference = Get.find();

  final AuthData _authData = AuthData();

  Future<CustomerModel> register({
    @required String customerName,
    @required String customerPhone,
    @required String customerEmail,
    @required String customerFcm,
    @required String idToken,
  }) async {
    return await _authData.register(
      customerName: customerName,
      customerPhone: customerPhone,
      customerEmail: customerEmail,
      customerFcm: customerFcm,
      idToken: idToken,
    );
  }

  Future<CustomerModel> social({
    @required String customerName,
    @required String customerEmail,
    @required String customerFcm,
    @required String authType,
    @required String idToken,
  }) async {
    return await _authData.social(
      customerName: customerName,
      customerEmail: customerEmail,
      customerFcm: customerFcm,
      authType: authType,
      idToken: idToken,
    );
  }

  Future<CustomerModel> authenticate({
    String customerId,
    String customerPhone,
    String customerFcm,
    String idToken,
  }) async {
    return await _authData.authenticate(
      customerId: customerId,
      customerPhone: customerPhone,
      customerFcm: customerFcm,
      idToken: idToken,
    );
  }

  Future<CustomerModel> updateUser({
    @required String customerId,
    String customerPhone,
    String customerName,
    String customerEmail,
    String customerPassword,
    String customerFcm,
  }) async {
    return await _authData.update(
      customerId: customerId,
      customerName: customerName,
      customerPhone: customerPhone,
      customerEmail: customerEmail,
      customerPassword: customerId,
      customerFcm: customerFcm,
    );
  }

  Future<bool> exist({String phoneNumber, String email}) async {
    return await _authData.exist(phoneNumber: phoneNumber, email: email);
  }

  Future signout() async {
    CustomerModel user = await _appPreference.customer();

    await _authData.signout(customerId: user.customerId);

    await _appPreference.customer(data: CustomerModel());
  }
}
