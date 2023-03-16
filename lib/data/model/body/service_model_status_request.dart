class ServiceModelStatusRequest {
  String? devKid;
  String? function;
  String? storeappFunction;
  DatasServiceUpdateRequest? datas;

  ServiceModelStatusRequest(
      {this.devKid, this.function, this.storeappFunction, this.datas});

  ServiceModelStatusRequest.fromJson(Map<String, dynamic> json) {
    devKid = json['dev_kid'];
    function = json['function'];
    storeappFunction = json['storeapp_function'];
    datas = json['datas'] != null ? new DatasServiceUpdateRequest.fromJson(json['datas']) : null;
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

class DatasServiceUpdateRequest {
  String? func;
  String? status;
  String? storeId;
  String? dataEncryption;
  String? serviceName;

  DatasServiceUpdateRequest(
      {this.func,
        this.status,
        this.storeId,
        this.dataEncryption,
        this.serviceName});

  DatasServiceUpdateRequest.fromJson(Map<String, dynamic> json) {
    func = json['func'];
    status = json['status'];
    storeId = json['store_id'];
    dataEncryption = json['data_encryption'];
    serviceName = json['service_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['func'] = this.func;
    data['status'] = this.status;
    data['store_id'] = this.storeId;
    data['data_encryption'] = this.dataEncryption;
    data['service_name'] = this.serviceName;
    return data;
  }
}