class OrderStatus {
  String? code;
  String? name;
  String? functionName;
  String? result;
  String? greeting;
  String? description;

  OrderStatus(
      {this.code,
        this.name,
        this.functionName,
        this.result,
        this.greeting,
        this.description});

  OrderStatus.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    functionName = json['function_name'];
    result = json['result'];
    greeting = json['greeting'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['function_name'] = this.functionName;
    data['result'] = this.result;
    data['greeting'] = this.greeting;
    data['description'] = this.description;
    return data;
  }
}