import 'dart:convert';
import 'dart:io';
import 'package:brown_store/data/model/body/login_model.dart';
import 'package:brown_store/data/model/body/login_model_info.dart';
import 'package:brown_store/data/model/body/login_model_request.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class AuthRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.dioClient, required this.sharedPreferences});

  Future<ApiResponse> login({required LoginModelRequest loginModelRequest}) async {

    try {
      Response response = await dioClient.post(AppConstants.STORES_URI,
        data: loginModelRequest.toJson(),
      );

      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> verifyOtp(String identity, String otp) async {
    try {
      Response response = await dioClient.post(
          AppConstants.VERIFY_OTP_URI, data: {"identity": identity.trim(), "otp": otp});
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> updateToken() async {
    try {
      String _deviceToken = await _getDeviceToken();
      FirebaseMessaging.instance.subscribeToTopic(AppConstants.TOPIC);
      Response response = await dioClient.post(
        AppConstants.TOKEN_URI,
        data: {"_method": "put", "cm_firebase_token": _deviceToken},
      );
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<String> _getDeviceToken() async {
    String _deviceToken;
    if(Platform.isIOS) {
      _deviceToken = (await FirebaseMessaging.instance.getAPNSToken())!;
    }else {
      _deviceToken = (await FirebaseMessaging.instance.getToken())!;
    }

    if (_deviceToken != null) {
      print('--------Device Token---------- '+_deviceToken);
    }
    return _deviceToken;
  }

  // for  user token

  Future<void> saveUserInfo(LoginModelInfo loginModelInfo) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_INFO, jsonEncode(loginModelInfo.toJson()));
    } catch (e) {
      throw e;
    }
  }

  Future<void> saveUserToken(String token) async {
    dioClient.token = token;
    dioClient.dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': 'Bearer $token'};

    try {
      await sharedPreferences.setString(AppConstants.TOKEN, token);
    } catch (e) {
      throw e;
    }
  }

  String getUserToken() {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? "";
  }


  String getUserInfo() {
    return sharedPreferences.getString(AppConstants.USER_INFO) ?? "";
  }


  bool isLoggedIn() {
    //return sharedPreferences.containsKey(AppConstants.TOKEN);
    return sharedPreferences.containsKey(AppConstants.USER_INFO);
  }
  Future<bool> clearUserSharedData() async {
    return sharedPreferences.remove(AppConstants.USER_INFO);
    //return sharedPreferences.clear();
  }

  Future<bool> clearSharedData() async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(AppConstants.TOPIC);
    return sharedPreferences.remove(AppConstants.TOKEN);
    //return sharedPreferences.clear();
  }

  // for  Remember Email
  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_PASSWORD, password);
      await sharedPreferences.setString(AppConstants.USER_EMAIL, number);
    } catch (e) {
      throw e;
    }
  }

  String getUserEmail() {
    return sharedPreferences.getString(AppConstants.USER_EMAIL) ?? "";
  }

  String getUserPassword() {
    return sharedPreferences.getString(AppConstants.USER_PASSWORD) ?? "";
  }

  Future<bool> clearUserNumberAndPassword() async {
    await sharedPreferences.remove(AppConstants.USER_PASSWORD);
    return await sharedPreferences.remove(AppConstants.USER_EMAIL);
  }
}
