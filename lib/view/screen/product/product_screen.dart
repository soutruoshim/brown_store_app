import 'package:brown_store/provider/parse_provider.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:provider/provider.dart';

import '../../../utill/images.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    Provider.of<ParseProvider>(context, listen: false)
        .getOrderListAll(context, 2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).highlightColor,
          title: Image.asset(Images.logo_with_app_name, height: 35),
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
            child: ListView(
          children: <Widget>[
            Divider(
              color: Theme.of(context).cardColor,
              thickness: 6.3,
            ),
            InkWell(
              onTap: () => (){},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                child: Container(
                  color: Colors.white54,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/image/2.png',
                            scale: 1.6,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Sanwitch",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/image/ic_veg.png',
                                      height: 16.0,
                                      width: 16.7,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('\$ 3.50',
                                        style:
                                            Theme.of(context).textTheme.caption),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned.directional(
                        end: 0.0,
                        bottom: 8.0,
                        textDirection: Directionality.of(context),
                        child: Row(
                          children: [
                            Text(
                              'In stock',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.bold),
                            ),
                            Switch(
                              activeColor: Theme.of(context).primaryColor,
                              activeTrackColor: Colors.grey[300],
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                 //
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => (){},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                child: Container(
                  color: Colors.white54,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/image/2.png',
                            scale: 1.6,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Sanwitch",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/image/ic_veg.png',
                                      height: 16.0,
                                      width: 16.7,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('\$ 3.50',
                                        style:
                                        Theme.of(context).textTheme.caption),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned.directional(
                        end: 0.0,
                        bottom: 8.0,
                        textDirection: Directionality.of(context),
                        child: Row(
                          children: [
                            Text(
                              'In Stock',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.bold),
                            ),
                            Switch(
                              activeColor: Theme.of(context).primaryColor,
                              activeTrackColor: Colors.grey[300],
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  //
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () => (){},
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 16.0),
                child: Container(
                  color: Colors.white54,
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(
                            'assets/image/2.png',
                            scale: 1.6,
                          ),
                          SizedBox(
                            width: 16.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Sanwitch",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/image/ic_veg.png',
                                      height: 16.0,
                                      width: 16.7,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text('\$ 3.50',
                                        style:
                                        Theme.of(context).textTheme.caption),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned.directional(
                        end: 0.0,
                        bottom: 8.0,
                        textDirection: Directionality.of(context),
                        child: Row(
                          children: [
                            Text(
                              'In Stock',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 13.3,
                                  fontWeight: FontWeight.bold),
                            ),
                            Switch(
                              activeColor: Theme.of(context).primaryColor,
                              activeTrackColor: Colors.grey[300],
                              value: true,
                              onChanged: (value) {
                                setState(() {
                                  //
                                });
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        )),
        Container(
          color: Colors.black12,
        )
      ],
    );
  }
}
