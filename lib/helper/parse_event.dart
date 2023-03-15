import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../data/model/body/login_model_info.dart';
import '../provider/auth_provider.dart';
import '../provider/report_parse_provider.dart';

Future<void> onCreateOrder(BuildContext context, LiveQuery liveQuery, LoginModelInfo userModelInfo, int status) async {
  QueryBuilder<ParseObject> query =
  QueryBuilder<ParseObject>(ParseObject('Orders'));

  final String userInfo = await Provider.of<AuthProvider>(context,listen: false).getUserInfo();
  Map<String, dynamic> jsonUserInfo = jsonDecode(userInfo);
  var userModelInfo = LoginModelInfo.fromJson(jsonUserInfo);

  Subscription subscription = await liveQuery.client.subscribe(query);

  subscription.on(LiveQueryEvent.create, (value) {
    Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, status, userModelInfo.storeId!);
  });
}

Future<void> onUpdateOrder(BuildContext context, LiveQuery liveQuery, LoginModelInfo userModelInfo, int status) async {
  QueryBuilder<ParseObject> query =
  QueryBuilder<ParseObject>(ParseObject('Orders'));

  final String userInfo = await Provider.of<AuthProvider>(context,listen: false).getUserInfo();
  Map<String, dynamic> jsonUserInfo = jsonDecode(userInfo);
  var userModelInfo = LoginModelInfo.fromJson(jsonUserInfo);

  Subscription subscription = await liveQuery.client.subscribe(query);
  subscription.on(LiveQueryEvent.update, (value) {
    Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, status, userModelInfo.storeId!);
  });
}