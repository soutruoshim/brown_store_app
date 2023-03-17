import 'dart:convert';
import 'package:brown_store/data/model/body/login_model_info.dart';
import 'package:brown_store/data/model/body/login_model_request.dart';
import 'package:dio/dio.dart';
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

  // for  user token

  Future<void> saveUserInfo(LoginModelInfo loginModelInfo) async {
    try {
      await sharedPreferences.setString(AppConstants.USER_INFO, jsonEncode(loginModelInfo.toJson()));
    } catch (e) {
      throw e;
    }
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

}
