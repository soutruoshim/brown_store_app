import 'dart:convert';

import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/view/screen/order/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/response/order.dart';




class OrderCancelled extends StatefulWidget {
  const OrderCancelled({Key? key}) : super(key: key);

  @override
  State<OrderCancelled> createState() => _OrderCancelledState();
}

class _OrderCancelledState extends State<OrderCancelled> {
  ScrollController scrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();
  int index = 0;
  @override
  void initState() {
    super.initState();
    // Provider.of<ParseProvider>(context, listen: false).getOrderListCancel(
    //     context, -2);
  }


  @override
  Widget build(BuildContext context) {

    print("pending");
    // return CustomScrollView(controller: _scrollController, slivers: [
    //   SliverToBoxAdapter(
    //     child: Column(
    //       children: [
    //         _buildListAll(),
    //       ],
    //     ),
    //   )
    // ]);
    return  _buildListAll();
  }
  _buildListAll() {
    Key refreshKey = UniqueKey();
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ParseLiveListWidget<ParseObject>(
          query: Provider.of<ParseProvider>(context, listen: false).getQueryBuilderCancel,
          key:refreshKey,
          duration: const Duration(seconds: 1),
          reverse: false,

          listLoadingElement: Center(
            child: CircularProgressIndicator(),
          ),
          childBuilder: (BuildContext context,
              ParseLiveListElementSnapshot<ParseObject> snapshot) {
            print("loading cancelled.........");
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