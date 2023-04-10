import 'package:brown_store/data/model/body/order_status_model_request.dart';
import 'package:brown_store/data/model/response/order.dart';
import 'package:brown_store/data/repository/parse_repo.dart';
import 'package:brown_store/helper/status_check.dart';
import 'package:brown_store/helper/user_login_info.dart';
import 'package:brown_store/provider/product_provider.dart';
import 'package:brown_store/provider/report_parse_provider.dart';
import 'package:brown_store/view/base/confirmation_threebutton_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../data/model/response/base/api_response.dart';
import '../helper/api_checker.dart';
import '../helper/parse_event.dart';
import '../helper/security_helper.dart';
import '../utill/app_constants.dart';
import '../utill/images.dart';
import '../utill/strings_manager.dart';
import '../view/base/confirmation_dialog.dart';
import '../view/base/custom_dialog.dart';
import '../view/base/custom_snackbar.dart';

class ParseProvider with ChangeNotifier {
  final ParseRepo parseRepo;

  bool isLoading = false;

  int _orderTypeIndex = 0;
  int get orderTypeIndex => _orderTypeIndex;

  ParseProvider({required this.parseRepo});


  QueryBuilder<ParseObject>? _queryBuilderPending= null;
  QueryBuilder<ParseObject>? get getQueryPending => _queryBuilderPending??null;

  late QueryBuilder<ParseObject>? _queryBuilderAccepted = null;
  QueryBuilder<ParseObject>? get getQueryBuilderAccepted => _queryBuilderAccepted??null;

  late QueryBuilder<ParseObject>? _queryBuilderFinishCooking= null;
  QueryBuilder<ParseObject>? get getQueryBuilderFinishCooking =>_queryBuilderFinishCooking??null;

  late QueryBuilder<ParseObject>? _queryBuilderPickup=null;
  QueryBuilder<ParseObject>? get getQueryBuilderPickup => _queryBuilderPickup??null;

  late QueryBuilder<ParseObject>? _queryBuilderDone=null;
  QueryBuilder<ParseObject>? get getQueryBuilderDone => _queryBuilderDone??null;

  late QueryBuilder<ParseObject>? _queryBuilderRequestCancel=null;
  QueryBuilder<ParseObject>? get queryBuilderRequestCancel =>
      _queryBuilderRequestCancel??null;

  late QueryBuilder<ParseObject>? _queryBuilderCancel=null;
  QueryBuilder<ParseObject>? get getQueryBuilderCancel => _queryBuilderCancel??null;


  late QueryBuilder<ParseObject>? _queryBuilderAll=null;
  QueryBuilder<ParseObject>? get getQueryAll => _queryBuilderAll??null;

