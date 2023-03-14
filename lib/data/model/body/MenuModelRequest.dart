class MenuModelRequest {
  String? devKid;
  String? function;
  String? storeappFunction;
  DatasMenuRequest? datas;

  MenuModelRequest(
      {this.devKid, this.function, this.storeappFunction, this.datas});

  MenuModelRequest.fromJson(Map<String, dynamic> json) {
    devKid = json['dev_kid'];
    function = json['function'];
    storeappFunction = json['storeapp_function'];
    datas = json['datas'] != null ? new DatasMenuRequest.fromJson(json['datas']) : null;
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

class DatasMenuRequest {
  String? func;
  String? storeid;
  String? dataEncryption;

  DatasMenuRequest({this.func, this.storeid, this.dataEncryption});

  DatasMenuRequest.fromJson(Map<String, dynamic> json) {
    func = json['func'];
    storeid = json['storeid'];
    dataEncryption = json['data_encryption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['func'] = this.func;
    data['storeid'] = this.storeid;
    data['data_encryption'] = this.dataEncryption;
    return data;
  }
}