class OrderStatusRequest {
  String? devKid;
  String? function;
  String? storeappFunction;
  DatasOrderStatusRequest? datas;

  OrderStatusRequest(
      {this.devKid, this.function, this.storeappFunction, this.datas});

  OrderStatusRequest.fromJson(Map<String, dynamic> json) {
    devKid = json['dev_kid'];
    function = json['function'];
    storeappFunction = json['storeapp_function'];
    datas = json['datas'] != null ? new DatasOrderStatusRequest.fromJson(json['datas']) : null;
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

class DatasOrderStatusRequest {
  String? referenceId;
  String? status;
  String returnPaymentType="";
  String? dataEncryption;

  DatasOrderStatusRequest(
      {this.referenceId,
        this.status,
        this.returnPaymentType="",
        this.dataEncryption});

  DatasOrderStatusRequest.fromJson(Map<String, dynamic> json) {
    referenceId = json['reference_id'];
    status = json['status'];
    returnPaymentType = json['return_payment_type'];
    dataEncryption = json['data_encryption'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference_id'] = this.referenceId;
    data['status'] = this.status;
    data['return_payment_type'] = this.returnPaymentType;
    data['data_encryption'] = this.dataEncryption;
    return data;
  }
}



// class DatasOrderStatusRequest {
//   String? referenceId;
//   String? status;
//   String? dataEncryption;
//
//   DatasOrderStatusRequest({this.referenceId, this.status, this.dataEncryption});
//
//   DatasOrderStatusRequest.fromJson(Map<String, dynamic> json) {
//     referenceId = json['reference_id'];
//     status = json['status'];
//     dataEncryption = json['data_encryption'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['reference_id'] = this.referenceId;
//     data['status'] = this.status;
//     data['data_encryption'] = this.dataEncryption;
//     return data;
//   }
// }