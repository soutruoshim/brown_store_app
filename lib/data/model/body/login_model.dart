class LoginModel {
  late String account;
  late String password;
  late String store;

  LoginModel({required this.account, required this.password, required this.store});

  LoginModel.fromJson(Map<String, dynamic> json) {
    account = json['account'];
    password = json['password'];
    store = json['store'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['account'] = this.account;
    data['password'] = this.password;
    data['store'] = this.store;

    return data;
  }
}
