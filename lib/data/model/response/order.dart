class Order {
  String? objectId;
  String? userId;
  List<Ordereditems>? ordereditems;
  Otherdetails? otherdetails;
  String? lastTry;
  String? refId;
  int? status;
  String? updateDate;
  int? deliveryId;
  String? notifiCustomer;
  int? abaRefundStatus;
  String? orderNo;
  String? createdAt;
  String? updatedAt;

  Order(
      {this.objectId,
        this.userId,
        this.ordereditems,
        this.otherdetails,
        this.lastTry,
        this.refId,
        this.status,
        this.updateDate,
        this.deliveryId,
        this.notifiCustomer,
        this.abaRefundStatus,
        this.orderNo,
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    userId = json['user_id'].toString();
    if (json['ordereditems'] != null) {
      ordereditems = <Ordereditems>[];
      json['ordereditems'].forEach((v) {
        ordereditems!.add(new Ordereditems.fromJson(v));
      });
    }
    otherdetails = json['otherdetails'] != null
        ? new Otherdetails.fromJson(json['otherdetails'])
        : null;
    lastTry = json['lastTry'];
    refId = json['ref_id'].toString();
    status = json['status'];
    updateDate = json['updateDate'];
    deliveryId = json['delivery_id'];
    notifiCustomer = json['notifi_customer'];
    abaRefundStatus = json['aba_refund_status'];
    orderNo = json['order_no'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectId'] = this.objectId;
    data['user_id'] = this.userId;
    if (this.ordereditems != null) {
      data['ordereditems'] = this.ordereditems!.map((v) => v.toJson()).toList();
    }
    if (this.otherdetails != null) {
      data['otherdetails'] = this.otherdetails!.toJson();
    }
    data['lastTry'] = this.lastTry;
    data['ref_id'] = this.refId;
    data['status'] = this.status;
    data['updateDate'] = this.updateDate;
    data['delivery_id'] = this.deliveryId;
    data['notifi_customer'] = this.notifiCustomer;
    data['aba_refund_status'] = this.abaRefundStatus;
    data['order_no'] = this.orderNo;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Ordereditems {
  String? id;
  String? foodcode;
  String? sizecode;
  String? qty;
  bool? isfree;
  String? currency;
  List<String>? modifycode;
  List<Addon>? addon;

  Ordereditems(
      {this.id,
        this.foodcode,
        this.sizecode,
        this.qty,
        this.isfree,
        this.currency,
        this.modifycode,
        this.addon});

  Ordereditems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodcode = json['foodcode'];
    sizecode = json['sizecode'];
    qty = json['qty'];
    isfree = json['isfree'];
    currency = json['currency'];
    modifycode = json['modifycode'].cast<String>();
    if (json['addon'] != null) {
      addon = <Addon>[];
      json['addon'].forEach((v) {
        addon!.add(new Addon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foodcode'] = this.foodcode;
    data['sizecode'] = this.sizecode;
    data['qty'] = this.qty;
    data['isfree'] = this.isfree;
    data['currency'] = this.currency;
    data['modifycode'] = this.modifycode;
    if (this.addon != null) {
      data['addon'] = this.addon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Addon {
  String? addoncode;
  String? qty;
  bool? isfree;

  Addon({this.addoncode, this.qty, this.isfree});

  Addon.fromJson(Map<String, dynamic> json) {
    addoncode = json['addoncode'];
    qty = json['qty'];
    isfree = json['isfree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['addoncode'] = this.addoncode;
    data['qty'] = this.qty;
    data['isfree'] = this.isfree;
    return data;
  }
}

class Otherdetails {
  String? checkOutDateTime;
  String? type;
  String? userID;
  String? storeName;
  String? address;
  String? zoneID;
  String? currency;
  String? subTotalItemFee;
  String? subTotalSpendPoint;
  String? totalDiscount;
  String? grandTotal;
  String? grandTotalSpendPoint;
  String? exchangeRate;
  String? vAT;
  String? cashBack;
  String? cashBackPoint;
  String? serviceCharge;
  String? estimatePickUp;

  Otherdetails(
      {this.checkOutDateTime,
        this.type,
        this.userID,
        this.storeName,
        this.address,
        this.zoneID,
        this.currency,
        this.subTotalItemFee,
        this.subTotalSpendPoint,
        this.totalDiscount,
        this.grandTotal,
        this.grandTotalSpendPoint,
        this.exchangeRate,
        this.vAT,
        this.cashBack,
        this.cashBackPoint,
        this.serviceCharge,
        this.estimatePickUp});

  Otherdetails.fromJson(Map<String, dynamic> json) {
    checkOutDateTime = json['CheckOut_DateTime'];
    type = json['Type'];
    userID = json['UserID'];
    storeName = json['StoreName'];
    address = json['Address'];
    zoneID = json['ZoneID'];
    currency = json['Currency'];
    subTotalItemFee = json['SubTotal_ItemFee'];
    subTotalSpendPoint = json['SubTotal_SpendPoint'];
    totalDiscount = json['Total_Discount'];
    grandTotal = json['GrandTotal'];
    grandTotalSpendPoint = json['GrandTotal_SpendPoint'];
    exchangeRate = json['ExchangeRate'];
    vAT = json['VAT'];
    cashBack = json['CashBack'];
    cashBackPoint = json['CashBack_Point'];
    serviceCharge = json['Service_Charge'];
    estimatePickUp = json['EstimatePickUp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CheckOut_DateTime'] = this.checkOutDateTime;
    data['Type'] = this.type;
    data['UserID'] = this.userID;
    data['StoreName'] = this.storeName;
    data['Address'] = this.address;
    data['ZoneID'] = this.zoneID;
    data['Currency'] = this.currency;
    data['SubTotal_ItemFee'] = this.subTotalItemFee;
    data['SubTotal_SpendPoint'] = this.subTotalSpendPoint;
    data['Total_Discount'] = this.totalDiscount;
    data['GrandTotal'] = this.grandTotal;
    data['GrandTotal_SpendPoint'] = this.grandTotalSpendPoint;
    data['ExchangeRate'] = this.exchangeRate;
    data['VAT'] = this.vAT;
    data['CashBack'] = this.cashBack;
    data['CashBack_Point'] = this.cashBackPoint;
    data['Service_Charge'] = this.serviceCharge;
    data['EstimatePickUp'] = this.estimatePickUp;
    return data;
  }
}