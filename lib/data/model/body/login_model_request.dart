class LoginModelRequest {
  String? devKid;
  String? function;
  String? storeappFunction;
  Datas? datas;

  LoginModelRequest(
      {this.devKid, this.function, this.storeappFunction, this.datas});

  LoginModelRequest.fromJson(Map<String, dynamic> json) {
    devKid = json['dev_kid'];
    function = json['function'];
    storeappFunction = json['storeapp_function'];
    datas = json['datas'] != null ? new Datas.fromJson(json['datas']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dev_kid'] = this.devKid;
    data['function'] = this.function;
    data['storeapp_function'] = this.storeappFunction;
    if (this.datas != null) {
      data['datas'] = this.datas!.toJson();
    }
    return data;
  }
}

class Datas {
  String? username;
  String? userpassword;
  String? storeid;
  String? dataEncryption;

  Datas({this.username, this.userpassword, this.storeid, this.dataEncryption});

  Datas.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    userpassword = json['userpassword'];
    storeid = json['storeid'];
    dataEncryption = json['data_encryption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['userpassword'] = this.userpassword;
    data['storeid'] = this.storeid;
    data['data_encryption'] = this.dataEncryption;
    return data;
  }
}