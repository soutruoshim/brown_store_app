import 'package:flutter/material.dart';

import '../../utill/dimensions.dart';
import '../../utill/images.dart';
import '../../utill/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBackButtonExist;
  final Function? onBackPressed;
  final Function? filter;
  final Function? switchAction;
  final bool isAction;
  final bool isSwitch;
  final bool isCart;
  final bool activeProduct;
  final bool activeDelivery;
  final bool productSwitch;
  final bool reviewSwitch;
  final int? index;
  final bool isTooltip;
  final Widget? widget;

  CustomAppBar({required this.title,
    this.isBackButtonExist = true,
    this.onBackPressed,
    this.isAction = false,
    this.filter,
    this.isSwitch = false,
    this.switchAction,
    this.isCart = false,
    this.activeProduct = false,
    this.productSwitch = false,
    this.activeDelivery = false,
    this.reviewSwitch = false,
    this.index,
    this.isTooltip = false, this.widget});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color:
          Theme.of(context).primaryColor.withOpacity(.10),
            offset: Offset(0, 2.0), blurRadius: 4.0,
          )
        ]),
        child: AppBar(
          shadowColor: Theme.of(context).primaryColor.withOpacity(.5),
          titleSpacing: 0,
          title: Text(title, style: titilliumSemiBold.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE,
              color: Theme.of(context).textTheme.bodyText1!.color)),
          centerTitle: true,
          leading: isBackButtonExist ? IconButton(icon: Icon(Icons.arrow_back_ios, size: Dimensions.ICON_SIZE_DEFAULT),
              color: Theme.of(context).textTheme.bodyText1!.color,
              onPressed: () => onBackPressed != null ? onBackPressed!() : Navigator.pop(context)) :
          IconButton(icon: Image.asset(Images.logo, color : Theme.of(context).primaryColor,scale: 5,), onPressed: () {  },),
          backgroundColor: Theme.of(context).highlightColor,
          elevation: 0,
          actions: [],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
