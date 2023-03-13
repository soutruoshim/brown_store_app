
import 'package:brown_store/utill/strings_manager.dart';
import 'package:flutter/material.dart';
import '../../utill/dimensions.dart';
import '../../utill/images.dart';
import '../../utill/styles.dart';
import 'custom_button.dart';
class ConfirmationDialog extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final Function onYesPressed;
  final bool isLogOut;
  final bool refund;

  ConfirmationDialog({required this.icon, required this.title, required this.description, required this.onYesPressed, this.isLogOut = false, this.refund = false});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.PADDING_SIZE_SMALL)),
        insetPadding: EdgeInsets.all(30),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: SizedBox(width: 500, child: Padding(
            padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Column(mainAxisSize: MainAxisSize.min, children: [

              Container(
                child: Padding(
                  padding: EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
                  child: Image.asset(Images.logo_with_app_name, width: 100, height:100),
                ),
              ),

              title != null ? Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_LARGE),
                child: Text(
                  title, textAlign: TextAlign.center,
                  style: robotoRegular.copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE, color: Theme.of(context).primaryColor),
                ),
              ) : SizedBox(),

              SizedBox(height: Dimensions.PADDING_SIZE_LARGE),

              Row(
                children: [
                  Expanded(child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: CustomButton(
                      btnTxt: AppStrings.no_string,
                      backgroundColor: Colors.red,
                      isColor: true, onTap: () => Navigator.pop(context), borderRadius: 20,
                    ),
                  )),
                  SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
                  Expanded(child: CustomButton(
                    btnTxt: AppStrings.confirm,
                    onTap: () =>  onYesPressed(),
                    backgroundColor: Colors.green,
                    isColor: true, borderRadius: 20,
                  )),
                ],
              ),

            ])),
        ));
  }
}