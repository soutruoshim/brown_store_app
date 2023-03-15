import 'dart:convert';

import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/view/screen/order/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/body/login_model_info.dart';
import '../../../../data/model/response/order.dart';
import '../../../../helper/parse_event.dart';
import '../../../../helper/user_login_info.dart';
import '../../../../provider/auth_provider.dart';
import '../../../../provider/report_parse_provider.dart';




class OrderPending extends StatefulWidget {
  const OrderPending({Key? key}) : super(key: key);

  @override
  State<OrderPending> createState() => _OrderPendingState();
}

class _OrderPendingState extends State<OrderPending> {
  ScrollController scrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();
  int index = 0;
  // final LiveQuery liveQuery = LiveQuery();
  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return  _buildListAll();
  }
  _buildListAll() {
    Key refreshKey = UniqueKey();
    return context.watch<ParseProvider>().isLoading? Container(): Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:ParseLiveListWidget<ParseObject>(
          //query: Provider.of<ParseProvider>(context, listen: false).getQueryPending,
          query: context.watch<ParseProvider>().getQueryPending,
          //key:refreshKey,
          duration: const Duration(seconds: 1),
          reverse: false,
          lazyLoading: true,
          listLoadingElement: Center(
            child: CircularProgressIndicator(),
          ),
          childBuilder: (BuildContext context,
              ParseLiveListElementSnapshot<ParseObject> snapshot) {
            print("Loading pending.........");
            //Provider.of<ReportParseProvider>(context, listen: false).getReportOrderTotal(context, 1, "120191051716312119");
            if (snapshot.failed) {
              return const Text('something went wrong!');
            } else if (snapshot.hasData) {
              //print("status : ${snapshot.loadedData!.get("status")}");
              Order order = Order.fromJson(jsonDecode(snapshot!.loadedData.toString()));
              return OrderWidget(orderModel: order,);
            }else{
              // return const Center(child: ListTile(
              //   leading: CircularProgressIndicator(),
              //   )
              // );
              return Container();
            }
      }),
    );
  }

}