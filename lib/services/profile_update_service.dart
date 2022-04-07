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

class ProfileUpdateService with ChangeNotifier {
  Dio dio = new Dio();
  var profileupdate;

  Future<void> profileUpdate({
    File? uploadimageProfile,
    File? uploadimageCertificate,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String address,
    required String emergencyContactNumber,
    required String gender,
    required String age,
    required String zoomId,
    required String bmdc,
    required BuildContext context,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var userId = prefs.getString('doctorId');
    print(userId);
    // print(token);
    // print('token');
    print(uploadimageProfile);
    print(uploadimageCertificate);
    // print(fileC);

    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';

    try {
      String baseimageProfile;
      if (uploadimageProfile == null) {
        baseimageProfile = "";
      } else {
        List<int> imageBytesProfile = uploadimageProfile.readAsBytesSync();
        baseimageProfile = base64Encode(imageBytesProfile);
        print('profile');
        print(baseimageProfile);
      }

      //
      String baseimageCertificate;
      if (uploadimageCertificate == null) {
        baseimageCertificate = "";
      } else {
        List<int> imageBytesCertificate =
            uploadimageCertificate.readAsBytesSync();
        baseimageCertificate = base64Encode(imageBytesCertificate);
        print('Certificate');
        print(baseimageCertificate);
      }

      var formData = FormData.fromMap({
        'user_id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'height_ft': "",
        'height_inch': "",
        'weight': "",
        'email': email,
        'phone': phone,
        'address': address,
        'emergency_contact_number': emergencyContactNumber,
        'image': baseimageProfile,
        'password': "",
        'gender': gender,
        'age': age,
        'bmdc_certificate': baseimageCertificate,
        'zoom_id': zoomId,
        'bmdc': bmdc,
        //
        // 'user_id': userId,
        // 'first_name': "Md",
        // 'last_name': "Hossain",
        // 'height_ft': "",
        // 'height_inch': "",
        // 'weight': "",
        // 'email': "testah@gmail.com",
        // 'phone': "01689484745",
        // 'address': "",
        // 'emergency_contact_number': "",
        // 'image': baseimageProfile,
        // 'password': "",
        // 'gender': "Me",
        // 'age': "25",
        // 'bmdc_certificate': baseimageCertificate,
        // 'zoom_id': "test",
        // 'bmdc': "test",
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
      print(responsebody['error']);
      if (responsebody['error'] == false) {
        notifyListeners();
        OthersHelper().showToast(responsebody["msg"], allColor.backGroundColor);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Profile()));
      } else {
        notifyListeners();
        OthersHelper().showToast(responsebody["msg"], allColor.backGroundColor);
      }
      // if (responsebody["message"] != null) {
      //   if (responsebody["message"] == "You are Product Successfuly Added") {
      //     OthersHelper()
      //         .showToast(responsebody["message"], allColor.backGroundColor);
      //     notifyListeners();
      //     Navigator.pushReplacement(context,
      //         MaterialPageRoute(builder: (context) => const HomePage()));
      //     // signupDetails = LoginModel.fromJson(jsonDecode(response.body));
      //   } else {
      //     OthersHelper()
      //         .showToast(responsebody["message"], allColor.backGroundColor);
      //     notifyListeners();
      //   }
      // } else {
      //   OthersHelper().showToast(
      //       "Something went wrong! try again", allColor.backGroundColor);
      //   notifyListeners();
      // }
    } catch (e) {
      print('EEEEEEEEEEEEEEEE');
      print(e);
    }
  }
}
