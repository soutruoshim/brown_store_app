import 'package:brown_store/view/screen/order/order_all.dart';
import 'package:brown_store/view/screen/order/order_pending.dart';
import 'package:flutter/material.dart';

import '../../../utill/images.dart';
class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).highlightColor,
        title: Image.asset(Images.logo_with_app_name, height: 35),
          bottom: TabBar(
            indicatorColor: Theme.of(context).primaryColor,
            tabs: [
              Tab(text: "All",),
              Tab(text: "Pending"),
              Tab(text: "Request Cancel"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OrderAll(),
            OrderPending(),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}

// import 'dart:convert';
//
// import 'package:brown_store/provider/parse_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
// import 'package:provider/provider.dart';
// import '../../../data/model/response/order.dart';
// import '../../../utill/dimensions.dart';
// import '../../../utill/images.dart';
// import '../../../utill/styles.dart';
// import 'widget/order_widget.dart';
//
//
// class OrderScreen extends StatefulWidget {
//   final bool isBacButtonExist;
//   final bool fromHome;
//
//   OrderScreen({this.isBacButtonExist = false, this.fromHome = false});
//
//   @override
//   State<OrderScreen> createState() => _OrderScreenState();
// }
//
// class _OrderScreenState extends State<OrderScreen> {
//   ScrollController scrollController = ScrollController();
//   final ScrollController _scrollController = ScrollController();
//   int index = 0;
//   @override
//   void initState() {
//     super.initState();
//     Provider.of<ParseProvider>(context, listen: false).setIndex(context, 0);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(controller: _scrollController, slivers: [
//       SliverAppBar(
//         pinned: true,
//         floating: true,
//         elevation: 0,
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         backgroundColor: Theme.of(context).highlightColor,
//         title: Image.asset(Images.logo_with_app_name, height: 35),
//       ),
//       SliverToBoxAdapter(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                   horizontal: Dimensions.PADDING_SIZE_SMALL,
//                   vertical: Dimensions.PADDING_SIZE_SMALL),
//               child: SizedBox(
//                 height: 40,
//                 child: ListView(
//                   shrinkWrap: true,
//                   scrollDirection: Axis.horizontal,
//                   children: [
//                     OrderTypeButton(text: "All", index: 0, click: (){
//                         setState(() {
//                             index = 0;
//                         });
//                     },),
//                     const SizedBox(width: 5),
//                     OrderTypeButton(text: "Pending", index: 1, click: (){
//                           setState(() {
//                               index = 1;
//                           });
//                     },),
//                     const SizedBox(width: 5),
//                     OrderTypeButton(text: "Confirmed", index: 2, click: (){
//                       setState(() {
//                         index = 2;
//                       });
//                     },),
//                     // const SizedBox(width: 5),
//                     // OrderTypeButton(text: "Processing", index: 3),
//                     // const SizedBox(width: 5),
//                     // OrderTypeButton(text: "Delivered", index: 4),
//                     // const SizedBox(width: 5),
//                     // OrderTypeButton(text: "Cancelled", index: 5),
//                     // const SizedBox(width: 5),
//                     // OrderTypeButton(text: "Out for delivery", index: 6),
//                   ],
//                 ),
//               ),
//             ),
//            index == 0? _buildListAll(0):_buildPending(1),
//           ],
//         ),
//       )
//     ]);
//   }
//   _buildListAll(int index) {
//     print("===================pending $index");
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child:  ParseLiveListWidget<ParseObject>(
//           query: Provider.of<ParseProvider>(context, listen: false).getQueryBuilder!,
//           key: UniqueKey(),
//           duration: const Duration(seconds: 1),
//           reverse: false,
//           shrinkWrap: true,
//           childBuilder: (BuildContext context,
//               ParseLiveListElementSnapshot<ParseObject> snapshot) {
//             //print("reload");
//             if (snapshot.failed) {
//               return const Text('something went wrong!');
//             } else if (snapshot.hasData) {
//               print("status : ${snapshot.loadedData!.get("status")}");
//               Order order = Order.fromJson(jsonDecode(snapshot!.loadedData.toString()));
//               return OrderWidget(orderModel: order,);
//             }else{
//               return const Center(child: ListTile(
//                 leading: CircularProgressIndicator(),
//               )
//               );
//             }
//           }),
//     );
//   }
//
//   _buildPending(int index) {
//     print("===================pending $index");
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child:  ParseLiveListWidget<ParseObject>(
//           query: Provider.of<ParseProvider>(context, listen: false).getQueryBuilder!,
//           key: UniqueKey(),
//           duration: const Duration(seconds: 1),
//           reverse: false,
//           shrinkWrap: true,
//           childBuilder: (BuildContext context,
//               ParseLiveListElementSnapshot<ParseObject> snapshot) {
//             //print("reload");
//             if (snapshot.failed) {
//               return const Text('something went wrong!');
//             } else if (snapshot.hasData) {
//               print("status : ${snapshot.loadedData!.get("status")}");
//               Order order = Order.fromJson(jsonDecode(snapshot!.loadedData.toString()));
//               return OrderWidget(orderModel: order,);
//             }else{
//               return const Center(child: ListTile(
//                 leading: CircularProgressIndicator(),
//               )
//               );
//             }
//           }),
//     );
//   }
// }
//
// class OrderTypeButton extends StatelessWidget {
//   final String text;
//   final int index;
//   Function click;
//
//   OrderTypeButton({required this.text, required this.index, required this.click});
//
//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.transparent,
//       child: InkWell(
//           onTap: () {
//              Provider.of<ParseProvider>(context, listen: false).setIndex(context, index);
//           },
//          child: Consumer<ParseProvider>(builder: (context, order, child) {
//            return Container(
//              height: 40,
//              padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE,),
//              alignment: Alignment.center,
//              decoration: BoxDecoration(
//                color: order.orderTypeIndex == index ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
//                borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_LARGE),
//              ),
//              child: Text(text, style: order.orderTypeIndex == index ? titilliumBold.copyWith(color: order.orderTypeIndex == index
//                  ? Colors.white : Colors.black):
//              robotoRegular.copyWith(color: order.orderTypeIndex == index
//                  ? Colors.white : Colors.black)),
//            );
//          },
//          ),
//       ),
//     );
//   }
// }