  Future<void> getOrderList(
      BuildContext context, int orderStatus, String store_id) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        switch (orderStatus) {
          case 0:
            _queryBuilderAll =
                await QueryBuilder<ParseObject>(ParseObject('Orders'))
                  ..whereEqualTo("store_id", store_id)
                  ..whereContains("lastTry", getFormatedDate(DateTime.now()))
                  ..orderByDescending("createdAt");
            break;
          case 1:
            _queryBuilderPending =
                await getQuery(context, orderStatus, store_id);
            break;
          case 2:
            _queryBuilderAccepted =
                await getQuery(context, orderStatus, store_id);
            break;
          case 3:
            _queryBuilderFinishCooking =
                await getQuery(context, orderStatus, store_id);
            break;
          case 4:
            isLoading = true;
            _queryBuilderPickup =
                await getQuery(context, orderStatus, store_id);
            isLoading = false;
            break;
          case 5:
            _queryBuilderDone = await getQuery(context, orderStatus, store_id);
            break;
          case -1:
            _queryBuilderRequestCancel =
                await getQuery(context, orderStatus, store_id);
            break;
          case -2:
            _queryBuilderCancel =
                await getQuery(context, orderStatus, store_id);
            break;
        }

        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }

  Future<QueryBuilder<ParseObject>> getQuery(
      BuildContext context, int orderStatus, String store_id) async {
    var _query = await QueryBuilder<ParseObject>(ParseObject('Orders'))
      ..whereEqualTo("store_id", store_id)
      ..whereEqualTo("status", orderStatus)
      ..whereContains("lastTry", getFormatedDate(DateTime.now()))
      ..orderByDescending("createdAt");
    return _query;
  }

  // Future<void> getOrderListAll(BuildContext context, int orderStatus, String store_id) async {
  //   parseRepo.initData().then((bool success) async {
  //     if (success) {
  //       _queryBuilderAll = await QueryBuilder<ParseObject>(ParseObject('Orders'))
  //         ..whereEqualTo("store_id", store_id)
  //         ..whereContains("lastTry", getFormatedDate(DateTime.now()))
  //         ..orderByDescending("createdAt");
  //       //_queryBuilderAll!.query();
  //       print("query order all status");
  //
  //       notifyListeners();
  //     }
  //   }).catchError((dynamic _) {
  //      print("Error: ${_.toString()}");
  //   });
  // }
  //
  // Future<void> getOrderListPending(BuildContext context, int orderStatus, String store_id) async {
  //   isLoading = true;
  //   parseRepo.initData().then((bool success) async {
  //     if (success) {
  //       _queryBuilderPending = await QueryBuilder<ParseObject>(ParseObject('Orders'))
  //         ..whereEqualTo("store_id", store_id)
  //         ..whereEqualTo("status", orderStatus)
  //         ..whereContains("lastTry", getFormatedDate(DateTime.now()))
  //         ..orderByDescending("createdAt");
  //       //_queryBuilderPending!.query();
  //       print("query order pending status");
  //       isLoading = false;
  //       notifyListeners();
  //     }
  //   }).catchError((dynamic _) {
  //     print("Error: ${_.toString()}");
  //   });
  // }
  //
  // Future<void> getOrderListAccepted(BuildContext context, int orderStatus, String store_id) async {
  //   parseRepo.initData().then((bool success) async {
  //     if (success) {
  //       _queryBuilderAccepted = await QueryBuilder<ParseObject>(ParseObject('Orders'))
  //         ..whereEqualTo("store_id", store_id)
  //         ..whereEqualTo("status", orderStatus)
  //         ..whereContains("lastTry", getFormatedDate(DateTime.now()))
  //         ..orderByDescending("createdAt");
  //       //_queryBuilderPending!.query();
  //       print("query order accepted status");
  //       notifyListeners();
  //     }
  //   }).catchError((dynamic _) {
  //     print("Error: ${_.toString()}");
  //   });
  // }
  //
  // Future<void> getOrderListFinishCooking(BuildContext context, int orderStatus, String store_id) async {
  //   parseRepo.initData().then((bool success) async {
  //     if (success) {
  //       _queryBuilderFinishCooking = await QueryBuilder<ParseObject>(ParseObject('Orders'))
  //         ..whereEqualTo("store_id", store_id)
  //         ..whereEqualTo("status", orderStatus)
  //         ..whereContains("lastTry", getFormatedDate(DateTime.now()))
  //         ..orderByDescending("createdAt");
  //       //_queryBuilderPending!.query();
  //       print("query order accepted status");
  //       notifyListeners();
  //     }
  //   }).catchError((dynamic _) {
  //     print("Error: ${_.toString()}");
  //   });
  // }
  //
  // Future<void> getOrderListPickup(BuildContext context, int orderStatus, String store_id) async {
  //   parseRepo.initData().then((bool success) async {
  //     if (success) {
  //       _queryBuilderPickup = await QueryBuilder<ParseObject>(ParseObject('Orders'))
  //         ..whereEqualTo("store_id", store_id)
  //         ..whereEqualTo("status", orderStatus)
  //         ..whereContains("lastTry", getFormatedDate(DateTime.now()))
  //         ..orderByDescending("createdAt");
  //       //_queryBuilderPending!.query();
  //       print("query order accepted status");
  //       notifyListeners();
  //     }
  //   }).catchError((dynamic _) {
  //     print("Error: ${_.toString()}");
  //   });
  // }
  //
  // Future<void> getOrderListDone(BuildContext context, int orderStatus, String store_id) async {
  //   parseRepo.initData().then((bool success) async {
  //     if (success) {
  //       _queryBuilderDone = await QueryBuilder<ParseObject>(ParseObject('Orders'))
  //         ..whereEqualTo("store_id", store_id)
  //         ..whereEqualTo("status", orderStatus)
  //         ..whereContains("lastTry", getFormatedDate(DateTime.now()))
  //         ..orderByDescending("createdAt");
  //       //_queryBuilderPending!.query();
  //
  //       print("query order done status");
  //       notifyListeners();
  //     }
  //   }).catchError((dynamic _) {
  //     print("Error: ${_.toString()}");
  //   });
  // }
  //
  //
  // Future<void> getOrderListRequestCancel(BuildContext context, int orderStatus, String store_id) async {
  //   parseRepo.initData().then((bool success) async {
  //     if (success) {
  //       _queryBuilderRequestCancel = await QueryBuilder<ParseObject>(ParseObject('Orders'))
  //         ..whereEqualTo("store_id", store_id)
  //         ..whereEqualTo("status", orderStatus)
  //         ..whereContains("lastTry", getFormatedDate(DateTime.now()))
  //         ..orderByDescending("createdAt");
  //       notifyListeners();
  //     }
  //   }).catchError((dynamic _) {
  //     print("Error: ${_.toString()}");
  //   });
  // }
  //
  // Future<void> getOrderListCancel(BuildContext context, int orderStatus, String store_id) async {
  //   parseRepo.initData().then((bool success) async {
  //     if (success) {
  //       _queryBuilderCancel = await QueryBuilder<ParseObject>(ParseObject('Orders'))
  //         ..whereEqualTo("store_id", store_id)
  //         ..whereEqualTo("status", orderStatus)
  //         ..whereContains("lastTry", getFormatedDate(DateTime.now()))
  //         ..orderByDescending("createdAt");
  //       notifyListeners();
  //
  //     }
  //   }).catchError((dynamic _) {
  //     print("Error: ${_.toString()}");
  //   });
  // }

  Future<void> liveQueryBooking(BuildContext context) async {
    parseRepo.initData().then((bool success) async {
      if (success) {
        final LiveQuery liveQuery = LiveQuery();
        onCreateOrder(context, liveQuery, getLoginInfo(context), 1);
        onUpdateOrder(context, liveQuery, getLoginInfo(context), -1);
        notifyListeners();
      }
    }).catchError((dynamic _) {
      print("Error: ${_.toString()}");
    });
  }


