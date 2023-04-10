import 'dart:convert';

import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/view/screen/order/widget/order_widget.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';
import '../../../../data/model/response/order.dart';
import '../../../../utill/strings_manager.dart';

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
    return _buildListAll();
  }

  _buildListAll() {
    Key refreshKey = UniqueKey();
    var check_query_pending = context.watch<ParseProvider>().getQueryPending??null;
    print("---------pending");

    return check_query_pending == null? Container(child: Center(child: Text(AppStrings.authentication_issues),),)
        : Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ParseLiveListWidget<ParseObject>(
                //query: Provider.of<ParseProvider>(context, listen: false).getQueryPending,
                query: context.watch<ParseProvider>().getQueryPending!,
                //key:refreshKey,
                duration: const Duration(seconds: 1),
                reverse: false,
                lazyLoading: false,
                queryEmptyElement: Container(child: Center(child: Text(AppStrings.empty_list_item),),),
                listLoadingElement: Center(
                  child: CircularProgressIndicator(),
                ),
                childBuilder: (BuildContext context,
                    ParseLiveListElementSnapshot<ParseObject> snapshot) {

                  if (snapshot.failed) {
                    return const Text(AppStrings.something_wrong);
                  } else if (snapshot.hasData) {

                    Order order = Order.fromJson(
                        jsonDecode(snapshot!.loadedData.toString()));
                    return OrderWidget(
                      orderModel: order,
                    );
                  } else {

                    return Container(child: Center(child: Text(AppStrings.empty_list_item),),);
                  }
                  print("--else hasdata");
                }),
          );
  }
}
