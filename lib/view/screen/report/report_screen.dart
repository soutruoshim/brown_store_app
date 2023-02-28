import 'package:flutter/material.dart';

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
  Widget build(BuildContext context) {
    return CustomScrollView(controller: _scrollController, slivers: [
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: Dimensions.PADDING_SIZE),
        OngoingOrderWidget(),
        CompletedOrderWidget(),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
      ]))
    ]);
  }
}
