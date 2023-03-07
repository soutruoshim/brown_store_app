import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/report_parse_provider.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import 'widget/completed_order_widget.dart';
import 'widget/on_going_order_widget.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onRefresh();
  }
  Future<Null> _onRefresh() async {

    Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 1);
    Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 2);
    Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 3);
    Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 4);
    Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 5);
    Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, -1);
    Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, -2);
    await Future.delayed(Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:() => _onRefresh(),
      child: CustomScrollView(slivers: [
        SliverAppBar(
          pinned: true,
          floating: true,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).highlightColor,
          title: Image.asset(Images.logo_with_app_name, height: 35),
        ),
        SliverToBoxAdapter(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: Dimensions.PADDING_SIZE),
                OngoingOrderWidget(),
                CompletedOrderWidget(),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              ])
            ),

      ]),
    );
  }
}
