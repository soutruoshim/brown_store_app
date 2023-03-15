import 'package:brown_store/data/repository/parse_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../helper/api_checker.dart';

class ReportParseProvider with ChangeNotifier {
  final ParseRepo parseRepo;

  ReportParseProvider({required this.parseRepo});

  int _totalPending = 0;
  int get getTotalPending => _totalPending;

  int _totalConfirm = 0;
  int get getTotalConfirm => _totalConfirm;


  int _totalFinishCooking = 0;
  int get getTotalFinishCooking=> _totalFinishCooking;

  int _totalPickup = 0;
  int get getTotalPickup=> _totalPickup;

  int _totalDone = 0;
  int get getTotal_totalDone => _totalDone;

  int _totalRequestCancel = 0;
  int get getTotalRequestCancel => _totalRequestCancel;

  int _totalCancel = 0;
  int get getTotalCancel => _totalCancel;

  void setTotalPending(int total){
    _totalPending = total;
    notifyListeners();
  }


  Future<void> getReportOrderTotal(BuildContext context, int orderStatus, String store_id) async {
    print("starting report ");

    parseRepo.initData().then((bool success) async {
      if (success) {
        final queryBuilderAll = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("store_id", store_id)
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()));

        final ParseResponse apiResponse = await queryBuilderAll.query();
        print("response total ${orderStatus} total ${apiResponse.count}");

        if (apiResponse.success && apiResponse.count >= 0) {

          List<ParseObject> listFromApi = [];
          listFromApi = apiResponse.result??[];

          if(orderStatus == 1){
            _totalPending = apiResponse.count == 0 ? 0 : listFromApi.length;
            print("total pending $_totalPending");
          }else if(orderStatus == 2){
            _totalConfirm = apiResponse.count == 0 ? 0 : listFromApi.length;
          }else if(orderStatus == 3){
            _totalFinishCooking = apiResponse.count == 0 ? 0 : listFromApi.length;
          }else if(orderStatus == 4){
            _totalPickup = apiResponse.count == 0 ? 0 : listFromApi.length;
          }else if(orderStatus == 5){
            _totalDone = apiResponse.count == 0 ? 0 : listFromApi.length;
          }if(orderStatus == -1){
            _totalRequestCancel = apiResponse.count == 0 ? 0 : listFromApi.length;
          }else if(orderStatus == -2) {
            _totalCancel = apiResponse.count == 0 ? 0 : listFromApi.length;
          }
        } else {
          print('Result: ${apiResponse.error?.message}');
        }

        notifyListeners();
      }
    }).catchError((dynamic _) {
       print("Error: ${_.toString()}");
    });
  }
}