class ServiceModel {
  String? code;
  String? name;
  String? functionName;
  Result? result;
  String? greeting;
  String? description;

  ServiceModel(
      {this.code,
        this.name,
        this.functionName,
        this.result,
        this.greeting,
        this.description});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    functionName = json['function_name'];
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
    greeting = json['greeting'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['function_name'] = this.functionName;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    data['greeting'] = this.greeting;
    data['description'] = this.description;
    return data;
  }
}

class Result {
  String? idoutlet;
  String? zoneId;
  String? name;
  String? status;
  String? delivery;
  String? pickup;
  String? dinein;

  Result(
      {this.idoutlet,
        this.zoneId,
        this.name,
        this.status,
        this.delivery,
        this.pickup,
        this.dinein});

  Result.fromJson(Map<String, dynamic> json) {
    idoutlet = json['idoutlet'];
    zoneId = json['zone_id'];
    name = json['name'];
    status = json['status'];
    delivery = json['delivery'];
    pickup = json['pickup'];
    dinein = json['dinein'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idoutlet'] = this.idoutlet;
    data['zone_id'] = this.zoneId;
    data['name'] = this.name;
    data['status'] = this.status;
    data['delivery'] = this.delivery;
    data['pickup'] = this.pickup;
    data['dinein'] = this.dinein;
    return data;
  }
}