import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../utill/dimensions.dart';
import '../../../../utill/styles.dart';


class OrderTypeButtonHead extends StatelessWidget {
  final String text;
  final String subText;
  final Color color;
  final int index;
  final int numberOfOrder;
  OrderTypeButtonHead({required this.text,this.subText="",required this.color ,required this.index,  required this.numberOfOrder});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),),
        color: color,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
              child: Container(alignment: Alignment.center,
                child: Center(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(numberOfOrder.toString(),
                          style: robotoBold.copyWith(color: Color(0xFFFCFBFB),
                              fontSize: Dimensions.FONT_SIZE_HEADER_LARGE)),

                      Row(children: [
                        Text(text, style: robotoRegular.copyWith(color: Color(
                            0xFFFFFFFF),
                            fontSize: Dimensions.FONT_SIZE_DEFAULT)),
                        SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),

                        Text(subText, style: robotoRegular.copyWith(color: Color(
                            0xFFEAEAEA))),
                      ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                SizedBox.shrink(),
                //Spacer(),
                Container(width: MediaQuery.of(context).size.width/8,
                  height:MediaQuery.of(context).size.width/8,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(.10),
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(100))
                  ),),
                Spacer(),
                //SizedBox.shrink(),
              ],
            )


          ],
        ),
      ),
    );
  }
}
