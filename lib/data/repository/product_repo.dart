import 'package:brown_store/data/model/body/MenuModelRequest.dart';
import 'package:brown_store/data/model/body/menu_model_status_request.dart';
import 'package:brown_store/data/model/body/order_status_model_request.dart';
import 'package:brown_store/data/model/body/service_model_status_request.dart';
import 'package:brown_store/data/model/body/store_model_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utill/app_constants.dart';
import '../datasource/remote/dio/dio_client.dart';
import '../datasource/remote/exception/api_error_handler.dart';
import '../model/response/base/api_response.dart';

class ProductRepo {
  final DioClient dioClient;
  final SharedPreferences sharedPreferences;
  ProductRepo({required this.dioClient, required this.sharedPreferences});


  Future<ApiResponse> getMenuList(MenuModelRequest menuModelRequest) async {
    try {
      final response = await dioClient.post(AppConstants.STORES_URI, data: menuModelRequest.toJson());
      //print(response);
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }


  Future<ApiResponse> changeStatusMenu(MenuModelStatusRequest menuModelStatusRequest) async {
    try {
      final response = await dioClient.post(AppConstants.STORES_URI, data: menuModelStatusRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> changeStatusService(ServiceModelStatusRequest serviceModelStatusRequest) async {
    try {
      final response = await dioClient.post(AppConstants.STORES_URI, data: serviceModelStatusRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

  Future<ApiResponse> changeStatusOrder(OrderStatusRequest orderModelStatusRequest) async {
    try {
      final response = await dioClient.post(AppConstants.STORES_URI, data: orderModelStatusRequest.toJson());
      return ApiResponse.withSuccess(response);
    } catch (e) {
      return ApiResponse.withError(ApiErrorHandler.getMessage(e));
    }
  }

}
