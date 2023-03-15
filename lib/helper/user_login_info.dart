import 'dart:convert';

import 'package:brown_store/data/model/body/login_model_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';

LoginModelInfo getLoginInfo(BuildContext context){
  final String userInfo = Provider.of<AuthProvider>(context,listen: false).getUserInfo();
  Map<String, dynamic> jsonUserInfo = jsonDecode(userInfo);
  var userModelInfo = LoginModelInfo.fromJson(jsonUserInfo);
  return userModelInfo;
}