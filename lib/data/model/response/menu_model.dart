class MenuModel {
  String? code;
  String? name;
  String? functionName;
  List<Menu>? result;
  String? greeting;
  String? description;

  MenuModel(
      {this.code,
        this.name,
        this.functionName,
        this.result,
        this.greeting,
        this.description});

  MenuModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    functionName = json['function_name'];
    if (json['result'] != null) {
      result = <Menu>[];
      json['result'].forEach((v) {
        result!.add(new Menu.fromJson(v));
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

class Menu {
  String? menuName;
  String? idMenu;
  String? status;
  String? menuPicture;
  String? linkedCode;
  String? zoneid;

  Menu(
      {this.menuName,
        this.idMenu,
        this.status,
        this.menuPicture,
        this.linkedCode,
        this.zoneid});

  Menu.fromJson(Map<String, dynamic> json) {
    menuName = json['menu_name'];
    idMenu = json['id_menu'];
    status = json['status'];
    menuPicture = json['menu_picture'];
    linkedCode = json['linked_code'];
    zoneid = json['zoneid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menu_name'] = this.menuName;
    data['id_menu'] = this.idMenu;
    data['status'] = this.status;
    data['menu_picture'] = this.menuPicture;
    data['linked_code'] = this.linkedCode;
    data['zoneid'] = this.zoneid;
    return data;
  }
}