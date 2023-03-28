import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../data/model/response/base/api_response.dart';
import '../provider/auth_provider.dart';
import '../view/base/custom_snackbar.dart';
import '../view/screen/auth/auth_screen.dart';


class ApiChecker {
  static void checkApi(BuildContext context, ApiResponse apiResponse) {
    if(apiResponse.error.toString() == 'Failed to load data - status code: 401') {
      Provider.of<AuthProvider>(context,listen: false).clearSharedData();
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => AuthScreen()), (route) => false);
    }else {
      String _errorMessage;
      if (apiResponse.error is String) {
        _errorMessage = apiResponse.error.toString();
      } else {
        _errorMessage = apiResponse.error.errors[0].message;
      }
      print(_errorMessage);
      showCustomSnackBar(_errorMessage, context);
    }
  }
}

getFormatedDate(_date) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(_date.toString());
  var outputFormat = DateFormat('yyyy-MM-dd');
  return outputFormat.format(inputDate);
}

getFormatTime(_date) {
  var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  var inputDate = inputFormat.parse(_date.toString());
  var outputFormat = DateFormat('HH:mm a');
  return outputFormat.format(inputDate);
}