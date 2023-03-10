import 'package:brown_store/data/model/body/login_model.dart';
import 'package:brown_store/view/base/custom_dropdown.dart';
import 'package:brown_store/view/screen/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/device_info_service.dart';
import '../../../helper/security_helper.dart';
import '../../../provider/auth_provider.dart';
import '../../../utill/dimensions.dart';
import '../../base/custom_button.dart';
import '../../base/custom_snackbar.dart';
import '../../base/textfeild/custom_text_feild.dart';
class SignInWidget extends StatefulWidget {
  const SignInWidget({Key? key}) : super(key: key);

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  //FocusNode _passwordFocus = FocusNode();

  late TextEditingController _passwordController;
  late GlobalKey<FormState> _formKeyLogin;

  final List<String> _accounts = ["Cashier AM 1", "Cashier AM 2", "Cashier AM 3", "Cashier PM 1", "Cashier PM 2", "Cashier PM 3"];
  final List<String> _stores = ["Store1", "Store2", "Store3"];
   String _accountSelected = "";
   String _storeSelected = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _formKeyLogin = GlobalKey<FormState>();
    _passwordController = TextEditingController();

  }
  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).isActiveRememberMe;

    return Consumer<AuthProvider>(
        builder: (context, authProvider, child) => Form(
        key: _formKeyLogin,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: Dimensions.PADDING_SIZE_SMALL),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(margin: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_LARGE,
                    bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: CustomDropdown(
                      border: true,
                      hintText: "Select Account",
                      items: _accounts,
                      onChanged: (text){
                        setState(() {
                          _accountSelected = text;
                        });
                      },
                    )),

                const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),

                Container(margin: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE,
                    right: Dimensions.PADDING_SIZE_LARGE, bottom: Dimensions.PADDING_SIZE_DEFAULT),
                    child: CustomTextField(
                      border: true,
                      isPassword: true,
                      //prefixIconImage: Images.lock,
                      hintText: "Password",
                      //focusNode: _passwordFocus,
                      textInputAction: TextInputAction.done,
                      controller: _passwordController,
                      onChanged: (text){},
                    )),
                const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                Container(margin: const EdgeInsets.only(left: Dimensions.PADDING_SIZE_LARGE, right: Dimensions.PADDING_SIZE_LARGE,
                    bottom: Dimensions.PADDING_SIZE_SMALL),
                    child: CustomDropdown(
                      border: true,
                      hintText: "Select Store",
                      items: _stores,
                      onChanged: (text){
                        _storeSelected = text;
                      },)),
                const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 70),
                  child: CustomButton(
                    borderRadius: 100,
                    backgroundColor: Theme.of(context).primaryColor,
                    btnTxt: "Login",
                    onTap: ()  {
                      String dev_kid = "420161780354106364";
                      String user_id =  _accountSelected;
                      String user_name = "Housan Sokrey";
                      String password = _passwordController.text.trim();
                      String store_id = "520180843155605044";

                      //String phoneEmail = "sovanrath.phorn@codingate.com";
                      // String data_encs = SecurityHelper.getDataEncryptionKey(
                      //   dataTypes: [
                      //        "${DeviceInfoService().id + DeviceInfoService().os + DeviceInfoService().info + DeviceInfoService().name + phoneEmail}LOGIN_ACCOUNT",
                      //   ],
                      // );
                      // print("enc= $data_encs");

                      String data_enc = "MjAyMzAzdbVRySceSNZoQSt0eUglmjoenrKxBFfNagrjwrZhbIetKZd0ZMQjCi53nfp82qK3fBjIdEBkbz2jzDobH/8zWA==";

                      // if (user_id.isEmpty) {
                      //   showCustomSnackBar("Select User id", context);
                      // }else if (password.isEmpty) {
                      //   showCustomSnackBar("Enter Password", context);
                      // }else {authProvider.login(context,LoginModel(devKid: dev_kid, username: user_name ,userId: user_id, password: password, storeId: store_id, dataEnc: data_enc)).then((status) async {
                      //   if (status.response!.statusCode == 200) {
                      //
                      //     if (authProvider.isActiveRememberMe) {
                      //       // authProvider.saveUserNumberAndPassword(password);
                      //     } else {
                      //       // authProvider.clearUserEmailAndPassword();
                      //     }
                      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DashboardScreen()));
                      //   }
                      // });
                      // }

                      String _password = _passwordController.text.trim();
                      print("Account: $_accountSelected, Pass: $_password, Store: $_storeSelected");

                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const DashboardScreen()));
                    },
                  ),
                )
              ],
            ),
          ),
        )),
    );

  }
}
