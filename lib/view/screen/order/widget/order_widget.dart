import 'dart:ffi';

import 'package:brown_store/helper/status_check.dart';
import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/view/screen/order/order_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      //padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_MEDIUM),
      padding: EdgeInsets.only(right: MediaQuery.of(context).size.height / 5, left: MediaQuery.of(context).size.height / 5, top: 8, bottom: 8),
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
                                      builder: (context) => OrderDetailWidget(order: orderModel,)
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

                                child: Image.asset(orderModel.status == 1?
                                Images.order_pending_icon:
                                orderModel.status == 3?
                                Images.out_icon:
                                orderModel.status == -2?
                                Images.return_icon:
                                orderModel.status == 4?
                                Images.delivered_icon:
                                Images.confirm_purchase

                                ),),

                              Padding(padding: const EdgeInsets.all(8.0),
                                child: Text(StatusCheck.statusText(orderModel.status),
                                    style: robotoRegular.copyWith(color: ColorResources.getPrimary(context))),
                              ),

                            ],
                          ),

                          Row(children: [
                            orderModel.status  == 1 ? SizedBox(width: Dimensions.PADDING_SIZE_SMALL):Container(),
                            orderModel.status  == 1 ?InkWell(
                              onTap: () => _updateOrder(context, orderModel, 2),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
                                  child: Text("Accept",
                                    style: robotoMedium.copyWith(color: Colors.white),),
                                ),
                              ),
                            ):Container(),

                            orderModel.status  == 2 ? SizedBox(width: Dimensions.PADDING_SIZE_SMALL):Container(),
                            orderModel.status  == 2 ?InkWell(
                              onTap: () => _updateOrder(context, orderModel, 3),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
                                  child: Text("Finish Cooking",
                                    style: robotoMedium.copyWith(color: Colors.white),),
                                ),
                              ),
                            ):Container(),

                            orderModel.status  == 3 ? SizedBox(width: Dimensions.PADDING_SIZE_SMALL):Container(),
                            orderModel.status  == 3 ?InkWell(
                              onTap: () => _updateOrder(context, orderModel, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
                                  child: Text("Done",
                                    style: robotoMedium.copyWith(color: Colors.white),),
                                ),
                              ),
                            ):Container(),

                            orderModel.status  == 4 ? SizedBox(width: Dimensions.PADDING_SIZE_SMALL):Container(),
                            orderModel.status  == 4 ?InkWell(
                              onTap: () => _updateOrder(context, orderModel, 5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
                                  child: Text("Done",
                                    style: robotoMedium.copyWith(color: Colors.white),),
                                ),
                              ),
                            ):Container(),
                            SizedBox(width: 8,),
                            StatusCheck.btnCancel(orderModel.status)?
                            InkWell(
                              onTap: () => _updateOrder(context, orderModel, -2),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 16, left: 16, top: 10, bottom: 10),
                                  child: Text("Cancel",
                                    style: robotoMedium.copyWith(color: Colors.white),),
                                ),
                              ),
                            ):Container(),
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

  void _updateOrder(BuildContext context, Order order, int status){
       Provider.of<ParseProvider>(context, listen: false).updateOrder(context, order.objectId.toString(), status);
  }


}

