// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'network_helper.dart';

class NetworkService {
  static bool isTester = true;
  static String SERVER_DEV = "backdemo.smartdiller.com";
  static String SERVER_PROD = "backbmgroup.smartdiller.com";

  static final client = InterceptedClient.build(
    interceptors: [HttpInterceptor()],
    retryPolicy: HttpRetryPolicy(),
  );

  static String getServer() {
    // if (isTester) return SERVER_DEV;
    return SERVER_PROD;
  }

  /* Http Requests */
  static Future<String?> GET(String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(getServer(), api, params);
      var response = await client.get(uri);
      if (response.statusCode == 200) {
        log('SUCCESS');
        return response.body;
      } else {
        log('ERROR: STATUS CODE-> ${response.statusCode}');
        _throwException(response);
      }
    } on SocketException catch (_) {
      rethrow;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(getServer(), api);
      debugPrint('Body: ${jsonEncode(params)}');
      var response = await client.post(uri, body: jsonEncode(params));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      rethrow;
    }
    return null;
  }

  static Future<String?> PUT(String api,
      {Map<String, dynamic> body = const {}}) async {
    try {
      var uri = Uri.https(getServer(), api);
      var response = await client.put(uri, body: jsonEncode(body));
      if (response.statusCode == 200 || response.statusCode == 204) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      rethrow;
    }
    return null;
  }

  static Future<String?> DEL(String api) async {
    try {
      var uri = Uri.https(getServer(), api);
      var response = await client.delete(uri);
      if (response.statusCode == 200 || response.statusCode == 204) {
        return response.body;
      } else {
        _throwException(response);
      }
    } on SocketException catch (_) {
      rethrow;
    }
    return null;
  }

  static _throwException(Response response) {
    String reason = response.reasonPhrase!;
    switch (response.statusCode) {
      case 400:
        throw BadRequestException(reason);
      case 401:
        throw InvalidInputException(reason);
      case 403:
        throw UnauthorisedException(reason);
      case 404:
        throw FetchDataException(reason);
      case 500:
      default:
        throw FetchDataException(reason);
    }
  }

  /* Http Apis */
  // static String API_POST_LIST = "/postss";
  static String API_REFRESH_TOKEN = "";
  static String API_LOGIN = "/api/login";
  static String API_DICTIONAY_DAILY = "/api/dictionary/daily";
  static String API_DICTIONAY_PAYMENTS = "/api/dictionary/payments";
  static String API_ADMIN_CONTRACT = "/api/admin/contract/edit";
  static String API_DICTIONARY_PAYMENTSCONTRACT =
      "/api/dictionary/paymentscontract";
  static String API_CONTRACT_LIST = "/api/admin/contract/list";
  static String API_ADMIN_HOME_PADEZD = "/api/admin/home/padezd";
  static String API_ADMIN_HOME_EDIT = "/api/admin/home/edit/12";

  static Future<void> logDataFromApi(String Api) async {
    var response = await GET(Api, paramsEmpty());
    final result = jsonDecode(response!);
    log('RESULT: $result');
  }
  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, dynamic> dataLogin(
      String login, String password, String deviceName) {
    return {
      'login': login,
      'password': password,
      'name': deviceName,
    };
  }
}
