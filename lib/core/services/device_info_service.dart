import 'dart:io';

import 'package:device_info/device_info.dart';

class DeviceInfoService {
  static final DeviceInfoService _instance = DeviceInfoService._();

  late DeviceInfoPlugin deviceInfoPlugin;
  late String id;
  late String os;
  late String name;
  late String info;
  late String brand;
  late String version;

  DeviceInfoService._() {
    deviceInfoPlugin = DeviceInfoPlugin();
  }

  factory DeviceInfoService() {
    return _instance;
  }

  init() async {
    if (Platform.isAndroid) {

      var device = await deviceInfoPlugin.androidInfo;
      print(device.id);
      id = device.id;
      name = device.model;
      os = "Android";
      info = device.manufacturer;
      brand = device.brand;
    } else if (Platform.isIOS) {
      var device = await deviceInfoPlugin.iosInfo;
      id = device.identifierForVendor;
      name = device.name;
      os = device.systemName;
      info = device.systemVersion;
      brand = "Apple";
    }
  }

  isHuaweiDevice() {
    return brand == 'HUAWEI';
  }
}
