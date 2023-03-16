import 'package:brown_store/data/repository/parse_repo.dart';
import 'package:brown_store/helper/status_check.dart';
import 'package:brown_store/helper/user_login_info.dart';
import 'package:brown_store/provider/report_parse_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../helper/api_checker.dart';
import '../helper/parse_event.dart';
import '../utill/images.dart';
import '../view/base/confirmation_dialog.dart';
import '../view/base/custom_snackbar.dart';

class ParseProvider with ChangeNotifier {
  final ParseRepo parseRepo;

  bool isLoading = false;

  int _orderTypeIndex = 0;
  int get orderTypeIndex => _orderTypeIndex;

  ParseProvider({required this.parseRepo});

  late QueryBuilder<ParseObject>? _queryBuilderAll;
  QueryBuilder<ParseObject> get getQueryAll => _queryBuilderAll!;


  late QueryBuilder<ParseObject>? _queryBuilderPending = null;
  QueryBuilder<ParseObject> get getQueryPending => _queryBuilderPending!;

  late QueryBuilder<ParseObject>? _queryBuilderAccepted;
  QueryBuilder<ParseObject> get getQueryBuilderAccepted => _queryBuilderAccepted!;

  late QueryBuilder<ParseObject>? _queryBuilderFinishCooking;
  QueryBuilder<ParseObject> get getQueryBuilderFinishCooking => _queryBuilderFinishCooking!;

  late QueryBuilder<ParseObject>? _queryBuilderRequestCancel;
  QueryBuilder<ParseObject> get queryBuilderRequestCancel => _queryBuilderRequestCancel!;

  late QueryBuilder<ParseObject>? _queryBuilderPickup;
  QueryBuilder<ParseObject> get getQueryBuilderPickup => _queryBuilderPickup!;

  late QueryBuilder<ParseObject>? _queryBuilderDone;
  QueryBuilder<ParseObject> get getQueryBuilderDone => _queryBuilderDone!;

  late QueryBuilder<ParseObject>? _queryBuilderCancel;
  QueryBuilder<ParseObject> get getQueryBuilderCancel => _queryBuilderCancel!;


  Future<void> getOrderListAll(BuildContext context, int orderStatus, String store_id) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderAll = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()))
          ..orderByDescending("createdAt");
        //_queryBuilderAll!.query();
        print("query order all status");

        notifyListeners();
      }
    }).catchError((dynamic _) {
       print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListPending(BuildContext context, int orderStatus, String store_id) async {
    isLoading = true;
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderPending = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()))
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order pending status");
        isLoading = false;
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListAccepted(BuildContext context, int orderStatus, String store_id) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderAccepted = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()))
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order accepted status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListFinishCooking(BuildContext context, int orderStatus, String store_id) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderFinishCooking = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()))
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order accepted status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListPickup(BuildContext context, int orderStatus, String store_id) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderPickup = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()))
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order accepted status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListDone(BuildContext context, int orderStatus, String store_id) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderDone = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()))
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();

        print("query order done status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }


  Future<void> getOrderListRequestCancel(BuildContext context, int orderStatus, String store_id) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderRequestCancel = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()))
          ..orderByDescending("createdAt");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListCancel(BuildContext context, int orderStatus, String store_id) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderCancel = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()))
          ..orderByDescending("createdAt");
        notifyListeners();

      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> liveQueryBooking(BuildContext context) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        final LiveQuery liveQuery = LiveQuery();
        onCreateOrder(context, liveQuery,
            getLoginInfo(context), 1);
        onUpdateOrder(context, liveQuery,
            getLoginInfo(context), -1);
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> updateOrder(BuildContext context, String id, int status) async {
    ProgressDialog pd = ProgressDialog(context: context);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(icon: Images.deny_w,
            title : "Do you want to update this order to ${StatusCheck.statusText(status)} ?",
            onYesPressed: () async {

              pd.show(max: 100, msg: 'Please waiting...server in working. Thank you!');

              var order = ParseObject('Orders')
                ..objectId = id
                ..set('status', status);
              await order.save();



              var store_id = getLoginInfo(context).storeId!;

              if(store_id != null){
                 if(status == 5){
                  Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, 3,store_id );
                 }else{
                   Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, status - 1,store_id );
                 }
                 Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, status,store_id );
              }

              pd.close();

              Navigator.pop(context);

              showCustomSnackBar("Your order updated to ${StatusCheck.statusText(status)}, Thank you",context,isToaster: true, isError: false);
            }, description: 'The order status will be update to ${StatusCheck.statusText(status)}',

        );
      },
    );
  }


  String _orderType = 'all';
  String get orderType => _orderType;

  void setIndex(BuildContext context, int index, {bool notify = true}) {
    //_queryBuilder.queries.clear();
    _orderTypeIndex = index;

    if(_orderTypeIndex == 0){
      _orderType = 'all';
      //getOrderListAll(context, 0);
    }else if(_orderTypeIndex == 1){
      _orderType = 'pending';
      //getOrderListPending(context, 1);
    }else if(_orderTypeIndex == 2){
      _orderType = 'confirmed';
      //getOrderListAll(context, 2);
    }else if(_orderTypeIndex == 3){
      _orderType = 'processing';
      //getOrderListAll(context, 3);
    }else if(_orderTypeIndex == 4){
      _orderType = 'delivered';
      //getOrderListAll(context, 4);
    }else if(_orderTypeIndex == 5){
      _orderType = 'return';
      //getOrderListAll(context, 5);
    }else if(_orderTypeIndex == 6){
      _orderType = 'out_for_delivery';
      //getOrderListAll(context, 6);
    }
    if(notify){
      notifyListeners();
    }
    notifyListeners();
  }
}