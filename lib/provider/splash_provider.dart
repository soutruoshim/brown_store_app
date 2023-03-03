import 'package:flutter/material.dart';

import '../data/model/response/base/api_response.dart';
import '../data/model/response/config_model.dart';
import '../data/repository/splash_repo.dart';
import '../helper/api_checker.dart';

class SplashProvider extends ChangeNotifier {
  final SplashRepo splashRepo;

  SplashProvider({required this.splashRepo});

  late ConfigModel _configModel;
  late BaseUrls _baseUrls;
  late int _currencyIndex;
  late int _shippingIndex;
  bool _hasConnection = true;
  bool _fromSetting = false;
  bool _firstTimeConnectionCheck = true;
  late List<String> _unitList;
  int _unitIndex = 0;
  int _colorIndex = 0;

  List<String> get unitList => _unitList;

  int get unitIndex => _unitIndex;

  int get colorIndex => _colorIndex;
  List<String> _shippingTypeList = [];
  String _shippingStatusType = '';

  List<String> get shippingTypeList => _shippingTypeList;

  String get shippingStatusType => _shippingStatusType;

  ConfigModel get configModel => _configModel;

  BaseUrls get baseUrls => _baseUrls;

  int get currencyIndex => _currencyIndex;

  int get shippingIndex => _shippingIndex;

  bool get hasConnection => _hasConnection;

  bool get fromSetting => _fromSetting;

  bool get firstTimeConnectionCheck => _firstTimeConnectionCheck;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> initConfig(BuildContext context) async {
    _hasConnection = true;
    ApiResponse apiResponse = await splashRepo.getConfig();
    bool isSuccess;
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _configModel = ConfigModel.fromJson(apiResponse.response!.data);
      _baseUrls = ConfigModel.fromJson(apiResponse.response!.data).baseUrls;

      isSuccess = true;
    } else {
      isSuccess = false;
      ApiChecker.checkApi(context, apiResponse);
      if (apiResponse.error.toString() ==
          'Connection to API server failed due to internet connection') {
        _hasConnection = false;
      }
    }
    notifyListeners();
    return isSuccess;
  }

  void setFirstTimeConnectionCheck(bool isChecked) {
    _firstTimeConnectionCheck = isChecked;
  }

  void setShippingType(int index) {
    splashRepo.setShippingType(_shippingTypeList[index]);
    notifyListeners();
  }

  void initShippingType(String type) {
    _shippingIndex = _shippingTypeList.indexOf(type);
    notifyListeners();
  }

  void initSharedPrefData() {
    splashRepo.initSharedData();
  }

  void setFromSetting(bool isSetting) {
    _fromSetting = isSetting;
  }

  void initShippingTypeList(BuildContext context, String type) async {
    ApiResponse apiResponse =
        await splashRepo.getShippingTypeList(context, type);
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      _shippingTypeList.clear();
      _shippingTypeList = [];
      _shippingTypeList.addAll(apiResponse.response!.data);
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
    notifyListeners();
  }
}