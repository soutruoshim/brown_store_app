import 'package:brown_store/view/screen/order/order_detail_widget.dart';
import 'package:flutter/material.dart';
import '../../../../data/model/response/order.dart';
import '../../../../utill/color_resources.dart';
import '../../../../utill/dimensions.dart';
import '../../../../utill/images.dart';
import '../../../../utill/styles.dart';

class OrderWidget extends StatelessWidget {
  final Order orderModel;
  final int index;
  OrderWidget({this.index = 0, required this.orderModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_MEDIUM),
      child: Column( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
                  boxShadow: [BoxShadow(
                      color:
                      Theme.of(context).primaryColor.withOpacity(.09),blurRadius: 5, spreadRadius: 1, offset: Offset(1,2))]
              ),
              child: Column( crossAxisAlignment: CrossAxisAlignment.start,children: [

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimensions.PADDING_SIZE_SMALL), topRight: Radius.circular(Dimensions.PADDING_SIZE_SMALL))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                    child: Row(mainAxisAlignment : MainAxisAlignment.spaceBetween,
                      children: [
                        Container(padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor.withOpacity(.05),
                              borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_EXTRA_SMALL)
                          ),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                    MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => OrderDetailWidget()
                                    ),
                                  );
                            },
                            child: Row(
                              children: [
                                Text('Order no# ',
                                  style: robotoRegular.copyWith(color: ColorResources.getPrimary(context),fontSize: Dimensions.FONT_SIZE_LARGE),),
                                Text("${orderModel.orderNo}",
                                  style: robotoMedium.copyWith(color: Colors.black54,fontSize: Dimensions.FONT_SIZE_LARGE),),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                              //color: Theme.of(context).primaryColor,
                              //borderRadius: BorderRadius.circular(50)

                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("\$ ${orderModel.otherdetails!.grandTotal}",
                              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0,),),
                          ),),
                      ],
                    ),
                  ),
                ),

                Container(decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(Dimensions.PADDING_SIZE_SMALL),
                        bottomRight: Radius.circular(Dimensions.PADDING_SIZE_SMALL))
                ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB( Dimensions.PADDING_SIZE_SMALL, 0, Dimensions.PADDING_SIZE_SMALL, Dimensions.PADDING_SIZE_SMALL),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Container(
                        margin: EdgeInsets.only(left: 8.0),
                        child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Ref No:",
                                      style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),
                                  Text("${orderModel.objectId}",
                                      style: robotoRegular.copyWith(color: Colors.black)),
                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Order Date:",
                                      style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),
                                  Text("${orderModel.otherdetails!.checkOutDateTime}",
                                      style: robotoRegular.copyWith(color: Colors.black)),
                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Pick-up:",
                                        style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),
                                    Text("22/09/2023",
                                        style: robotoRegular.copyWith(color: Colors.black)),
                                  ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Phone Number:",
                                      style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),
                                  Text("011362283",
                                      style: robotoRegular.copyWith(color: Colors.black)),
                                ],
                              ),
                              SizedBox(height: 8,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Pay by:",
                                      style: robotoRegular.copyWith(color: Theme.of(context).hintColor)),
                                  Text("Brown Card",
                                      style: robotoRegular.copyWith(color: Colors.black)),
                                ],
                              )
                            ],
                        ),
                      ),

                      SizedBox(height: Dimensions.PADDING_SIZE_SMALL),


                      Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center, children: [
                          Row( mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(height: Dimensions.ICON_SIZE_SMALL, width: Dimensions.ICON_SIZE_SMALL,

                                child: Image.asset(
                                Images.order_pending_icon

                                ),),
                              Padding(padding: const EdgeInsets.all(8.0),
                                child: Text("Pending ${orderModel.status}",
                                    style: robotoRegular.copyWith(color: ColorResources.getPrimary(context))),
                              ),
                            ],
                          ),

                          Row(children: [

                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 6),
                                child: Text("Cancel",
                                  style: robotoMedium.copyWith(color: Colors.white),),
                              ),
                            ),
                            SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                            Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16, left: 16, top: 6, bottom: 6),
                                child: Text("Accept",
                                  style: robotoMedium.copyWith(color: Colors.white),),
                              ),
                            ),
                            // Text('ABA',
                            //     style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Theme.of(context).hintColor)),
                            // SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                            // Container(height: Dimensions.ICON_SIZE_DEFAULT, width: Dimensions.ICON_SIZE_DEFAULT,
                            //   child: Image.asset(Images.pay_by_wallet_icon),),
                          ],),

                        ],),
                    ],),
                  ),)
              ],),),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

        ],
      ),
    );
  }
}

