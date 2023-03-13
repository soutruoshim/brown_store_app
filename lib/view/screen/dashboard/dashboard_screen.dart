import 'package:brown_store/view/screen/product/product_screen.dart';
import 'package:brown_store/view/screen/report/report_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:provider/provider.dart';
import '../../../provider/auth_provider.dart';
import '../../../utill/color_resources.dart';
import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import '../../base/confirmation_dialog.dart';
import '../auth/auth_screen.dart';
import '../order/order_screen.dart';

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
        OrderScreen(),
        //OrderScreen(),
        ProductScreen(),
        ReportScreen(),
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
            _barItem(Images.home, "Order", 0),
            _barItem(Images.order, "Product", 1),
            _barItem(Images.refund, "Report", 2),
            _barItem(Images.menu, "More", 3)
          ],
          onTap: (int index) {
            if (index != 3) {
              setState(() {
                _setPage(index);
              });
            } else {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (con) => _buildMoreMenu()
              );
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

  _buildMoreMenu(){
    return  Container(
      margin: Device.get().isTablet ? EdgeInsets.only(right: MediaQuery.of(context).size.height / 6, left: MediaQuery.of(context).size.height / 6): EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.only(
            topLeft:  Radius.circular(25),
            topRight: Radius.circular(25)),
      ),
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: ()=> Navigator.pop(context),
            child: Icon(Icons.keyboard_arrow_down_outlined,color: Theme.of(context).hintColor,
              size: Dimensions.ICON_SIZE_LARGE,),
          ),

          SizedBox(height: Dimensions.PADDING_SIZE_VERY_TINY),
          Container(
            margin: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Images.logo_with_app_name, height: 35),
                    GestureDetector(
                      onTap: () {
                        Provider.of<AuthProvider>(context, listen: false).logOut().then((value) =>  Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (BuildContext context) => AuthScreen())));
                      },
                      child: Text("Logout", style: TextStyle(color: Colors.red, fontSize: 16),),
                    )

                  ],
                ),
                SizedBox(height: 32,),
                Text("From humble beginnings grow great things. What started off as a staff of less than 10 has grown to a staff of over seven hundreds in just 10 years. We believe in treating our staff like family. Because when people love what they do, they do good work. The BROWN family is committed to excellence and to providing friendly and welcoming service. From our Baristas to our Chefs to our Head of Human Resources, we embrace an environment of teamwork and personal growth.",
                  style: robotoRegular.copyWith(color: Theme.of(context).hintColor),
                  maxLines: 10,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 32,),
                Text("Thank You For good service.",
                  style: robotoRegular.copyWith(color: Colors.green),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 32,),
                Center(
                  child:  Text("Copyright © 2009 - 2023 Brown Coffee", style: TextStyle(color: Color(0xFF603813), fontSize: 12),),
                )

              ],
            )
          )

        ],
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
