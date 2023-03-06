import 'dart:async';
import 'package:brown_store/provider/report_parse_provider.dart';
import 'package:brown_store/view/screen/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../helper/network_info.dart';
import '../../provider/auth_provider.dart';
import '../../provider/parse_provider.dart';
import '../../provider/splash_provider.dart';
import '../../utill/images.dart';
import 'dashboard/dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    NetworkInfo.checkConnectivity(context);
    Provider.of<SplashProvider>(context, listen: false)
        .initConfig(context)
        .then((bool isSuccess) {
      if (isSuccess) {
        Provider.of<SplashProvider>(context, listen: false)
            .initShippingTypeList(context, '');

        Provider.of<ParseProvider>(context, listen: false).getOrderListAll(context, 0);
        Provider.of<ParseProvider>(context, listen: false).getOrderListPending(context, 1);
        Provider.of<ParseProvider>(context, listen: false).getOrderListRequestCancel(context, -1);

        Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 1);
        Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 2);
        Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 3);
        Provider.of<ReportParseProvider>(context, listen: false).getPendingOrderTotal(context, 4);

        Timer(const Duration(seconds: 2), () {
          if (Provider.of<AuthProvider>(context, listen: false).isLoggedIn()) {
            Provider.of<AuthProvider>(context, listen: false)
                .updateToken(context);

            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const DashboardScreen()));
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => AuthScreen()));
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      clipBehavior: Clip.none,
      children: [
        Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Hero(
                  tag: 'logo',
                  child: Image.asset(Images.white_logo, fit: BoxFit.cover)),
            ],
          ),
        ),
      ],
    ));
  }
}
