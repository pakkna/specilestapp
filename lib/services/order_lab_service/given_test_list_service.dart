import 'dart:convert';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api.dart';

class GivenTestListService with ChangeNotifier {
  var givenTestList;

  Future<void> fetchGivenTestList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    SharedPreferences pref = await SharedPreferences.getInstance();
    //var visitId = pref.getString('vId');
    var patientId = pref.getString('patientId');
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';

    // print('token');
    // print(token);

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    var data = jsonEncode({
      'user_id': patientId,
    });

    var response = await http.post(
        Uri.parse('${Api().baseUrl}/order_lab_by_doctor'),
        body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);
    print(responsebody);

    if (responsebody["error"] == false) {
      givenTestList = GivenTestListModel.fromJson(jsonDecode(response.body));
      // print(givenTestList);

      notifyListeners();
    } else {
      //something went wrong

      givenTestList = "error";
    }

    print(responsebody);
    print('givenTestList');
  }
}
