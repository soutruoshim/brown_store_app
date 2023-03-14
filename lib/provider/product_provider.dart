import 'package:brown_store/data/model/body/MenuModelRequest.dart';
import 'package:brown_store/data/model/body/menu_model_status_request.dart';
import 'package:brown_store/data/model/response/menu_model.dart';
import 'package:brown_store/data/model/response/menu_model_status.dart';
import 'package:brown_store/data/repository/product_repo.dart';
import 'package:flutter/material.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';
import '../view/base/custom_snackbar.dart';

class ProductProvider extends ChangeNotifier {
  final ProductRepo productRepo;

  ProductProvider({required this.productRepo});

  late MenuModel _menuModel;
  MenuModel get menuModelList => _menuModel;

  late MenuModelStatus _menuModelStatus;
  MenuModelStatus get menuModelStatus => _menuModelStatus;

  bool _hasConnection = true;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setIsLoading(bool loading){
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> getMenuList(BuildContext context, MenuModelRequest menuModelRequest) async {


    _hasConnection = true;
    _isLoading = true;
    notifyListeners();
    // ProgressDialog pd = ProgressDialog(context: context);
    // pd.show(max: 100, msg: 'Please waiting...');
    print("Loading0 ${_isLoading}");

    ApiResponse apiResponse = await productRepo.getMenuList(menuModelRequest);
    bool isSuccess;
    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {
      _menuModel = MenuModel.fromJson(apiResponse.response!.data);
      //print(apiResponse.response!.data);
      isSuccess = true;
      _isLoading = false;
      print("Loading1 ${_isLoading}");
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


  Future<ApiResponse> setMenuStatus(BuildContext context, MenuModelStatusRequest menuModelStatusRequest, MenuModelRequest menuModelRequest) async {
    _isLoading = true;
    ApiResponse apiResponse = await productRepo.changeStatusMenu(menuModelStatusRequest);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //_isLoading = false;
      Map map = apiResponse.response!.data;
      if(map["code"] == "100"){
        _menuModelStatus = MenuModelStatus.fromJson(apiResponse.response!.data);
        await getMenuList(context, menuModelRequest);
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

}
