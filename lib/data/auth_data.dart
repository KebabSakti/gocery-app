import 'dart:convert';

import 'package:ayov2/model/model.dart';
import 'package:ayov2/repo/repo.dart';
import 'package:flutter/material.dart';

class AuthData {
  final AuthRepo _authRepo = AuthRepo();

  Future<CustomerModel> register({
    @required String customerName,
    @required String customerPhone,
    @required String customerEmail,
    @required String customerFcm,
    @required String idToken,
  }) async {
    var response = await _authRepo.register(
      customerName: customerName,
      customerPhone: customerPhone,
      customerEmail: customerEmail,
      customerFcm: customerFcm,
      idToken: idToken,
    );

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    return CustomerModel.fromJson(parsedData['data']);
  }

  Future<CustomerModel> social({
    @required String customerName,
    @required String customerEmail,
    @required String customerFcm,
    @required String authType,
    @required String idToken,
  }) async {
    var response = await _authRepo.social(
      customerName: customerName,
      customerEmail: customerEmail,
      customerFcm: customerFcm,
      authType: authType,
      idToken: idToken,
    );

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    return CustomerModel.fromJson(parsedData['data']);
  }

  Future<CustomerModel> authenticate({
    String customerId,
    String customerPhone,
    String customerFcm,
    String idToken,
  }) async {
    var response = await _authRepo.authenticate(
      customerId: customerId,
      customerPhone: customerPhone,
      customerFcm: customerFcm,
      idToken: idToken,
    );

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    return CustomerModel.fromJson(parsedData['data']);
  }

  Future<CustomerModel> update({
    @required String customerId,
    @required String customerPhone,
    @required String customerName,
    @required String customerEmail,
    @required String customerPassword,
    @required String customerFcm,
  }) async {
    var response = await _authRepo.update(
      customerId: customerId,
      customerPhone: customerPhone,
      customerName: customerName,
      customerEmail: customerEmail,
      customerPassword: customerPassword,
      customerFcm: customerFcm,
    );

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    return CustomerModel.fromJson(parsedData['data']);
  }

  Future<bool> signout({@required String customerId}) async {
    var response = await _authRepo.signout(customerId: customerId);

    var parsedData = await jsonDecode(response.data);

    if (!parsedData['success']) throw Exception(parsedData['message']);

    return parsedData['success'];
  }

  Future<bool> exist({String phoneNumber, String email}) async {
    var response = await _authRepo.exist(
      phoneNumber: phoneNumber,
      email: email,
    );

    var parsedData = await jsonDecode(response.data);

    return parsedData['success'];
  }
}
