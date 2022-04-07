import 'dart:convert';

import 'package:design/screen/forgot_pass/find_account.dart';
import 'package:design/screen/get_started.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';
import '../helper/others_helper.dart';
import '../models/login_model.dart';
import '../screen/home/home_page.dart';

class ForgotPasswordService with ChangeNotifier {
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

  findPhone(
    String phone,
    BuildContext context,
  ) async {
    setLoadingTrue();
    var data = jsonEncode({
      'username': phone,
    });
    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json"
    };

    var response = await http.post(
        Uri.parse('${Api().baseUrl}/match_mobile_number'),
        body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);

    if (responsebody["error"] == false) {
      userId = responsebody['data']['userid'];

      debugPrint('user id is $userId');

      OthersHelper()
          .showToast('${responsebody['msg']}', allColor.backGroundColor);

      notifyListeners();
      setLoadingFalse();

      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const FindAccount(),
        ),
      );

      notifyListeners();
    } else {
      //Account not found

      setLoadingFalse();
      OthersHelper().showToast("No account found!", allColor.redColor);
    }
  }
}
