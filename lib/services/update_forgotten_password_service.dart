import 'dart:convert';

import 'package:design/screen/auth/login.dart';
import 'package:design/screen/forgot_pass/find_account.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/services/forgot_password_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';
import '../helper/others_helper.dart';
import '../models/login_model.dart';
import '../screen/home/home_page.dart';

class UpdateForgottenPasswordService with ChangeNotifier {
  var userId;

  bool isloading = false;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  updatePass(
    String otpNumber,
    String password,
    BuildContext context,
  ) async {
    var userId =
        Provider.of<ForgotPasswordService>(context, listen: false).userId;

    setLoadingTrue();
    var data = jsonEncode({
      'userid': userId,
      'password': password,
      'otp': otpNumber,
    });
    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json"
    };

    var response = await http.post(
        Uri.parse('${Api().baseUrl}/code_combination'),
        body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);

    if (responsebody["error"] == false) {
      OthersHelper()
          .showToast('${responsebody['msg']}', allColor.backGroundColor);
      setLoadingFalse();

      Navigator.pop(context);
      Navigator.pop(context);

      notifyListeners();
    } else {
      setLoadingFalse();
      OthersHelper().showToast("Invalid code!", allColor.redColor);
    }
  }
}
