import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../provider/report_parse_provider.dart';
import '../../../../utill/dimensions.dart';
import '../../../../utill/images.dart';
import '../../../../utill/styles.dart';
import 'order_type_button.dart';

class CompletedOrderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(color: Color(0xFFFFAA47),
              spreadRadius: -3, blurRadius: 4, offset: Offset.fromDirection(0,6))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        Padding(
          padding: const EdgeInsets.fromLTRB( Dimensions.PADDING_SIZE_DEFAULT, Dimensions.PADDING_SIZE_EXTRA_SMALL,Dimensions.PADDING_SIZE_DEFAULT,0 ),
          child: Text("Complete Order",
            style: robotoBold.copyWith(color: Theme.of(context).primaryColor),),
        ),
        ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          children: [
            OrderTypeButton(
              color: Color(0xFFFFAA47),
              icon: Images.delivered,
              text: "Done",
              index: 3,
              numberOfOrder: Provider.of<ReportParseProvider>(context, listen: false).getTotal_totalDone,
            ),

            OrderTypeButton(
              color: Color(0xFFFFAA47),
              icon: Images.cancelled,
              text: "Cancel",
              index: 6,
              numberOfOrder: Provider.of<ReportParseProvider>(context, listen: false).getTotalCancel,
            ),

            OrderTypeButton(
              color: Color(0xFFFFAA47),
              icon: Images.returned,
              text: "Request Cancel", index: 4,
              numberOfOrder: Provider.of<ReportParseProvider>(context, listen: false).getTotalRequestCancel,
            ),

            OrderTypeButton(
              showBorder: false,
              color: Color(0xFFFFAA47),
              icon: Images.failed,
              text: "Failed", index: 5,
              numberOfOrder: 0
            ),
          ],
        ),

        SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
      ],),);
  }
}
