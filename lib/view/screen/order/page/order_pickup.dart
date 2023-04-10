import 'dart:convert';

import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/view/screen/order/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/response/order.dart';
import '../../../../utill/strings_manager.dart';

class OrderPickup extends StatefulWidget {
  const OrderPickup({Key? key}) : super(key: key);

  @override
  State<OrderPickup> createState() => _OrderPickupState();
}

class _OrderPickupState extends State<OrderPickup> {
  ScrollController scrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();
  int index = 0;
  @override
  void initState() {
    super.initState();
    // Provider.of<ParseProvider>(context, listen: false).getOrderListFinishCooking(
    //     context, 3);
  }


  @override
  Widget build(BuildContext context) {
    return  _buildListAll();
  }
  _buildListAll() {
    //Key refreshKey = UniqueKey();
    var check_query = context.watch<ParseProvider>().getQueryBuilderFinishCooking??null;
    return check_query == null? Container(child: Center(child: Text(AppStrings.authentication_issues),),):Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ParseLiveListWidget<ParseObject>(
          query: Provider.of<ParseProvider>(context, listen: false).getQueryBuilderFinishCooking!,
          //key:refreshKey,
          duration: const Duration(seconds: 1),
          reverse: false,
          lazyLoading: false,
          listLoadingElement: Center(
            child: CircularProgressIndicator(),
          ),
          queryEmptyElement: Container(child: Center(child: Text(AppStrings.empty_list_item),),),
          childBuilder: (BuildContext context,
              ParseLiveListElementSnapshot<ParseObject> snapshot) {

            if (snapshot.failed) {
              return Text(AppStrings.something_wrong);
            } else if (snapshot.hasData) {
              //print("status : ${snapshot.loadedData!.get("status")}");
              Order order = Order.fromJson(jsonDecode(snapshot!.loadedData.toString()));
              return OrderWidget(orderModel: order,);
            }else{
              return Container(child: Center(child: Text(AppStrings.empty_list_item),),);
            }
      }),
    );
  }
}