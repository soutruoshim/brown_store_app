class StoreModelRequest {
  String? devKid;
  String? function;
  String? storeappFunction;
  Datas? datas;

  StoreModelRequest(
      {this.devKid, this.function, this.storeappFunction, this.datas});

  StoreModelRequest.fromJson(Map<String, dynamic> json) {
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
  String? dataEncryption;
  String? func;

  Datas({this.dataEncryption, this.func});

  Datas.fromJson(Map<String, dynamic> json) {
    dataEncryption = json['data_encryption'];
    func = json['func'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_encryption'] = this.dataEncryption;
    data['func'] = this.func;
    return data;
  }
}