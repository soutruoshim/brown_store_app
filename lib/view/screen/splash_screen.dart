import 'dart:async';
import 'package:brown_store/view/screen/auth/auth_screen.dart';
import 'package:flutter/material.dart';
import '../../utill/images.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () {
        //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => DashboardScreen()));
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => AuthScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          clipBehavior: Clip.none, children: [
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: CustomPaint(
          //     painter: SplashPainter(),
          //   ),
          // ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Hero(
                    tag:'logo',
                    child: Image.asset(Images.white_logo,
                        fit: BoxFit.cover)),
              ],
            ),
          ),
        ],
        )
    );
  }
}
