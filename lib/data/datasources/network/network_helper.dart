import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http_interceptor/http_interceptor.dart';
import '../../../core/services/log_service.dart';
import '../database/db_service.dart';

class HttpInterceptor implements InterceptorContract {
  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) {
    try {
      // Fetching access token from your database
      var accessToken = DBService.to.getAccessToken();
      // var accessToken = 'EF5rv1LD0VGFPNOq8gdXOpyZLJLRmSfhaZXEsaMpnuLittMCI2xCzqOLI8T0Lj2X';
      // Clear previous header and update it with updated token
      request.headers.clear();
      // request.headers['x-api-key'] = API_KEY;

      request.headers['Content-type'] = 'application/json; charset=UTF-8';
      // request.headers['Accept-Language'] = DBService.to.getLanguage();
      if (accessToken.isNotEmpty) {
        request.headers['Authorization'] = 'Bearer $accessToken';
      }
      log(request.url.toString());

      LogService.i(request.toString());
    } catch (e) {
      LogService.e(e.toString());
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      if (response is Response) {
        LogService.i(jsonDecode(response.body).toString());
      }
    } else {
      LogService.e(response.statusCode.toString());
      if (response is Response) {
        LogService.i(jsonDecode(response.body).toString());
      } else {
        LogService.e(response.toString());
      }
    }
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return true;
  }
}

class HttpRetryPolicy extends RetryPolicy {
  //Number of retry
  @override
  // ignore: overridden_fields
  int maxRetryAttempts = 2;

  @override
  Future<bool> shouldAttemptRetryOnResponse(BaseResponse response) async {
    if (response.statusCode == 401) {
      // Load access and refresh token from database
      // var accessToken = DBService.to.getAccessToken();
      // var refreshToken = DBService.to.getRefreshToken();
      // var response = await NetworkService.POST(NetworkService.API_REFRESH_TOKEN, {'access_token':accessToken,'refresh_token':refreshToken});
      // if(response != null){
      //   var verifyOtpModel = VerifyOtpModel.fromJson(jsonDecode(response)['data']);
      //   await DBService.to.delAccessToken();
      //   await DBService.to.delRefreshToken();
      //   await DBService.to.setAccessToken(verifyOtpModel.accessToken);
      //   await DBService.to.setRefreshToken(verifyOtpModel.refreshToken);
      // }
      // return true;
    }
    return false;
  }
}

class HttpException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  HttpException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends HttpException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends HttpException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends HttpException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends HttpException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
