class MenuModelStatus {
  String? code;
  String? name;
  String? functionName;
  MenuStatus? result;
  String? greeting;
  String? description;

  MenuModelStatus(
      {this.code,
        this.name,
        this.functionName,
        this.result,
        this.greeting,
        this.description});

  MenuModelStatus.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    functionName = json['function_name'];
    result =
    json['result'] != null ? new MenuStatus.fromJson(json['result']) : null;
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

class MenuStatus {
  String? status;

  MenuStatus({this.status});

  MenuStatus.fromJson(Map<String, dynamic> json) {
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    return data;
  }
}