import 'package:brown_store/data/model/body/login_model_info.dart';
import 'package:brown_store/data/model/body/login_model_request.dart';
import 'package:brown_store/data/model/response/store_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../data/model/response/base/api_response.dart';
import '../data/repository/auth_repo.dart';
import '../helper/api_checker.dart';
import '../helper/user_login_info.dart';
import '../view/base/custom_snackbar.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void setLoading(bool loading){
      _isLoading = loading;
  }

  String _loginErrorMessage = '';

  String get loginErrorMessage => _loginErrorMessage;
  late XFile _sellerProfileImage;
  late XFile _shopLogo;
  late XFile _shopBanner;

  XFile get sellerProfileImage => _sellerProfileImage;

  XFile get shopLogo => _shopLogo;

  XFile get shopBanner => _shopBanner;
  bool _isTermsAndCondition = false;

  bool get isTermsAndCondition => _isTermsAndCondition;
  bool _isActiveRememberMe = false;

  bool get isActiveRememberMe => _isActiveRememberMe;
  int _selectionTabIndex = 1;

  int get selectionTabIndex => _selectionTabIndex;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController shopAddressController = TextEditingController();

  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode shopNameNode = FocusNode();
  FocusNode shopAddressNode = FocusNode();

  Future<ApiResponse> login(BuildContext context, LoginModelRequest loginModelRequest, Store store) async {
    _isLoading = true;
    notifyListeners();
    ApiResponse apiResponse = await authRepo.login(loginModelRequest: loginModelRequest);

    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
      //_isLoading = false;

      Map map = apiResponse.response!.data;

      if(map["code"] == "100"){

         String? user_id     = loginModelRequest.datas!.username;
         String? store_id   = store.storeId;
         String? store_name = store.name;

         await authRepo.saveUserInfo(LoginModelInfo(userId: user_id, storeId: store_id, storeName: store_name));

      }else{
        _isLoading = false;
        showCustomSnackBar("invalid credential or account not verified yet", context);
      }
    } else {
        _isLoading = false;
      showCustomSnackBar("invalid credential or account not verified yet", context);
    }
    notifyListeners();
    return apiResponse;
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearUserSharedData();
  }

  String getUserInfo() {
    return authRepo.getUserInfo();
  }

  Future<bool> logOut(BuildContext context) async {
     final LiveQuery liveQuery = LiveQuery();
     QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject('Orders'))
       ..whereEqualTo("store_id", getLoginInfo(context).storeId);
     Subscription subscription = await liveQuery.client.subscribe(query);
     liveQuery.client.unSubscribe(subscription);
     authRepo.clearUserSharedData();
     return isLoggedIn();
  }

}
