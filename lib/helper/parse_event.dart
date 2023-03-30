import 'dart:convert';

import 'package:brown_store/helper/user_login_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../data/model/body/login_model_info.dart';
import '../notification/my_notification.dart';
import '../provider/report_parse_provider.dart';

Future<void> onCreateOrder(BuildContext context, LiveQuery liveQuery,
    LoginModelInfo userModelInfo, int status) async {
  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject('Orders'))
        ..whereEqualTo("store_id", userModelInfo.storeId);

  Subscription subscription = await liveQuery.client.subscribe(query);

  subscription.on(LiveQueryEvent.create, (value) {
    Provider.of<ReportParseProvider>(context, listen: false)
        .getReportOrderTotal(context, status, getLoginInfo(context).storeId!);
    //showInboxNotification();
    print("**********************");
    showNotificationCustomSound("New order", "Have new order confirm.");
    //showNotification();
    //showNotificationCustomSound2();
  });
}

Future<void> onUpdateOrder(BuildContext context, LiveQuery liveQuery,
    LoginModelInfo userModelInfo, int status) async {
  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject('Orders'))
        ..whereEqualTo("store_id", userModelInfo.storeId);
  Subscription subscription = await liveQuery.client.subscribe(query);

  subscription.on(LiveQueryEvent.update, (value) {
    if (value["status"] == -1) {
      //showInboxNotification();
      showNotificationCustomSound(
          "New request cancel order", "Have new cancel order.");
    }
    Provider.of<ReportParseProvider>(context, listen: false)
        .getReportOrderTotal(context, 1, getLoginInfo(context).storeId!);
    Provider.of<ReportParseProvider>(context, listen: false)
        .getReportOrderTotal(context, 2, getLoginInfo(context).storeId!);
    Provider.of<ReportParseProvider>(context, listen: false)
        .getReportOrderTotal(context, 3, getLoginInfo(context).storeId!);
    Provider.of<ReportParseProvider>(context, listen: false)
        .getReportOrderTotal(context, 4, getLoginInfo(context).storeId!);
    Provider.of<ReportParseProvider>(context, listen: false)
        .getReportOrderTotal(context, -2, getLoginInfo(context).storeId!);
    Provider.of<ReportParseProvider>(context, listen: false)
        .getReportOrderTotal(context, status, getLoginInfo(context).storeId!);
  });
}
