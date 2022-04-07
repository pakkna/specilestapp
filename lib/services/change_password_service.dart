import 'dart:convert';
import 'dart:io';
import 'package:design/helper/others_helper.dart';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/home/home_page.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/screen/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

import '../constants/api.dart';

class ChangePasswordService with ChangeNotifier {
  Dio dio = new Dio();
  var changepassword;
  bool isloading = false;
  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  Future<void> changePassword(
    String passsword,
    BuildContext context,
  ) async {
    //  setLoadingTrue();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var userId = prefs.getString('doctorId');
    print(userId);
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';

    try {
      var formData = FormData.fromMap({
        'user_id': userId,
        'first_name': "",
        'last_name': "",
        'height_ft': "",
        'height_inch': "",
        'weight': "",
        'email': "",
        'phone': "",
        'address': "",
        'emergency_contact_number': "",
        'image': "",
        'password': passsword,
        'gender': "",
        'age': "",
        'bmdc_certificate': "",
        'zoom_id': "",
        'bmdc': "",
      });
      var response =
          await dio.post("https://dev.kambaiihealth.com/api/profile_update",
              data: formData,
              options: Options(
                // followRedirects: false,
                // validateStatus: (status) => true,
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                  'Authorization': 'Bearer $token',
                },
              ));
      print(response);
      var responsebody = response.data;
      print(responsebody['msg']);

      if (responsebody["error"] == false) {
        //   signupDetails = SignUpModel.fromJson(jsonDecode(response.body));

        OthersHelper().showToast("Change successful", allColor.backGroundColor);

        setLoadingFalse();

        Navigator.push(
          context,
          MaterialPageRoute<void>(
            builder: (BuildContext context) => const Profile(),
          ),
        );

        notifyListeners();
      } else {
        //registration failed

        setLoadingFalse();
        OthersHelper().showToast(responsebody["msg"], allColor.redColor);
      }
    } catch (e) {
      print('EEEEEEEEEEEEEEEE');
      print(e);
    }
  }
}
