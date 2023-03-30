import 'dart:ffi';

import 'package:brown_store/helper/status_check.dart';
import 'package:brown_store/helper/user_login_info.dart';
import 'package:brown_store/provider/parse_provider.dart';
import 'package:brown_store/view/screen/order/order_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:provider/provider.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../data/model/response/order.dart';
import '../../../../helper/api_checker.dart';
import '../../../../helper/check_device.dart';
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
      padding: Device.get().isTablet
          ? EdgeInsets.only(
              right: MediaQuery.of(context).size.height / 6,
              left: MediaQuery.of(context).size.height / 6,
              top: 8,
              bottom: 8)
          : EdgeInsets.only(right: 4, left: 4, top: 4, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  color: orderModel.otherdetails!.type == "delivery"
                      ? ColorResources.CARD_DELIVERY
                      : ColorResources.CARD_PICKUP,
                  borderRadius:
                      BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(.09),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(1, 2))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft:
                                Radius.circular(Dimensions.PADDING_SIZE_SMALL),
                            topRight: Radius.circular(
                                Dimensions.PADDING_SIZE_SMALL))),
                    child: Padding(
                      padding:
                          const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.05),
                                borderRadius: BorderRadius.circular(
                                    Dimensions.PADDING_SIZE_EXTRA_SMALL)),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                      fullscreenDialog: true,
                                      builder: (context) => OrderDetailWidget(
                                            order: orderModel,
                                          )),
                                );
                              },
                              child: Row(
                                children: [
                                  Text(
                                    'Order no# ',
                                    style: robotoRegular.copyWith(
                                        color:
                                            ColorResources.getPrimary(context),
                                        fontSize: Dimensions.FONT_SIZE_LARGE),
                                  ),
                                  Text(
                                    "${orderModel.refId!.substring(orderModel.refId!.length - 3)}",
                                    style: robotoMedium.copyWith(
                                        color: Colors.black54,
                                        fontSize: Dimensions.FONT_SIZE_LARGE),
                                  ),
                                  SizedBox(
                                    width: 16.0,
                                  ),
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
                              child: Text(
                                "${orderModel.otherdetails!.type!.toUpperCase()}  | \$ ${orderModel.otherdetails!.grandTotal}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0,
                                    color: Colors.brown),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        //color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft:
                                Radius.circular(Dimensions.PADDING_SIZE_SMALL),
                            bottomRight: Radius.circular(
                                Dimensions.PADDING_SIZE_SMALL))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                          Dimensions.PADDING_SIZE_SMALL,
                          0,
                          Dimensions.PADDING_SIZE_SMALL,
                          Dimensions.PADDING_SIZE_SMALL),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Ref ID:",
                                        style: robotoRegular.copyWith(
                                            color: Colors.black)),
                                    Text("${orderModel.refId}",
                                        style: robotoRegular.copyWith(
                                            color: Colors.black)),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Order Time:",
                                        style: robotoRegular.copyWith(
                                            color: Colors.black)),
                                    Text(
                                        "${getFormatTime(orderModel.otherdetails!.checkOutDateTime)}",
                                        style: robotoBold.copyWith(
                                            color: Colors.black)),
                                  ],
                                ),
                                orderModel.otherdetails!.type != "delivery"
                                    ? SizedBox(
                                        height: 12,
                                      )
                                    : SizedBox(
                                        height: 0,
                                      ),
                                orderModel.otherdetails!.type != "delivery"
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("Pick-up Time:",
                                              style: robotoRegular.copyWith(
                                                  color: Colors.black)),
                                          Text(
                                              "${orderModel.otherdetails!.customer_status} Minute",
                                              style: robotoBold.copyWith(
                                                  color: Colors.black)),
                                        ],
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Customer Name:",
                                        style: robotoRegular.copyWith(
                                            color: Colors.black)),
                                    Text("${orderModel.otherdetails!.userName}",
                                        style: robotoBold.copyWith(
                                            color: Colors.black)),
                                  ],
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phone Number:",
                                        style: robotoRegular.copyWith(
                                            color: Colors.black)),
                                    Text(
                                        "${orderModel.otherdetails!.userPhone}",
                                        style: robotoRegular.copyWith(
                                            color: Colors.black)),
                                  ],
                                ),
                                orderModel.otherdetails!.type == "delivery"
                                    ? SizedBox(
                                        height: 0,
                                      )
                                    : SizedBox(
                                        height: 12,
                                      ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Address:",
                                        style: robotoRegular.copyWith(
                                            color: Colors.black)),
                                    Row(
                                      children: [
                                        orderModel.otherdetails!.type ==
                                                "delivery"
                                            ? InkWell(
                                                onTap: () =>
                                                    navigateTo(orderModel),
                                                child: Container(
                                                  // decoration: BoxDecoration(
                                                  //     color: Theme.of(context).primaryColor,
                                                  //     borderRadius: BorderRadius.circular(50)
                                                  // ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 16,
                                                            left: 16,
                                                            top: 5,
                                                            bottom: 5),
                                                    // child: Text("Direction",
                                                    //   style: robotoMedium.copyWith(color: Colors.white),),
                                                    child: Container(
                                                      height: 34,
                                                      width: 34,
                                                      child: Image.asset(Images
                                                          .current_location_select),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : Container(),
                                        orderModel.otherdetails!.type ==
                                                "delivery"
                                            ? InkWell(
                                                onTap: () =>
                                                    navigateTo(orderModel),
                                                child: Text(
                                                    "${orderModel.otherdetails!.address}",
                                                    style:
                                                        robotoRegular.copyWith(
                                                            color:
                                                                Colors.black)),
                                              )
                                            : Text(
                                                "${orderModel.otherdetails!.address}",
                                                style: robotoRegular.copyWith(
                                                    color: Colors.black)),
                                        //SizedBox(width: 10,),
                                      ],
                                    )
                                  ],
                                ),
                                orderModel.otherdetails!.type == "delivery"
                                    ? SizedBox(
                                        height: 0,
                                      )
                                    : SizedBox(
                                        height: 12,
                                      ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Pay by:",
                                        style: robotoRegular.copyWith(
                                            color: Colors.black)),
                                    Text(
                                        "${orderModel.otherdetails!.paymentOpt}",
                                        style: TextStyle(
                                            color: Colors.brown,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                robotoRegular.fontFamily)),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Dimensions.ICON_SIZE_SMALL,
                                    width: Dimensions.ICON_SIZE_SMALL,
                                    child: Image.asset(orderModel.status == 1
                                        ? Images.order_pending_icon
                                        : orderModel.status == 3
                                            ? Images.out_icon
                                            : orderModel.status == -2
                                                ? Images.return_icon
                                                : orderModel.status == 4
                                                    ? Images.delivered_icon
                                                    : Images.confirm_purchase),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        StatusCheck.statusText(
                                            orderModel.status),
                                        style: robotoRegular.copyWith(
                                            color: ColorResources.getPrimary(
                                                context))),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                            fullscreenDialog: true,
                                            builder: (context) =>
                                                OrderDetailWidget(
                                                  order: orderModel,
                                                )),
                                      );
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          //border: Border.all(color: Colors.green, width: 1.0, style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            right: 16,
                                            left: 16,
                                            top: 10,
                                            bottom: 10),
                                        child: Text(
                                          "View",
                                          style: robotoMedium.copyWith(
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  orderModel.status == 1
                                      ? SizedBox(
                                          width: Dimensions.PADDING_SIZE_SMALL)
                                      : Container(),
                                  orderModel.status == 1 ||
                                          orderModel.status == -1
                                      ? InkWell(
                                          onTap: () => _updateOrder(
                                              context, orderModel, 2),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16,
                                                  left: 16,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Text(
                                                "Accept",
                                                style: robotoMedium.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),

                                  orderModel.status == 2
                                      ? SizedBox(
                                          width: Dimensions.PADDING_SIZE_SMALL)
                                      : Container(),
                                  orderModel.status == 2
                                      ? InkWell(
                                          onTap: () => _updateOrder(
                                              context, orderModel, 3),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16,
                                                  left: 16,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Text(
                                                "Finish Cooking",
                                                style: robotoMedium.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),

                                  orderModel.status == 3
                                      ? SizedBox(
                                          width: Dimensions.PADDING_SIZE_SMALL)
                                      : Container(),
                                  orderModel.status == 3
                                      ? InkWell(
                                          onTap: () => _updateOrder(
                                              context, orderModel, 4),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16,
                                                  left: 16,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Text(
                                                orderModel.otherdetails!.type !=
                                                        "delivery"
                                                    ? "Pick-up"
                                                    : "Delivery",
                                                style: robotoMedium.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  SizedBox(
                                    width: Dimensions.PADDING_SIZE_SMALL,
                                  ),
                                  orderModel.status == 3
                                      ? InkWell(
                                          onTap: () => _updateOrder(
                                              context, orderModel, 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16,
                                                  left: 16,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Text(
                                                "Done",
                                                style: robotoMedium.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),

                                  orderModel.status == 4
                                      ? SizedBox(
                                          width: Dimensions.PADDING_SIZE_SMALL)
                                      : Container(),
                                  orderModel.status == 4
                                      ? InkWell(
                                          onTap: () => _updateOrder(
                                              context, orderModel, 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16,
                                                  left: 16,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Text(
                                                "Done",
                                                style: robotoMedium.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  StatusCheck.btnCancel(orderModel.status)
                                      ? SizedBox(
                                          width: 8,
                                        )
                                      : SizedBox(
                                          width: 0,
                                        ),
                                  StatusCheck.btnCancel(orderModel.status)
                                      ? InkWell(
                                          onTap: () => _updateOrder(
                                              context, orderModel, -2),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 16,
                                                  left: 16,
                                                  top: 10,
                                                  bottom: 10),
                                              child: Text(
                                                "Cancel",
                                                style: robotoMedium.copyWith(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  // Text('ABA',
                                  //     style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Theme.of(context).hintColor)),
                                  // SizedBox(width: Dimensions.PADDING_SIZE_SMALL),
                                  // Container(height: Dimensions.ICON_SIZE_DEFAULT, width: Dimensions.ICON_SIZE_DEFAULT,
                                  //   child: Image.asset(Images.pay_by_wallet_icon),),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
        ],
      ),
    );
  }

  void _updateOrder(BuildContext context, Order order, int status) async {
    await Provider.of<ParseProvider>(context, listen: false)
        .updateOrder(context, order, order.objectId.toString(), status);
  }

  void navigateTo(Order order) async {
    //var uri = Uri.parse("google.navigation:q=${order.otherdetails!.ulat},${order.otherdetails!.ulong}&mode=d");
    var uri = Uri.parse(
        'https://www.google.com/maps/search/?api=1&query=${order.otherdetails!.ulat},${order.otherdetails!.ulong}');

    //var uri =Uri.parse( 'https://www.google.com/maps/dir/Current+Location/${order.otherdetails!.ulat},${order.otherdetails!.ulong}');
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }

    // double mlate = double.parse(order.otherdetails!.ulat!);
    // //double mlong = double.parse(order.otherdetails!.ulong!);
    // double mlong = order.otherdetails!.ulong!.toDouble();
    //
    //
    //
    // MapsLauncher.launchCoordinates(mlate , mlong , 'Direction');
  }
}

extension NumberParsing on String {
  double toDouble() {
    return double.parse(this);
  }
}
