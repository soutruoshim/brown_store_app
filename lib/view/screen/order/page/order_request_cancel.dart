import 'dart:convert';

import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/view/screen/order/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../../../../data/model/response/order.dart';




class OrderRequestCancel extends StatefulWidget {
  const OrderRequestCancel({Key? key}) : super(key: key);

  @override
  State<OrderRequestCancel> createState() => _OrderRequestCancelState();
}

class _OrderRequestCancelState extends State<OrderRequestCancel> {
  ScrollController scrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();
  int index = 0;
  @override
  void initState() {
    super.initState();
    // Provider.of<ParseProvider>(context, listen: false).getOrderListRequestCancel(
    //     context, -1);
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
          query: Provider.of<ParseProvider>(context, listen: false).queryBuilderRequestCancel,
          key:refreshKey,
          duration: const Duration(seconds: 1),
          reverse: false,

          listLoadingElement: Center(
            child: CircularProgressIndicator(),
          ),
          childBuilder: (BuildContext context,
              ParseLiveListElementSnapshot<ParseObject> snapshot) {
            print("loading request cancel.........");
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