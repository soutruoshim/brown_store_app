import 'dart:convert';

import 'package:brown_store/provider/parse_provider.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import '../../../../data/model/response/order.dart';
import '../widget/order_widget.dart';

class OrderAll extends StatefulWidget {

  @override
  State<OrderAll> createState() => _OrderAllState();
}

class _OrderAllState extends State<OrderAll> {
  ScrollController scrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();
  int index = 0;
  @override
  void initState() {
    super.initState();
    Provider.of<ParseProvider>(context, listen: false).getOrderListAll(context, 0);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: _scrollController, slivers: [
      SliverToBoxAdapter(
        child: Column(
          children: [
            _buildListAll(),
          ],
        ),
      )
    ]);
  }
  _buildListAll() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child:  ParseLiveListWidget<ParseObject>(
          query: Provider.of<ParseProvider>(context, listen: false).getQueryAll!,
          key: UniqueKey(),
          duration: const Duration(seconds: 1),
          reverse: false,
          shrinkWrap: true,
          childBuilder: (BuildContext context,
              ParseLiveListElementSnapshot<ParseObject> snapshot) {
            //print("reload");
            if (snapshot.failed) {
              return const Text('something went wrong!');
            } else if (snapshot.hasData) {
              print("status : ${snapshot.loadedData!.get("status")}");
              Order order = Order.fromJson(jsonDecode(snapshot!.loadedData.toString()));
              return OrderWidget(orderModel: order,);
            }else{
              return const Center(child: ListTile(
                leading: CircularProgressIndicator(),
              )
              );
            }
      }),
    );
  }
}