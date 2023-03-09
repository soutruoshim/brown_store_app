import 'package:brown_store/data/repository/parse_repo.dart';
import 'package:brown_store/helper/status_check.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../utill/images.dart';
import '../view/base/confirmation_dialog.dart';
import '../view/base/custom_snackbar.dart';

class ParseProvider with ChangeNotifier {
  final ParseRepo parseRepo;

  int _orderTypeIndex = 0;
  int get orderTypeIndex => _orderTypeIndex;

  ParseProvider({required this.parseRepo});

  late QueryBuilder<ParseObject>? _queryBuilderAll;
  QueryBuilder<ParseObject> get getQueryAll => _queryBuilderAll!;


  late QueryBuilder<ParseObject>? _queryBuilderPending;
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


  Future<void> getOrderListAll(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderAll = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", "820161780837506397")
          ..orderByDescending("createdAt");
        //_queryBuilderAll!.query();
        print("query order all status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
       print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListPending(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderPending = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          //..whereEqualTo("store_id", "820161780837506397")
          ..whereEqualTo("status", orderStatus);
          //..whereContains("lastTry", getFormatedDate(DateTime.now()))
          //..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order pending status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListAccepted(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderAccepted = await QueryBuilder<ParseObject>(ParseObject('Orders'))
         // ..whereEqualTo("store_id", "820161780837506397")
          ..whereEqualTo("status", orderStatus)
        //..whereEqualTo("lastTry", "2023-01-18 16:57:11")
          ..orderByDescending("updatedAt");
        //_queryBuilderPending!.query();
        print("query order accepted status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListFinishCooking(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderFinishCooking = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", "820161780837506397")
          ..whereEqualTo("status", orderStatus)
        //..whereEqualTo("lastTry", "2023-01-18 16:57:11")
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order accepted status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListPickup(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderPickup = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", "820161780837506397")
          ..whereEqualTo("status", orderStatus)
        //..whereEqualTo("lastTry", "2023-01-18 16:57:11")
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order accepted status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListDone(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderDone = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", "820161780837506397")
          ..whereEqualTo("status", orderStatus)
        //..whereEqualTo("lastTry", "2023-01-18 16:57:11")
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order done status");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }


  Future<void> getOrderListRequestCancel(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderRequestCancel = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          //..whereEqualTo("store_id", "820161780837506397")
          ..whereEqualTo('status', -1)
          ..orderByDescending("createdAt");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> getOrderListCancel(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderCancel = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          //..whereEqualTo("store_id", "820161780837506397")
          ..whereEqualTo('status', -2)
          ..orderByDescending("createdAt");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<void> updateOrder(BuildContext context, String id, int status) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmationDialog(icon: Images.deny_w,
            title : "Do you want to update this order to ${StatusCheck.statusText(status)} ?",
            onYesPressed: () async {
              var order = ParseObject('Orders')
                ..objectId = id
                ..set('status', status);
              await order.save();
              Navigator.pop(context);
              showCustomSnackBar("Your order updated to ${StatusCheck.statusText(status)}', Thank you",context,isToaster: true, isError: false);
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
      getOrderListAll(context, 0);
    }else if(_orderTypeIndex == 1){
      _orderType = 'pending';
      getOrderListPending(context, 1);
    }else if(_orderTypeIndex == 2){
      _orderType = 'confirmed';
      getOrderListAll(context, 2);
    }else if(_orderTypeIndex == 3){
      _orderType = 'processing';
      getOrderListAll(context, 3);
    }else if(_orderTypeIndex == 4){
      _orderType = 'delivered';
      getOrderListAll(context, 4);
    }else if(_orderTypeIndex == 5){
      _orderType = 'return';
      getOrderListAll(context, 5);
    }else if(_orderTypeIndex == 6){
      _orderType = 'out_for_delivery';
      getOrderListAll(context, 6);
    }
    if(notify){
      notifyListeners();
    }
    notifyListeners();
  }

  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date.toString());
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(inputDate);
  }
}