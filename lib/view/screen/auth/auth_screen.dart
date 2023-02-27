import 'package:flutter/material.dart';

import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../../utill/styles.dart';
import 'login_screen.dart';

class AuthScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding:  EdgeInsets.only(top : MediaQuery.of(context).size.height/12,
                      bottom: 38),
                  child: Column(
                    children: [
                      Hero(
                          tag: 'logo',
                          child: Padding(
                            padding: const EdgeInsets.only(top : Dimensions.PADDING_SIZE_EXTRA_LARGE),
                            child: Image.asset(Images.brown_login,width: 80),
                          )),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Store",
                              style: robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE_TWENTY)),
                          SizedBox(width: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                          Text("App",
                              style: robotoMedium.copyWith(color: Theme.of(context).primaryColor,
                                  fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE_TWENTY)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],),

            Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                child: Text("Login",
                    style: titilliumBold.copyWith(fontSize: Dimensions.FONT_SIZE_OVER_LARGE))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_DEFAULT,vertical: Dimensions.PADDING_SIZE_SMALL),
              child: Text("Management store application",
                  style: titilliumRegular.copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT, color: Theme.of(context).hintColor)),
            ),

            SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

            SignInWidget()
          ],
        ),
      ),
    );
  }
}