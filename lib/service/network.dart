import 'dart:io';

import 'package:ayov2/const/const.dart';
import 'package:ayov2/config/config.dart';
import 'package:ayov2/core/core.dart';
import 'package:ayov2/model/model.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;

enum Methods {
  GET,
  POST,
}

class Network {
  final AppPreference _appPreference = getx.Get.find();

  Dio _dio;

  Network() {
    BaseOptions options = BaseOptions(
      baseUrl: '$PROTOCOL://$URL:1001/api/',
      connectTimeout: 7000,
      receiveTimeout: 7000,
      responseType: ResponseType.plain,
      headers: {
        "Accept": "application/json",
        // "Content-Type": "application/json",
      },
    );

    _dio = Dio(options);

    if (NETWORK_LOG) {
      //interceptor for logging (development only)
      _dio.interceptors.add(LogInterceptor(responseBody: false));
    }

    if (NETWORK_PROXY) {
      //proxy all connection to local sever for request/response logging (development only)
      (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.findProxy = (uri) {
          return "PROXY $URL:8000";
        };
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  Future<Response> action(
    Methods method,
    String path, {
    String baseUrl,
    int connectTimeout,
    int receiveTimeout,
    String authToken,
    dynamic data,
    CancelToken cancelToken,
  }) async {
    CustomerModel user = await _appPreference.customer();

    //options
    if (baseUrl != null) _dio.options.baseUrl = baseUrl;
    if (connectTimeout != null) _dio.options.connectTimeout = connectTimeout;
    if (receiveTimeout != null) _dio.options.receiveTimeout = receiveTimeout;

    //add auth header
    if (user != null)
      _dio.options.headers["Authorization"] = "Bearer ${user.customerToken}";

    Response response;

    switch (method) {
      case Methods.GET:
        response = await _dio.get(path, cancelToken: cancelToken);
        break;

      case Methods.POST:
        response = await _dio.post(path, data: data, cancelToken: cancelToken);
        break;
    }

    return response;
  }
}
