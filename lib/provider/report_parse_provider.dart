import 'package:brown_store/data/repository/parse_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ReportParseProvider with ChangeNotifier {
  final ParseRepo parseRepo;

  ReportParseProvider({required this.parseRepo});

  int _totalPending = 0;
  int get getTotalPending => _totalPending;

  int _totalConfirm = 0;
  int get getTotalConfirm => _totalConfirm;

  int _totalOutDelivery = 0;
  int get getTotalOutDelivery=> _totalOutDelivery;

  int _totalDelivered = 0;
  int get getTotalDelivered=> _totalDelivered;

  int _totalDone = 0;
  int get getTotal_totalDone => _totalDone;

  int _totalRequestCancel = 0;
  int get getTotalRequestCancel => _totalRequestCancel;

  int _totalCancel = 0;
  int get getTotalCancel => _totalCancel;


  Future<void> getPendingOrderTotal(BuildContext context, int orderStatus) async {
    print("date"+getFormatedDate(DateTime.now()));

    parseRepo.initData().then((bool success) async {
      if (success) {
        final queryBuilderAll = await QueryBuilder<ParseObject>(ParseObject('Orders'))
          ..whereEqualTo("status", orderStatus)
          ..whereContains("lastTry", getFormatedDate(DateTime.now()));

        final ParseResponse apiResponse = await queryBuilderAll.query();

        if (apiResponse.success && apiResponse.count > 0) {
          final List<ParseObject> listFromApi = apiResponse.result;
         // final ParseObject? parseObject = listFromApi?.first;
          if(orderStatus == 1){
            _totalPending = listFromApi.length;
          }else if(orderStatus == 2){
            _totalConfirm = listFromApi.length;
          }else if(orderStatus == 3){
            _totalOutDelivery = listFromApi.length;
          }else if(orderStatus == 4){
            _totalDelivered = listFromApi.length;
          }else if(orderStatus == 5){
            _totalDone = listFromApi.length;
          }if(orderStatus == -1){
            _totalRequestCancel = listFromApi.length;
          }else if(orderStatus == -2) {
            _totalCancel = listFromApi.length;
          }

          print('Result: ${listFromApi.length}');
        } else {
          print('Result: ${apiResponse.error?.message}');
        }

        notifyListeners();
      }
    }).catchError((dynamic _) {
       print("Error: ${_.toString()}");
    });
  }



  getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date.toString());
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(inputDate);
  }
}