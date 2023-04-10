import 'package:brown_store/data/model/body/MenuModelRequest.dart';
import 'package:brown_store/data/model/body/menu_model_status_request.dart';
import 'package:brown_store/data/model/body/order_status_model_request.dart';
import 'package:brown_store/data/model/body/service_model_status_request.dart';
import 'package:brown_store/data/model/response/menu_model.dart';
import 'package:brown_store/data/model/response/menu_model_status.dart';
import 'package:brown_store/data/model/response/order.dart';
import 'package:brown_store/data/model/response/order_status_model.dart';
import 'package:brown_store/data/model/response/service_model.dart';
import 'package:brown_store/data/repository/product_repo.dart';
import 'package:flutter/material.dart';

import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';
import '../view/base/custom_snackbar.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo productRepo;

  ProductProvider({required this.productRepo});


  late MenuModel _menuModel;
  MenuModel get menuModelList => _menuModel;


  late ServiceModel _serviceModel;
  ServiceModel get serviceModelList => _serviceModel;

  late OrderStatus _orderStatus;
  OrderStatus get orderStatus => _orderStatus;

  late MenuModelStatus _menuModelStatus;
  MenuModelStatus get menuModelStatus => _menuModelStatus;

  bool _hasConnection = true;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool loading){
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> getMenuList(BuildContext context, MenuModelRequest menuModelRequest, {String query = ""}) async {

    _hasConnection = true;
    _isLoading = true;
    notifyListeners();
    // ProgressDialog pd = ProgressDialog(context: context);
    // pd.show(max: 100, msg: 'Please waiting...');
    //print("Loading0 ${_isLoading}");

    ApiResponse apiResponse = await productRepo.getMenuList(menuModelRequest);
    bool isSuccess;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _menuModel = MenuModel.fromJson(apiResponse.response!.data);

      if(query!=""){
        _menuModel.result = _menuModel.result!.where((element) => element.menuName!.toLowerCase().contains(query.toLowerCase())).toList();
        print("=============menu========");
        print(_menuModel.result);
      }

      isSuccess = true;
      _isLoading = false;
      //print("Loading1 ${_isLoading}");
      //pd.close();
    } else {
      isSuccess = false;
      ApiChecker.checkApi(context, apiResponse);
      if (apiResponse.error.toString() ==
          'Connection to API server failed due to internet connection') {
        _hasConnection = false;
      }
    }
    print("Loading3 ${_isLoading}");
    notifyListeners();

    //return isSuccess;
  }

  Future<void> getServiceList(BuildContext context, MenuModelRequest menuModelRequest) async {
    _hasConnection = true;
    _isLoading = true;
    notifyListeners();
    // ProgressDialog pd = ProgressDialog(context: context);
    // pd.show(max: 100, msg: 'Please waiting...');
    print("Loading0 ${_isLoading}");

    ApiResponse apiResponse = await productRepo.getMenuList(menuModelRequest);
    bool isSuccess;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _serviceModel = ServiceModel.fromJson(apiResponse.response!.data);
      isSuccess = true;
      _isLoading = false;
    } else {
      isSuccess = false;
      ApiChecker.checkApi(context, apiResponse);
      if (apiResponse.error.toString() ==
          'Connection to API server failed due to internet connection') {
        _hasConnection = false;
      }
    }
    print("Loading3 ${_isLoading}");
    notifyListeners();
    //return isSuccess;
  }


  Future<ApiResponse> setMenuStatus(BuildContext context, MenuModelStatusRequest menuModelStatusRequest, MenuModelRequest menuModelRequest, {String query = ""}) async {
    _isLoading = true;
    ApiResponse apiResponse = await productRepo.changeStatusMenu(menuModelStatusRequest);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //_isLoading = false;
      Map map = apiResponse.response!.data;
      if(map["code"] == "100"){
        _menuModelStatus = MenuModelStatus.fromJson(apiResponse.response!.data);
        await getMenuList(context, menuModelRequest, query: query);
      }else{
        //_isLoading = false;
        showCustomSnackBar("Menu status can't set", context);
      }
    } else {
      //_isLoading = false;
      showCustomSnackBar("Menu status can't set", context);
    }
    notifyListeners();
    return apiResponse;
  }

  Future<ApiResponse> setServiceStatus(BuildContext context, ServiceModelStatusRequest serviceModelStatusRequest, MenuModelRequest menuModelRequest) async {
    _isLoading = true;
    ApiResponse apiResponse = await productRepo.changeStatusService(serviceModelStatusRequest);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //_isLoading = false;
      Map map = apiResponse.response!.data;
      if(map["code"] == "100"){
        _serviceModel = ServiceModel.fromJson(apiResponse.response!.data);
        await getServiceList(context, menuModelRequest);
      }else{
        //_isLoading = false;
        showCustomSnackBar("Menu status can't set", context);
      }
    } else {
      //_isLoading = false;
      showCustomSnackBar("Menu status can't set", context);
    }
    notifyListeners();
    return apiResponse;
  }

  Future<ApiResponse> setOrderStatus(BuildContext context, OrderStatusRequest orderStatusRequest) async {

    ApiResponse apiResponse = await productRepo.changeStatusOrder(orderStatusRequest);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      Map map = apiResponse.response!.data;
      print(map["description"]);
      if(map["code"] == "100"){
        _orderStatus = OrderStatus.fromJson(apiResponse.response!.data);
      }else{
        _isLoading = false;

        showCustomSnackBar(map["description"], context);
      }
    } else {
      _isLoading = false;
      showCustomSnackBar("Order status can't set", context);
    }
    notifyListeners();
    return apiResponse;
  }

}
