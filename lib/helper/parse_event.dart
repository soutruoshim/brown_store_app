import 'dart:convert';

import 'package:brown_store/helper/user_login_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../data/model/body/login_model_info.dart';
import '../provider/report_parse_provider.dart';

Future<void> onCreateOrder(BuildContext context, LiveQuery liveQuery, LoginModelInfo userModelInfo, int status) async {
  QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject('Orders'));

  Subscription subscription = await liveQuery.client.subscribe(query);

  subscription.on(LiveQueryEvent.create, (value) {
     Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, status, getLoginInfo(context).storeId!);
  });
}

Future<void> onUpdateOrder(BuildContext context, LiveQuery liveQuery, LoginModelInfo userModelInfo, int status) async {
  QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(ParseObject('Orders'));
  Subscription subscription = await liveQuery.client.subscribe(query);

  subscription.on(LiveQueryEvent.update, (value) {
    print(value);
    Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, status, getLoginInfo(context).storeId!);
  });
}