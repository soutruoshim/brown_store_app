class LoginModelInfo {
  String? userId;
  String? storeId;
  String? storeName;

  LoginModelInfo({this.userId, this.storeId, this.storeName});

  LoginModelInfo.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    storeId = json['store_id'];
    storeName = json['store_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['store_id'] = this.storeId;
    data['store_name'] = this.storeName;
    return data;
  }
}