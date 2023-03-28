import 'dart:convert';

import 'package:brown_store/data/model/body/menu_model_status_request.dart';
import 'package:brown_store/data/model/response/menu_model.dart';
import 'package:brown_store/data/model/response/service_model.dart';
import 'package:brown_store/helper/user_login_info.dart';
import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/provider/product_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../../../data/model/body/MenuModelRequest.dart';
import '../../../data/model/body/login_model_info.dart';
import '../../../data/model/body/service_model_status_request.dart';
import '../../../helper/security_helper.dart';
import '../../../provider/auth_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({Key? key}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late ProgressDialog pd;
  late ServiceModel serviceModels;
  @override
  void initState() {
    // Provider.of<ParseProvider>(context, listen: false)
    //     .getOrderListAll(context, 2);
    super.initState();
    pd = ProgressDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    serviceModels = context.watch<ProductProvider>().serviceModelList;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).highlightColor,
          title: Image.asset(Images.logo_with_app_name, height: 35),
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Padding(
      padding: Device.get().isTablet ? EdgeInsets.only(right: MediaQuery.of(context).size.height / 6, left: MediaQuery.of(context).size.height / 6, top: 8, bottom: 8):EdgeInsets.only(right: 4, left: 4, top: 4, bottom: 4),
      child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(
                 children: <Widget>[
                 Divider(
                  color: Theme.of(context).cardColor,
                  thickness: 6.3,
                 ),
                 _item("Delivery", "delivery", serviceModels.result!.delivery, "https://static.vecteezy.com/system/resources/previews/005/337/737/original/icon-delivery-silhouette-illustration-free-vector.jpg"),
                   Divider(
                     color: Theme.of(context).cardColor,
                     thickness: 6.3,
                   ),
                   _item("Pick-up","pickup", serviceModels.result!.pickup, "https://cdn-icons-png.flaticon.com/128/4537/4537278.png"),
                   Divider(
                     color: Theme.of(context).cardColor,
                     thickness: 6.3,
                   ),
                   _item("Dine-in","dinein", serviceModels.result!.dinein, "https://cdn-icons-png.flaticon.com/128/2086/2086880.png"),
                 ]
              )
          ),
          Container(
            color: Colors.black12,
          )
        ],
      ),
    );
  }

  Widget _item(String? serviceName, String service_code, String? status, String imgUrl, ){

    return Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
        child: Container(
          color: Colors.white54,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image.asset(
                  //   'assets/image/2.png',
                  //   scale: 1.6,
                  // ),
                  Container(
                    child: CachedNetworkImage(
                      errorWidget: (ctx, url ,err )=>Image.asset(Images.placeholder_image,
                        height: Dimensions.chat_image, width: Dimensions.chat_image, fit: BoxFit.cover,),
                      placeholder: (ctx, url )=>Image.asset(Images.placeholder_image),
                      imageUrl: imgUrl,
                      fit: BoxFit.cover, height: Dimensions.chat_image, width: Dimensions.chat_image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                              colorFilter: status == "-1"? ColorFilter.mode(Colors.black38, BlendMode.darken):ColorFilter.mode(Colors.white, BlendMode.darken)
                              ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(serviceName!,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              status == "1"?'assets/image/ic_veg.png':'assets/image/ic_no_veg.png',
                              height: 16.0,
                              width: 16.7,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('Service for customer',
                                style:
                                Theme.of(context).textTheme.caption),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned.directional(
                end: 0.0,
                bottom: 8.0,
                textDirection: Directionality.of(context),
                child: Row(
                  children: [
                    Text( status == "1"?'Available':'Unavailable',

                      style: TextStyle(
                          color: status == "1"? Theme.of(context).primaryColor:Theme.of(context).hintColor,
                          fontSize: 13.3,
                          fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      activeColor: Theme.of(context).primaryColor,
                      activeTrackColor: Colors.grey[300],
                      value: status == "1"? true:false,
                      onChanged: (value) async {

                        //==========product=======
                        String data_enc_service = SecurityHelper.getDataEncryptionKey(
                            dataTypes: [
                              "USERVICE_LIST_MANAGE",
                            ],
                            dev_kit: AppConstants.dev_kid
                        );

                        var userModelInfo = getLoginInfo(context);

                        ServiceModelStatusRequest serviceModelStatusRequest = ServiceModelStatusRequest(
                            devKid: AppConstants.dev_kid,
                            function: AppConstants.store_app_function,
                            storeappFunction: AppConstants.store_app_function_service_list_manage,
                            datas: DatasServiceUpdateRequest(
                                func: AppConstants.func_type,
                                storeId: userModelInfo.storeId,
                                serviceName: service_code,
                                status: status == "1"? "-1":"1",
                                dataEncryption: data_enc_service
                            ));

                        String data_enc_menu_service = SecurityHelper.getDataEncryptionKey(
                            dataTypes: [
                              "CSERVICE_LIST",
                            ],
                            dev_kit: AppConstants.dev_kid
                        );
                        MenuModelRequest menuModelRequest_for_service = MenuModelRequest(devKid: AppConstants.dev_kid, function: AppConstants.store_app_function, storeappFunction: AppConstants.store_app_function_service_list, datas: DatasMenuRequest(dataEncryption: data_enc_menu_service,storeid: userModelInfo.storeId, func: AppConstants.func_type));

                        //pd.show(max: 100, msg: 'Please waiting for server working... Thank you!');

                        showDialog(
                          // The user CANNOT close this dialog  by pressing outsite it
                            barrierDismissible: false,
                            context: context,
                            builder: (_) {
                              return Dialog(
                                // The background color
                                backgroundColor: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: const [
                                      // The loading indicator
                                      CircularProgressIndicator(),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      // Some text
                                      Text('Please wait...')
                                    ],
                                  ),
                                ),
                              );
                            });

                        await Provider.of<ProductProvider>(context, listen: false).setServiceStatus(context, serviceModelStatusRequest, menuModelRequest_for_service);
                        // if(pd.isOpen()){
                        //   pd.close();
                        // }
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
