import 'package:brown_store/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../order/order_screen.dart';
import '../refund/refund_screen.dart';
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  late List<Widget> _screens;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _screens = [
      HomeScreen(),
      OrderScreen(),
      RefundScreen(),
    ];

  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: ColorResources.HINT_TEXT_COLOR,
          selectedFontSize: Dimensions.FONT_SIZE_SMALL,
          unselectedFontSize: Dimensions.FONT_SIZE_SMALL,
          selectedLabelStyle: robotoBold,
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            _barItem(Images.home, "Home", 0),
            _barItem(Images.order, "Order", 1),
            _barItem(Images.refund, "Refund", 2),
            _barItem(Images.menu, "More", 3)
          ],
          onTap: (int index) {
            if (index != 3) {
              setState(() {
                _setPage(index);
              });
            } else {
              // showModalBottomSheet(
              //     context: context,
              //     isScrollControlled: true,
              //     backgroundColor: Colors.transparent,
              //     builder: (con) => MenuBottomSheet()
              // );
            }
          },
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }
  BottomNavigationBarItem _barItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom : Dimensions.PADDING_SIZE_EXTRA_SMALL),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(width: index == _pageIndex ? Dimensions.ICON_SIZE_LARGE : Dimensions.ICON_SIZE_MEDIUM,
                child: Image.asset(icon, color: index == _pageIndex ?
                Theme.of(context).primaryColor : ColorResources.HINT_TEXT_COLOR,)),

          ],
        ),
      ),
      label: label,

    );
  }
  void _setPage(int pageIndex) {
    setState(() {
      _pageController.jumpToPage(pageIndex);
      _pageIndex = pageIndex;
    });
  }
}
