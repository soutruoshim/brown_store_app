import 'package:flutter/material.dart';

import '../../utill/dimensions.dart';
import '../../utill/styles.dart';


class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String btnTxt;
  final bool isColor;
  final Color backgroundColor;
  final Color fontColor;
  final double borderRadius;

  CustomButton({required this.onTap,  this.btnTxt = "", required this.backgroundColor, this.isColor = false,  this.fontColor = Colors.white, required this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isColor? backgroundColor : backgroundColor != null ?
            backgroundColor : Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(borderRadius != null? borderRadius : Dimensions.PADDING_SIZE_EXTRA_SMALL)),
        child: Text(btnTxt,
            style: robotoMedium.copyWith(
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
              color: fontColor != null? fontColor : Colors.white,
            )),
      ),
    );
  }
}
