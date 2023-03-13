
class StoreModel {
  String? code;
  String? name;
  String? functionName;
  List<Store>? result;
  String? greeting;
  String? description;

  StoreModel(
      {this.code,
        this.name,
        this.functionName,
        this.result,
        this.greeting,
        this.description});

  StoreModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    functionName = json['function_name'];
    if (json['result'] != null) {
      result = <Store>[];
      json['result'].forEach((v) {
        result!.add(new Store.fromJson(v));
      });
    }
    greeting = json['greeting'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['function_name'] = this.functionName;
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    data['greeting'] = this.greeting;
    data['description'] = this.description;
    return data;
  }
}

class Store {
  String? storeId;
  String? name;
  String? zoneId;

  Store({this.storeId, this.name, this.zoneId});

  Store.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    name = json['name'];
    zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['name'] = this.name;
    data['zone_id'] = this.zoneId;
    return data;
  }
}