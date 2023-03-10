import '../../../core/services/device_info_service.dart';
import '../../../helper/security_helper.dart';

class LoginRequestModel {
  String? devKid;
  String? function;
  String? accountFunction;
  Datas? datas;

  LoginRequestModel({this.devKid, this.function, this.accountFunction, this.datas});

  LoginRequestModel.create({required String phoneEmail, required String password}) {
    devKid = "dev";
    function = "Account";
    accountFunction = "user_login";

    datas = Datas(
      phoneId: DeviceInfoService().id,
      phoneOsType: DeviceInfoService().os,
      phoneBrand: DeviceInfoService().info,
      phoneModel: DeviceInfoService().name,
      dataEncryption: SecurityHelper.getDataEncryptionKey(
        dataTypes: [
          "${DeviceInfoService().id + DeviceInfoService().os + DeviceInfoService().info + DeviceInfoService().name + phoneEmail}LOGIN_ACCOUNT",
        ],
      ),
      phoneEmail: phoneEmail,
      password: password,
    );
  }

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    devKid = json['dev_kid'];
    function = json['function'];
    accountFunction = json['account_function'];
    datas = json['datas'] != null ? Datas.fromJson(json['datas']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['dev_kid'] = devKid;
    data['function'] = function;
    data['account_function'] = accountFunction;
    if (datas != null) {
      data['datas'] = datas!.toJson();
    }
    return data;
  }
}

class Datas {
  String? phoneId;
  String? phoneOsType;
  String? phoneBrand;
  String? phoneModel;
  String? dataEncryption;
  String? phoneEmail;
  String? password;

  Datas({this.phoneId, this.phoneOsType, this.phoneBrand, this.phoneModel, this.dataEncryption, this.phoneEmail, this.password});

  Datas.fromJson(Map<String, dynamic> json) {
    phoneId = json['phone_id'];
    phoneOsType = json['phone_os_type'];
    phoneBrand = json['phone_brand'];
    phoneModel = json['phone_model'];
    dataEncryption = json['data_encryption'];
    phoneEmail = json['phone_email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['phone_id'] = phoneId;
    data['phone_os_type'] = phoneOsType;
    data['phone_brand'] = phoneBrand;
    data['phone_model'] = phoneModel;
    data['data_encryption'] = dataEncryption;
    data['phone_email'] = phoneEmail;
    data['password'] = password;
    return data;
  }
}
