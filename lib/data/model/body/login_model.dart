class LoginModel {
  String? devKid;
  String? username;
  String? userId;
  String? password;
  String? storeId;
  String? dataEnc;

  LoginModel(
      {this.devKid,
        this.username,
        this.userId,
        this.password,
        this.storeId,
        this.dataEnc});

  LoginModel.fromJson(Map<String, dynamic> json) {
    devKid = json['dev_kid'];
    username = json['username'];
    userId = json['user_id'];
    password = json['password'];
    storeId = json['store_id'];
    dataEnc = json['data_enc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dev_kid'] = this.devKid;
    data['username'] = this.username;
    data['user_id'] = this.userId;
    data['password'] = this.password;
    data['store_id'] = this.storeId;
    data['data_enc'] = this.dataEnc;
    return data;
  }
}

// class LoginModel {
//   late String account;
//   late String password;
//   late String store;
//
//   LoginModel({required this.account, required this.password, required this.store});
//
//   LoginModel.fromJson(Map<String, dynamic> json) {
//     account = json['account'];
//     password = json['password'];
//     store = json['store'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['account'] = this.account;
//     data['password'] = this.password;
//     data['store'] = this.store;
//
//     return data;
//   }
// }
