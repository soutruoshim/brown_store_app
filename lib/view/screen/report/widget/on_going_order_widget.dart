import 'package:brown_store/provider/report_parse_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../utill/dimensions.dart';
import 'order_type_button_head.dart';

class OngoingOrderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(color: Color(0xFFFFAA47),
              spreadRadius: -3, blurRadius: 4, offset: Offset.fromDirection(0,6))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

        Padding(
          padding: const EdgeInsets.fromLTRB(Dimensions.PADDING_SIZE_SMALL,0, Dimensions.PADDING_SIZE_SMALL,Dimensions.FONT_SIZE_SMALL),
          child: GridView.count(
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: (1 / .65),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            children: [
              OrderTypeButtonHead(
                color: Color(0xFFFFAA47),
                text: "Pending", index: 1,
                subText: "Order",
                numberOfOrder: Provider.of<ReportParseProvider>(context, listen: false).getTotalPending,
              ),

              OrderTypeButtonHead(
                color: Color(0xFF7C5D00),
                text: "Processing", index: 2,
                subText: "Order",
                numberOfOrder: Provider.of<ReportParseProvider>(context, listen: false).getTotalOutDelivery,

              ),
              OrderTypeButtonHead(
                color: Color(0xFF157CFF),
                text: "Confirmed", index: 7,
                subText: "Order",
                numberOfOrder: Provider.of<ReportParseProvider>(context, listen: false).getTotalConfirm,
              ),
              OrderTypeButtonHead(
                color: Color(0xFF0F6E54),
                text: "Delivery", index: 8,
                subText: "Order",
                numberOfOrder: Provider.of<ReportParseProvider>(context, listen: false).getTotalDelivered,
              ),
            ],
          ),
        ),
        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
      ],),);
  }
}
