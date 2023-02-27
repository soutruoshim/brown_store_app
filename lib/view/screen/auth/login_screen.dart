import 'package:brown_store/view/base/custom_dropdown.dart';
import 'package:flutter/material.dart';

import '../../../utill/dimensions.dart';
import '../../../utill/images.dart';
import '../../base/custom_button.dart';
import '../../base/textfeild/custom_text_feild.dart';
import '../dashboard/dashboard_screen.dart';
class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  FocusNode _emailFocus = FocusNode();
  FocusNode _passwordFocus = FocusNode();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKeyLogin;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_LARGE,
                    bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: CustomDropdown()),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                Container(margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE,
                    right: Dimensions.PADDING_SIZE_LARGE, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                    child: CustomTextField(
                      border: true,
                      isPassword: true,
                      //prefixIconImage: Images.lock,
                      hintText: "Password",
                      focusNode: _passwordFocus,
                      textInputAction: TextInputAction.done,
                      controller: _passwordController,
                      onChanged: (text){},
                    )),
                SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Container(margin: EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_LARGE,
                    bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: CustomDropdown()),
                SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: CustomButton(
                    borderRadius: 100,
                    backgroundColor: Theme.of(context).primaryColor,
                    btnTxt: "Login",
                    onTap: () {
                        print("clicked");
                    },
                  ),
                )
              ],
            ),
          ),
        );

  }
}
