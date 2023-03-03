import 'package:brown_store/utill/color_resources.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utill/images.dart';

class OrderDetailWidget extends StatefulWidget {
  // String? cardSeletedImage;
  // String? transactionId;
  // OrderDetailWidget({Key? key, required this.cardSeletedImage, required this.transactionId}) : super(key: key);

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
          elevation: 1,
          title: const Text('ORDER DETAIL', style: TextStyle(color: Color(0xFF5F3813), fontSize: 18),),
          actions: [
             IconButton(onPressed: (){}, icon: Icon(Icons.cancel_outlined, color: Colors.red,)),
             IconButton(onPressed: (){}, icon: Icon(Icons.check, color: Colors.green,))
          ],
        ),
        body: SingleChildScrollView(
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
                      fontSize: 12,
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "Order_pending_approval",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 12,
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "22/09/90",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 12,
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text(
                          "Brown BKK",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 12,
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
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "100",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 12,
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
                            fontSize: 14,
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
                            fontSize: 14,
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
                            fontSize: 14,
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
                    itemCount: 3,
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
                                      "1001",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: mainColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: MediaQuery.of(context).size.width * 0.373,
                                  child: Text(
                                    "23",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 12,
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "3.4",
                                    style: TextStyle(
                                      color: mainColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            true == false
                                ? const SizedBox()
                                : Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  "redeem_point",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: mainColor,
                                    fontSize: 12,
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
                              itemCount: 3,
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
                                                padding: const EdgeInsets.only(left: 12.0),
                                                child: Text(
                                                  "Low Fat",
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: mainColor,
                                                    fontSize: 12,
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
                                                fontSize: 14,
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
                              itemCount: 3,
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
                                                padding: const EdgeInsets.only(left: 12.0),
                                                child: Text(
                                                  "Expresso",
                                                  textAlign: TextAlign.start,
                                                  maxLines: 3,
                                                  overflow: TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                    color: mainColor,
                                                    fontSize: 12,
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
                                              "2",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: mainColor,
                                                fontSize: 12,
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
                                                fontSize: 12,
                                                fontWeight: FontWeight.w300,
                                                decoration: TextDecoration.none,
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              "2",
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                color: mainColor,
                                                fontSize: 12,
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
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "XCVB8373",
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
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Positioned(
                        right: positionCurrency,
                        child: Text(
                          "- " + " 2",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "34",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 14,
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
                            fontSize: 14,
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
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "100",
                          textAlign: TextAlign.end,
                          style:  TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
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
                          padding: const EdgeInsets.only(left: 12),
                          child: Text(
                            "Free Delivery",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 12,
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
                            fontSize: 12,
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
                            fontSize: 12,
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
                            fontSize: 14,
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
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "300",
                          textAlign: TextAlign.end,
                          style:  TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 14,
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
                        "total_point_redeem",
                        style:  TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      Text(
                        "" == "" ? "0" : "200",
                        style:  TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 14,
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
                        "40000",
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
                          fontSize: 14,
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
                          padding: const EdgeInsets.only(left: 12.0),
                          child: Text(
                            "Cash Back",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: mainColor,
                              fontSize: 12,
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
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "90",
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 12,
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
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Text(
                          "222",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.none,
                          ),
                        ),
                      ),
                      Text(
                        "100\$",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 12,
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
                    height: 12,
                  ),
                  Row(
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
                        imageUrl: "https://play-lh.googleusercontent.com/M8sf8G2_naFCFD17x_7CTIMYWBJvAyyMb9m8HmM2x5KFITvbJ2ctLOIckPK6utkidMU",
                        fit: BoxFit.contain,
                        width: 60,
                        height: 40,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
