import 'package:brown_store/data/model/body/login_model_info.dart';
import 'package:brown_store/data/model/body/login_model_request.dart';
import 'package:brown_store/data/model/response/store_model.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../data/model/response/base/api_response.dart';
import '../data/repository/auth_repo.dart';
import '../helper/api_checker.dart';
import '../view/base/custom_snackbar.dart';

class AuthProvider with ChangeNotifier {
  final AuthRepo authRepo;

  AuthProvider({required this.authRepo});

  bool _isLoading = false;

  bool get isLoading => _isLoading;
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
      _isLoading = false;

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
      // String token = map["token"];
      // authRepo.saveUserToken(token);
      // print("ktv ${map["code"]}");
    } else {
      _isLoading = false;
      showCustomSnackBar("invalid credential or account not verified yet", context);
    }
    notifyListeners();
    return apiResponse;
  }

  Future<void> updateToken(BuildContext context) async {
    ApiResponse apiResponse = await authRepo.updateToken();
    if (apiResponse.response != null &&
        apiResponse.response!.statusCode == 200) {
    } else {
      ApiChecker.checkApi(context, apiResponse);
    }
  }

  void updateTermsAndCondition(bool value) {
    _isTermsAndCondition = value;
    notifyListeners();
  }

  toggleRememberMe() {
    _isActiveRememberMe = !_isActiveRememberMe;
    notifyListeners();
  }

  void setIndexForTabBar(int index, {bool isNotify = true}) {
    _selectionTabIndex = index;
    print('here is your current index =====>$_selectionTabIndex');
    if (isNotify) {
      notifyListeners();
    }
  }

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepo.saveUserNumberAndPassword(number, password);
  }

  String getUserEmail() {
    return authRepo.getUserEmail() ?? "";
  }

  String getUserPassword() {
    return authRepo.getUserPassword() ?? "";
  }

  Future<bool> clearUserEmailAndPassword() async {
    return authRepo.clearUserNumberAndPassword();
  }

  String getUserInfo() {
    return authRepo.getUserInfo();
  }

  String getUserToken() {
    return authRepo.getUserToken();
  }

  Future<bool> logOut()async {
     authRepo.clearUserSharedData();
     return isLoggedIn();
  }

  String _verificationCode = '';

  String get verificationCode => _verificationCode;
  bool _isEnableVerificationCode = false;

  bool get isEnableVerificationCode => _isEnableVerificationCode;
  String _verificationMsg = '';

  String get verificationMessage => _verificationMsg;
  String _email = '';
  String _phone = '';

  String get email => _email;

  String get phone => _phone;
  bool _isPhoneNumberVerificationButtonLoading = false;

  bool get isPhoneNumberVerificationButtonLoading =>
      _isPhoneNumberVerificationButtonLoading;

  updateVerificationCode(String query) {
    if (query.length == 4) {
      _isEnableVerificationCode = true;
    } else {
      _isEnableVerificationCode = false;
    }
    _verificationCode = query;
    notifyListeners();
  }

  String _countryDialCode = '+855';

  String get countryDialCode => _countryDialCode;

  void setCountryDialCode(String setValue) {
    _countryDialCode = setValue;
  }
}
