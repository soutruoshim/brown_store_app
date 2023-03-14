import 'dart:convert';

import 'package:brown_store/data/model/body/menu_model_status_request.dart';
import 'package:brown_store/data/model/response/menu_model.dart';
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
import '../../../helper/security_helper.dart';
import '../../../provider/auth_provider.dart';
import '../../../utill/app_constants.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  late ProgressDialog pd;
  late MenuModel menuModels;
  @override
  void initState() {
    // Provider.of<ParseProvider>(context, listen: false)
    //     .getOrderListAll(context, 2);
    super.initState();
    pd = ProgressDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    menuModels = context.watch<ProductProvider>().menuModelList;
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
              child: ListView.builder(
                itemCount: menuModels.result!.length,
                itemBuilder: (context, index) {
                  return _item(menuModels.result![index]);
                },
              )
          ),
          Container(
            color: Colors.black12,
          )
        ],
      ),
    );
  }

  Widget _item(Menu menu){

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
                      imageUrl: 'https://www.browncoffee.com.kh/uploads/ximg/item_menus/${menu.menuPicture}',
                      fit: BoxFit.cover, height: Dimensions.chat_image, width: Dimensions.chat_image,
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(menu.menuName!,
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
                              menu.status == "3"?'assets/image/ic_veg.png':'assets/image/ic_no_veg.png',
                              height: 16.0,
                              width: 16.7,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text('\$ Not Show',
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
                    Text( menu.status == "3"?'In Stock':'Out Stock',

                      style: TextStyle(
                          color: menu.status == "3"? Theme.of(context).primaryColor:Theme.of(context).hintColor,
                          fontSize: 13.3,
                          fontWeight: FontWeight.bold),
                    ),
                    Switch(
                      activeColor: Theme.of(context).primaryColor,
                      activeTrackColor: Colors.grey[300],
                      value: menu.status == "3"? true:false,
                      onChanged: (value) async {

                        //==========product=======
                        String data_enc_menu = SecurityHelper.getDataEncryptionKey(
                            dataTypes: [
                              "CSTORE_LIST_MENU_STATUS",
                            ],
                            dev_kit: AppConstants.dev_kid
                        );

                        final String userInfo = Provider.of<AuthProvider>(context,listen: false).getUserInfo();
                        Map<String, dynamic> jsonUserInfo = jsonDecode(userInfo);
                        var userModelInfo = LoginModelInfo.fromJson(jsonUserInfo);

                        MenuModelStatusRequest menuModelStatusRequest = MenuModelStatusRequest(
                            devKid: AppConstants.dev_kid,
                            function: AppConstants.store_app_function,
                            storeappFunction: AppConstants.store_app_function_dis_enable_menu,
                            datas: DatasenuModelStatusRequest(
                                func: AppConstants.func_type,
                                storeid: userModelInfo.storeId,
                                zoneid: menu.zoneid,
                                menuid: menu.idMenu,
                                foodcode: menu.linkedCode,
                                status: menu.status == "3"? "2":"3",
                                dataEncryption: data_enc_menu
                            ));
                        MenuModelRequest menuModelRequest = MenuModelRequest(devKid: AppConstants.dev_kid, function: AppConstants.store_app_function, storeappFunction: AppConstants.store_app_function_check_all_menu_status, datas: DatasMenuRequest(dataEncryption: data_enc_menu,storeid: userModelInfo.storeId, func: AppConstants.func_type));
                        pd.show(max: 100, msg: 'Please waiting... Thank you!');
                        await Provider.of<ProductProvider>(context, listen: false).setMenuStatus(context, menuModelStatusRequest, menuModelRequest);
                        if(pd.isOpen()){
                          pd.close();
                        }
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
