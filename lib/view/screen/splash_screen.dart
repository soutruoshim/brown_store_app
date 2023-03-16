import 'dart:async';
import 'package:brown_store/data/model/body/MenuModelRequest.dart';
import 'package:brown_store/data/model/body/store_model_request.dart';
import 'package:brown_store/helper/user_login_info.dart';
import 'package:brown_store/provider/product_provider.dart';
import 'package:brown_store/provider/report_parse_provider.dart';
import 'package:brown_store/view/screen/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helper/network_info.dart';
import '../../helper/security_helper.dart';
import '../../provider/auth_provider.dart';
import '../../provider/parse_provider.dart';
import '../../provider/splash_provider.dart';
import '../../utill/app_constants.dart';
import '../../utill/images.dart';
import 'dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    NetworkInfo.checkConnectivity(context);

    // Provider.of<SplashProvider>(context, listen: false)
    //     .initConfig(context)
    //     .then((bool isSuccess) {
    //   if (isSuccess) {
    //     Provider.of<SplashProvider>(context, listen: false)
    //         .initShippingTypeList(context, '');
    //   }
    // });
    String data_enc = SecurityHelper.getDataEncryptionKey(
        dataTypes: [
          "CSTORE_LIST",
        ],
        dev_kit: AppConstants.dev_kid
    );
    Provider.of<SplashProvider>(context, listen: false)
        .initStores(context, StoreModelRequest(devKid: AppConstants.dev_kid, function: AppConstants.store_app_function, storeappFunction: AppConstants.store_app_function_check_store_list, datas: DatasStoreModelRequest(dataEncryption: data_enc, func: AppConstants.func_type)));
    Timer(const Duration(seconds: 3), () async {
          if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {

                var userModelInfo = await getLoginInfo(context);
                print("store save id: ${userModelInfo.storeId}");

                if(userModelInfo.storeId != null){
                  //==========screen order======
                  await Provider.of<ParseProvider>(context, listen: false).getOrderListAll(context, 0, userModelInfo.storeId!);
                  await Provider.of<ParseProvider>(context, listen: false).getOrderListPending(context, 1, userModelInfo.storeId!);
                  await Provider.of<ParseProvider>(context, listen: false).getOrderListAccepted(context, 2, userModelInfo.storeId!);
                  await Provider.of<ParseProvider>(context, listen: false).getOrderListFinishCooking(context, 3, userModelInfo.storeId!);
                  await Provider.of<ParseProvider>(context, listen: false).getOrderListPickup(context, 4,userModelInfo.storeId!);
                  await Provider.of<ParseProvider>(context, listen: false).getOrderListDone(context, 5, userModelInfo.storeId!);
                  await Provider.of<ParseProvider>(context, listen: false).getOrderListRequestCancel(context, -1,userModelInfo.storeId!);
                  await Provider.of<ParseProvider>(context, listen: false).getOrderListCancel(context, -2, userModelInfo.storeId!);
                  Provider.of<ParseProvider>(context,listen: false).liveQueryBooking(context);
                  //==========product=======
                  String data_enc_menu = SecurityHelper.getDataEncryptionKey(
                      dataTypes: [
                        "CSTORE_LIST_MENU_STATUS",
                      ],
                      dev_kit: AppConstants.dev_kid
                  );


                  MenuModelRequest menuModelRequest = MenuModelRequest(devKid: AppConstants.dev_kid, function: AppConstants.store_app_function, storeappFunction: AppConstants.store_app_function_check_all_menu_status, datas: DatasMenuRequest(dataEncryption: data_enc_menu,storeid: userModelInfo.storeId, func: AppConstants.func_type));
                  Provider.of<ProductProvider>(context, listen: false).getMenuList(context, menuModelRequest);

                  //==========service=======
                  String data_enc_menu_service = SecurityHelper.getDataEncryptionKey(
                      dataTypes: [
                        "CSERVICE_LIST",
                      ],
                      dev_kit: AppConstants.dev_kid
                  );
                  MenuModelRequest menuModelRequest_for_service = MenuModelRequest(devKid: AppConstants.dev_kid, function: AppConstants.store_app_function, storeappFunction: AppConstants.store_app_function_service_list, datas: DatasMenuRequest(dataEncryption: data_enc_menu_service,storeid: userModelInfo.storeId, func: AppConstants.func_type));
                  Provider.of<ProductProvider>(context, listen: false).getServiceList(context, menuModelRequest_for_service);

                  //=========badges=======
                  await  Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, 1, userModelInfo.storeId!);
                  await  Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, 2, userModelInfo.storeId!);
                  await  Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, 3, userModelInfo.storeId!);
                  await  Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, 4, userModelInfo.storeId!);
                  await  Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, 5, userModelInfo.storeId!);
                  await  Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, -1, userModelInfo.storeId!);
                  await  Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, -2, userModelInfo.storeId!);

                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DashboardScreen()));

                }

            // Navigator.of(context).pushReplacement(MaterialPageRoute(
            //     builder: (BuildContext context) => const DashboardScreen()));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => AuthScreen()));
          }
          }
        );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                  tag: 'logo',
                  child: Image.asset(Images.white_logo, fit: BoxFit.cover)),
            ],
          ),
        ),
      ],
    ));
  }
}
