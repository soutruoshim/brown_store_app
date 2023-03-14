class MenuModelStatusRequest {
  String? devKid;
  String? function;
  String? storeappFunction;
  DatasenuModelStatusRequest? datas;

  MenuModelStatusRequest(
      {this.devKid, this.function, this.storeappFunction, this.datas});

  MenuModelStatusRequest.fromJson(Map<String, dynamic> json) {
    devKid = json['dev_kid'];
    function = json['function'];
    storeappFunction = json['storeapp_function'];
    datas = json['datas'] != null ? new DatasenuModelStatusRequest.fromJson(json['datas']) : null;
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

class DatasenuModelStatusRequest {
  String? func;
  String? storeid;
  String? zoneid;
  String? menuid;
  String? foodcode;
  String? status;
  String? dataEncryption;

  DatasenuModelStatusRequest(
      {this.func,
        this.storeid,
        this.zoneid,
        this.menuid,
        this.foodcode,
        this.status,
        this.dataEncryption});

  DatasenuModelStatusRequest.fromJson(Map<String, dynamic> json) {
    func = json['func'];
    storeid = json['storeid'];
    zoneid = json['zoneid'];
    menuid = json['menuid'];
    foodcode = json['foodcode'];
    status = json['status'];
    dataEncryption = json['data_encryption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['func'] = this.func;
    data['storeid'] = this.storeid;
    data['zoneid'] = this.zoneid;
    data['menuid'] = this.menuid;
    data['foodcode'] = this.foodcode;
    data['status'] = this.status;
    data['data_encryption'] = this.dataEncryption;
    return data;
  }
}