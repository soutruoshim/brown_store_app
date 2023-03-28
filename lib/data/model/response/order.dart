import 'dart:convert';

class Order {
  String? objectId;
  String? userId;
  List<Ordereditems>? ordereditems;
  Otherdetails? otherdetails;
  String? lastTry;
  String? refId;
  int? status;
  String? updateDate;
  String? deliveryId;
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
        this.orderNo = "100",
        this.createdAt,
        this.updatedAt});

  Order.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    userId = json['user_id'].toString();

    if (json['ordereditems'] != null &&  json['ordereditems']!="") {
      ordereditems = <Ordereditems>[];
      jsonDecode(json['ordereditems']).forEach((v) {
        ordereditems!.add(new Ordereditems.fromJson(v));
      });
    }

    otherdetails = json['otherdetails'] != null
        ? new Otherdetails.fromJson(jsonDecode(json['otherdetails']))
        : null;
    lastTry = json['lastTry'];
    refId = json['ref_id'].toString();
    status = json['status'];
    updateDate = json['updateDate'];
    deliveryId = json['delivery_id'];
    notifiCustomer = json['notifi_customer'];
    abaRefundStatus = json['aba_refund_status'];
    orderNo = json['order_no']??"100";
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
  String? foodname;
  String? sizecode;
  String? qty;
  bool? isfree;
  String? currency;
  String? price;
  List<String>? modifycode;
  List<Addon>? addon;

  Ordereditems(
      {this.id,
        this.foodcode,
        this.sizecode,
        this.foodname,
        this.qty,
        this.isfree,
        this.currency,
        this.price,
        this.modifycode,
        this.addon});

  Ordereditems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foodcode = json['foodcode']??"";
    foodname = json['foodname']??"";
    sizecode = json['sizecode'];
    qty = json['qty'];
    isfree = json['isfree'];
    currency = json['currency'];
    price = json['price'].toString();
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
    data['foodname'] = this.foodname;
    data['sizecode'] = this.sizecode;
    data['qty'] = this.qty;
    data['isfree'] = this.isfree;
    data['currency'] = this.currency;
    data['price'] = this.price;
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
  String? cardNumber;
  String? userName;
  String? userPhone;
  String? storeID;
  String? storeName;
  String? storePhone;
  String? addressType;
  String? address;
  String? zoneID;
  String? currency;
  String? subTotalItemFee;
  String? subTotalItemFeeAfterDis;
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
  String? paymentOpt;
  String? brownCardSpendBalance;
  String? brownCardSpendPoint;
  String? couponNumber;
  String? ulat;
  String? ulong;
  String? customer_status;

  Otherdetails(
      {this.checkOutDateTime,
        this.type,
        this.userID,
        this.cardNumber,
        this.userName,
        this.userPhone,
        this.storeID,
        this.storeName,
        this.storePhone,
        this.addressType,
        this.address,
        this.zoneID,
        this.currency,
        this.subTotalItemFee,
        this.subTotalItemFeeAfterDis,
        this.subTotalSpendPoint,
        this.totalDiscount,
        this.grandTotal,
        this.grandTotalSpendPoint,
        this.exchangeRate,
        this.vAT,
        this.cashBack,
        this.cashBackPoint,
        this.serviceCharge,
        this.estimatePickUp,
        this.paymentOpt,
        this.brownCardSpendBalance,
        this.brownCardSpendPoint,
        this.couponNumber,
        this.ulat,
        this.ulong,
        this.customer_status
      });

  Otherdetails.fromJson(Map<String, dynamic> json) {
    print("json from map ${json['Ulong']}");

    checkOutDateTime = json['CheckOut_DateTime'];
    type = json['Type'];
    userID = json['UserID'];
    cardNumber = json['CardNumber'];
    userName = json['UserName'];
    userPhone = json['UserPhone'];
    storeID = json['StoreID'];
    storeName = json['StoreName'];
    storePhone = json['StorePhone'];
    addressType = json['Address_Type'];
    address = json['Address'];
    zoneID = json['ZoneID'];
    currency = json['Currency'];
    subTotalItemFee = json['SubTotal_ItemFee'];
    subTotalItemFeeAfterDis = json['SubTotal_ItemFee_After_Dis'];
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
    paymentOpt = json['payment_opt'];
    brownCardSpendBalance = json['brownCardSpendBalance'].toString();
    brownCardSpendPoint = json['brownCardSpendPoint'];
    couponNumber = json['couponNumber'];
    ulat = json['Ulat'].toString();
    ulong = json['Ulong'].toString();
    customer_status = json['customer_status']==null? "": json['customer_status'].toString();


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CheckOut_DateTime'] = this.checkOutDateTime;
    data['Type'] = this.type;
    data['UserID'] = this.userID;
    data['CardNumber'] = this.cardNumber;
    data['UserName'] = this.userName;
    data['UserPhone'] = this.userPhone;
    data['StoreID'] = this.storeID;
    data['StoreName'] = this.storeName;
    data['StorePhone'] = this.storePhone;
    data['Address_Type'] = this.addressType;
    data['Address'] = this.address;
    data['ZoneID'] = this.zoneID;
    data['Currency'] = this.currency;
    data['SubTotal_ItemFee'] = this.subTotalItemFee;
    data['SubTotal_ItemFee_After_Dis'] = this.subTotalItemFeeAfterDis;
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
    data['payment_opt'] = this.paymentOpt;
    data['brownCardSpendBalance'] = this.brownCardSpendBalance;
    data['brownCardSpendPoint'] = this.brownCardSpendPoint;
    data['couponNumber'] = this.couponNumber;
    data['Ulat'] = this.ulat;
    data['Ulong'] = this.ulong;
    data['customer_status'] = this.customer_status;
    return data;
  }
}