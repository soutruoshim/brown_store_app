import 'package:brown_store/helper/status_check.dart';
import 'package:brown_store/utill/color_resources.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../../data/model/response/order.dart';
import '../../../utill/images.dart';

class OrderDetailWidget extends StatefulWidget {
  // String? cardSeletedImage;
  // String? transactionId;
  // OrderDetailWidget({Key? key, required this.cardSeletedImage, required this.transactionId}) : super(key: key);
  late Order order;

  OrderDetailWidget({required this.order});

  @override
  State<OrderDetailWidget> createState() => _OrderDetailWidgetState();
}

class _OrderDetailWidgetState extends State<OrderDetailWidget> {
  final mainColor = Color(0xFF603813);
  final mainPrimary = Color(0xFF603813);
  @override
  Widget build(BuildContext context) {
    final positionCurrency = MediaQuery.of(context).size.width * 0.16;
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('ORDER DETAIL', style: TextStyle(color: Color(0xFF5F3813), fontSize: 18),),
          // actions: [
          //    IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined, color: Colors.red,)),
          //    IconButton(onPressed: (){}, icon: Icon(Icons.check, color: Colors.green,))
          // ],
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),

            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          margin: Device.get().isTablet? EdgeInsets.only(right: MediaQuery.of(context).size.height / 8, left: MediaQuery.of(context).size.height / 8, top: 8, bottom: 0):EdgeInsets.only(right:4, left: 4, top: 4, bottom: 4),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 17.0, right: 17.0, bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pickup",
                      style:  TextStyle(
                        color: mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          StatusCheck.statusText(widget.order.status),
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          widget.order.otherdetails!.checkOutDateTime.toString(),
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Store",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Text(
                            widget.order.otherdetails!.storeName.toString(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order ID",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          widget.order.orderNo.toString(),
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Order Detail",
                      style:  TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.none,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Items",
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Positioned(
                          right: MediaQuery.of(context).size.width * 0.363,
                          child: Text(
                            "Qty",
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "Amount",
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 2),
                      height: 1.5,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.order.ordereditems?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Column(
                            children: [
                              index == 0
                                  ? const SizedBox()
                                  : Container(
                                margin: const EdgeInsets.only(top: 3, bottom: 3),
                                height: 1.5,
                                color: mainColor,
                              ),
                              Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      child: Text(
                                        widget.order.ordereditems![index].foodname.toString(),
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: mainColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: MediaQuery.of(context).size.width * 0.373,
                                    child: Text(
                                      widget.order.ordereditems![index].qty.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: positionCurrency,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "\$",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: mainColor,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      widget.order.ordereditems![index].price.toString(),
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              widget.order.ordereditems![index].isfree == false
                                  ? const SizedBox()
                                  : Align(
                                alignment: Alignment.centerLeft,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.5,
                                  child: Text(
                                    "Redeem point",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ),
                              // if (orderDetailController.orderItems[index].modifycode!.isEmpty) ...[
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.order.ordereditems![index].modifycode?.length,
                                itemBuilder: (BuildContext context, int indexmodify) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 15.0),
                                                  child: Text(
                                                    widget.order.ordereditems![index].modifycode![indexmodify].toString(),
                                                    maxLines: 3,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: mainColor,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w300,
                                                      decoration: TextDecoration.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                '-',
                                                style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              // ],
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: widget.order.ordereditems![index].addon?.length,
                                itemBuilder: (BuildContext context, int indexaddon) {
                                  return Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Column(
                                      children: [
                                        Stack(
                                          alignment: AlignmentDirectional.center,
                                          children: [
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: SizedBox(
                                                width: MediaQuery.of(context).size.width * 0.5,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 15.0),
                                                  child: Text(
                                                    widget.order.ordereditems![index].addon![indexaddon].addoncode.toString(),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 3,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                      color: mainColor,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w300,
                                                      decoration: TextDecoration.none,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: MediaQuery.of(context).size.width * 0.373,
                                              child: Text(
                                                  widget.order.ordereditems![index].addon![indexaddon].qty.toString(),
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: positionCurrency,
                                              child: Text(
                                                "\$",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                widget.order.ordereditems![index].addon![indexaddon].isfree.toString(),
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  color: mainColor,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w300,
                                                  decoration: TextDecoration.none,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),

                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 1.5,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coupon",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          widget.order.otherdetails!.couponNumber.toString(),
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Discount",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Positioned(
                          right: positionCurrency,
                          child: Text(
                            "- \$",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.order.otherdetails!.totalDiscount.toString(),
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 1.5,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Sub Total Usd",
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Positioned(
                          right: positionCurrency,
                          child: Text(
                            "\$ ",
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.order.otherdetails!.subTotalItemFee.toString(),
                            textAlign: TextAlign.end,
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Free Delivery",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: positionCurrency,
                          child: Text(
                            "\$",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            "0",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Total Amount",
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Positioned(
                          right: positionCurrency,
                          child: Text(
                            " \$",
                            textAlign: TextAlign.start,
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.order.otherdetails!.grandTotal.toString(),
                            textAlign: TextAlign.end,
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Point Redeem",
                          style:  TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                        Text(
                          widget.order.otherdetails!.subTotalSpendPoint.toString() == "" ? "0" : widget.order.otherdetails!.subTotalSpendPoint.toString(),
                          style:  TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 1.5,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          widget.order.otherdetails!.exchangeRate!,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Reward Earn",
                          style:  TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "Cash Back",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: mainColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.none,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: positionCurrency,
                          child: Text(
                            "\$ ",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            widget.order.otherdetails!.cashBack.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Text(
                            "Point Earned",
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ),
                        Text(
                          widget.order.otherdetails!.cashBackPoint.toString(),
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      height: 1.5,
                      color: Theme.of(context).primaryColor,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: [
                          Text(
                            "Pay With",
                            style:  TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          CachedNetworkImage(
                            fadeOutDuration: const Duration(milliseconds: 10),
                            fadeInDuration: const Duration(milliseconds: 5),
                            imageUrl: widget.order.otherdetails!.paymentOpt != "BROWN Card"? "https://play-lh.googleusercontent.com/M8sf8G2_naFCFD17x_7CTIMYWBJvAyyMb9m8HmM2x5KFITvbJ2ctLOIckPK6utkidMU":"https://uploads-ssl.webflow.com/5c65009b7405c91645f84783/623413d7b2ccda4fe8500597_Website%20logo-30.png",
                            fit: BoxFit.contain,
                            width: 60,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}