Future<void> updateOrder(BuildContext context,Order orderobject, String id, int status) async {
    ProgressDialog pd = ProgressDialog(context: context);
    if(status == -2){
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationThreeDialog(
            icon: Images.deny_w,
            title:
            "Do you want to update this order to ${StatusCheck.statusText(
                status)} ?",
            onABAPressed: () async {

              showDialog(
                // The user CANNOT close this dialog  by pressing outsite it
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => CustomDialog(title: AppStrings.please_wait,)
              );

              try {

                //========update on server php
                String data_enc = SecurityHelper.getDataEncryptionKey(
                    dataTypes: [
                      "ORDER_RECEIVE_LIST",
                    ],
                    dev_kit: AppConstants.dev_kid
                );

                OrderStatusRequest orderStatusRequest = OrderStatusRequest(
                    devKid: AppConstants.dev_kid,
                    function: AppConstants.store_app_function,
                    storeappFunction: AppConstants
                        .store_app_function_order_status,
                    datas: DatasOrderStatusRequest(
                        referenceId: orderobject.refId!,
                        status: status.toString(),
                        returnPaymentType: "CANCEL_ABA",
                        dataEncryption: data_enc
                    ));

                // Provider.of<ProductProvider>(context, listen: false)
                //     .setOrderStatus(context, orderStatusRequest);

                await Provider.of<ProductProvider>(context, listen: false)
                    .setOrderStatus(context, orderStatusRequest).then((value) async {
                  print("===============res");
                  print(value.response!.data["code"]);
                  //=======update on parse
                  if(value.response!.data["code"] == "100" || value.response!.data["code"] == 100){
                    var order = ParseObject('Orders')
                      ..objectId = id
                      ..set('status', status);
                    await order.save();

                    //pd.close();
                    Navigator.pop(context);
                    Navigator.pop(context);

                    showCustomSnackBar(
                        "Your order updated to ${StatusCheck.statusText(
                            status)}, Thank you",
                        context,
                        isToaster: true,
                        isError: false);
                  }else{
                    pd.close();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  }
                });


                //get total baget
                var store_id = getLoginInfo(context).storeId!;
                if (store_id != null) {
                  if (status == 5) {
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 3, store_id);
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 4, store_id);
                  } else if (status == -1 || status == -2) {
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, status, store_id);
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 1, store_id);
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 2, store_id);
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 3, store_id);
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 4, store_id);
                  } else {
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, status - 1, store_id);
                  }

                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, status, store_id);
                }
              } catch (error) {
                print(error);
                Navigator.pop(context);
                Navigator.pop(context);
              }

              showCustomSnackBar(
                  "Your order updated to ${StatusCheck.statusText(
                      status)}, Thank you",
                  context,
                  isToaster: true,
                  isError: false);
            },

            description:
            'The order status will be update to ${StatusCheck.statusText(
                status)}',

            onBrownPressed: () async {
              showDialog(
                // The user CANNOT close this dialog  by pressing outsite it
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => CustomDialog(title: AppStrings.please_wait,)
              );

            try {
              //=======update on parse
              // var order = ParseObject('Orders')
              //   ..objectId = id
              //   ..set('status', status);
              // await order.save();
              //
              // pd.close();
              // Navigator.pop(context);

              //========update on server php
              String data_enc = SecurityHelper.getDataEncryptionKey(
                  dataTypes: [
                    "ORDER_RECEIVE_LIST",
                  ],
                  dev_kit: AppConstants.dev_kid
              );

              OrderStatusRequest orderStatusRequest = OrderStatusRequest(
                  devKid: AppConstants.dev_kid,
                  function: AppConstants.store_app_function,
                  storeappFunction: AppConstants
                      .store_app_function_order_status,
                  datas: DatasOrderStatusRequest(
                      referenceId: orderobject.refId!,
                      status: status.toString(),
                      dataEncryption: data_enc
                  ));

              // Provider.of<ProductProvider>(context, listen: false)
              //     .setOrderStatus(context, orderStatusRequest);

              await Provider.of<ProductProvider>(context, listen: false)
                  .setOrderStatus(context, orderStatusRequest).then((value) async {
                print("===============res");
                print(value.response!.data["code"]);
                //=======update on parse
                if(value.response!.data["code"] == "100" || value.response!.data["code"] == 100){
                  var order = ParseObject('Orders')
                    ..objectId = id
                    ..set('status', status);
                  await order.save();

                  //pd.close();
                  Navigator.pop(context);
                  Navigator.pop(context);

                  showCustomSnackBar(
                      "Your order updated to ${StatusCheck.statusText(
                          status)}, Thank you",
                      context,
                      isToaster: true,
                      isError: false);
                }else{
                  pd.close();
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
              });


              //get total baget
              var store_id = getLoginInfo(context).storeId!;
              if (store_id != null) {
                if (status == 5) {
                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, 3, store_id);
                }else if (status == -1 || status == -2) {

                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, status, store_id);

                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, 1, store_id);
                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, 2, store_id);
                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, 3, store_id);
                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, 4, store_id);
                } else {
                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, status - 1, store_id);
                }

                Provider.of<ReportParseProvider>(context, listen: false)
                    .getReportOrderTotal(context, status, store_id);
              }
            } catch (error) {
              print(error);

              Navigator.pop(context);
              Navigator.pop(context);
            }

            showCustomSnackBar(
                "Your order updated to ${StatusCheck.statusText(
                    status)}, Thank you",
                context,
                isToaster: true,
                isError: false);
          }, order: orderobject,

          );
        },
      );
    }else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmationDialog(
            icon: Images.deny_w,
            title:
            "Do you want to update this order to ${StatusCheck.statusText(
                status)} ?",
            onYesPressed: () async {

              showDialog(
                // The user CANNOT close this dialog  by pressing outsite it
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => CustomDialog(title: AppStrings.please_wait,)
              );


              try {
                //========update on server php
                String data_enc = SecurityHelper.getDataEncryptionKey(
                    dataTypes: [
                      "ORDER_RECEIVE_LIST",
                    ],
                    dev_kit: AppConstants.dev_kid
                );

                OrderStatusRequest orderStatusRequest = OrderStatusRequest(
                    devKid: AppConstants.dev_kid,
                    function: AppConstants.store_app_function,
                    storeappFunction: AppConstants
                        .store_app_function_order_status,
                    datas: DatasOrderStatusRequest(
                        referenceId: orderobject.refId!,
                        status: status.toString(),
                        dataEncryption: data_enc
                    ));

                await Provider.of<ProductProvider>(context, listen: false)
                    .setOrderStatus(context, orderStatusRequest).then((value) async {
                      print("===============res");
                      print(value.response!.data["code"]);
                     //=======update on parse
                      if(value.response!.data["code"] == "100" || value.response!.data["code"] == 100){
                        var order = ParseObject('Orders')
                          ..objectId = id
                          ..set('status', status);
                        await order.save();

                        //pd.close();
                        Navigator.pop(context);
                        Navigator.pop(context);

                        showCustomSnackBar(
                            "Your order updated to ${StatusCheck.statusText(
                                status)}, Thank you",
                            context,
                            isToaster: true,
                            isError: false);
                      }else{
                        pd.close();
                        Navigator.pop(context);
                        Navigator.pop(context);
                      }
                });


                //get total baget
                var store_id = getLoginInfo(context).storeId!;
                if (store_id != null) {
                  if (status == 5) {
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 3, store_id);
                  } else if (status == -1) {
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 1, store_id);
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 2, store_id);
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 3, store_id);
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, 4, store_id);
                  } else {
                    Provider.of<ReportParseProvider>(context, listen: false)
                        .getReportOrderTotal(context, status - 1, store_id);
                  }


                  Provider.of<ReportParseProvider>(context, listen: false)
                      .getReportOrderTotal(context, status, store_id);
                }
              } catch (error) {
                print(error);
                pd.close();
                Navigator.pop(context);
              }
            },
            description:
            'The order status will be update to ${StatusCheck.statusText(
                status)}',
          );
        },
      );
    }
  }
}
