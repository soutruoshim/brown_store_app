import 'package:brown_store/data/repository/parse_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ParseProvider with ChangeNotifier {
  final ParseRepo parseRepo;

  int _orderTypeIndex = 0;
  int get orderTypeIndex => _orderTypeIndex;

  ParseProvider({required this.parseRepo});

  late QueryBuilder<ParseObject>? _queryBuilderAll;
  QueryBuilder<ParseObject> get getQueryAll => _queryBuilderAll!;


  late QueryBuilder<ParseObject>? _queryBuilderPending;
  QueryBuilder<ParseObject> get getQueryPending => _queryBuilderPending!;

  late QueryBuilder<ParseObject>? _queryBuilderRequestCancel;
  QueryBuilder<ParseObject> get queryBuilderRequestCancel => _queryBuilderRequestCancel!;


  Future<void> getOrderListAll(BuildContext context, int orderStatus) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        _queryBuilderAll = await QueryBuilder<ParseObject>(ParseObject('Orders'))
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
          ..whereEqualTo("status", orderStatus)
          //..whereEqualTo("lastTry", "2023-01-18 16:57:11")
          ..orderByDescending("createdAt");
        //_queryBuilderPending!.query();
        print("query order pending status");
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
          ..whereEqualTo("store_id", 820161780837506400)
          ..whereEqualTo('status', -1)
          ..orderByDescending("createdAt");
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
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

}