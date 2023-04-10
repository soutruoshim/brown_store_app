import 'dart:convert';

import 'package:brown_store/provider/parse_provider.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import '../../../../data/model/response/order.dart';
import '../../../../utill/strings_manager.dart';
import '../widget/order_widget.dart';

class OrderAll extends StatefulWidget {

  @override
  State<OrderAll> createState() => _OrderAllState();
}

class _OrderAllState extends State<OrderAll> {
  ScrollController scrollController = ScrollController();
  int index = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _buildListAll();
  }
  _buildListAll() {
    var check_query = context.watch<ParseProvider>().getQueryAll??null;
    return check_query == null? Container(child: Center(child: Text(AppStrings.authentication_issues),),): Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:  ParseLiveListWidget<ParseObject>(
          query: context.watch<ParseProvider>().getQueryAll!,
          duration: const Duration(seconds: 1),
          reverse: false,
          shrinkWrap: true,
          lazyLoading: false,
          queryEmptyElement: Container(child: Center(child: Text(AppStrings.empty_list_item),),),
          listLoadingElement: Center(
            child: CircularProgressIndicator(),
          ),
          childBuilder: (BuildContext context,
              ParseLiveListElementSnapshot<ParseObject> snapshot) {
            //print("loading all.........");
            if (snapshot.failed) {
              return const Text(AppStrings.something_wrong);
            } else if (snapshot.hasData) {
              //print("status : ${snapshot.loadedData!.get("status")}");
              Order order = Order.fromJson(jsonDecode(snapshot!.loadedData.toString()));
              return OrderWidget(orderModel: order,);
            } else{
                return Container(child: Center(child: Text(AppStrings.empty_list_item),),);
            }
      }),
    );
  }
}