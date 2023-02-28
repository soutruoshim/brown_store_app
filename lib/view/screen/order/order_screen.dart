import 'package:flutter/material.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../base/custom_app_bar.dart';
import '../../base/paginated_list_view.dart';
import 'widget/order_widget.dart';

class OrderScreen extends StatefulWidget {
  final bool isBacButtonExist;
  final bool fromHome;

  OrderScreen({this.isBacButtonExist = false, this.fromHome = false});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  ScrollController scrollController = ScrollController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
        pinned: true,
        floating: true,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).highlightColor,
        title: Image.asset(Images.logo_with_app_name, height: 35),
      ),
      SliverToBoxAdapter(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.PADDING_SIZE_SMALL,
                  vertical: Dimensions.PADDING_SIZE_SMALL),
              child: SizedBox(
                height: 40,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    OrderTypeButton(
                      text: "All",
                      index: 0,
                    ),
                    const SizedBox(width: 5),
                    OrderTypeButton(text: "Pending", index: 1),
                    const SizedBox(width: 5),
                    OrderTypeButton(text: "Confirmed", index: 2),
                    const SizedBox(width: 5),
                    OrderTypeButton(text: "Processing", index: 3),
                    const SizedBox(width: 5),
                    OrderTypeButton(text: "Delivered", index: 4),
                    const SizedBox(width: 5),
                    OrderTypeButton(text: "cancelled", index: 5),
                    const SizedBox(width: 5),
                    OrderTypeButton(text: "Out for delivery", index: 6),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: RefreshIndicator(
                onRefresh: () async {
                  //await order.getOrderList(context,1, order.orderType);
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: PaginatedListView(
                    reverse: false,
                    scrollController: scrollController,
                    totalSize: 20,
                    offset: 6,
                    onPaginate: (int offset) async {
                      //await order.getOrderList( context,offset,order.orderType, reload: false);
                    },
                    itemView: ListView.builder(
                      itemCount: 10,
                      padding: EdgeInsets.all(0),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return OrderWidget(
                      
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )
    ]);
  }
}

class OrderTypeButton extends StatelessWidget {
  final String text;
  final int index;

  OrderTypeButton({required this.text, required this.index});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
          onTap: () {
            //Provider.of<OrderProvider>(context, listen: false).setIndex(context, index);
          },
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(
              horizontal: Dimensions.PADDING_SIZE_LARGE,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: 0 == index
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).hintColor,
              borderRadius:
                  BorderRadius.circular(Dimensions.PADDING_SIZE_LARGE),
            ),
            child: Text(text,
                style: 0 == index
                    ? titilliumBold.copyWith(
                        color: 0 == index ? Colors.white : Colors.black)
                    : robotoRegular.copyWith(
                        color: 0 == index ? Colors.white : Colors.black)),
          )),
    );
  }
}
