import 'dart:convert';
import 'package:design/models/order_lab_model/all_order_lab_report_name_model.dart';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api.dart';

class AllLabReportNameService with ChangeNotifier {
  var allLabReportName;
  List<String> testName = [];

  fetchAllLabReportName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODQwOTI1LCJuYmYiOjE2NDY4NDA5MjUsImp0aSI6InFQczhzcGgyUlF2OXVldjQiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.qyKi40YPygjKpKqPN1qbFMn8WaXpOQf_DEiVX4NcKrQ';

    // print('token');
    // print(token);

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    // var response = await http
    //     .get(Uri.parse('${Api().baseUrl}/visit-summary/718'), headers: header);

    var response =
        await http.get(Uri.parse('${Api().baseUrl}/all_lab_test_list'),
            // body: data,
            headers: header);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    print('all');
    // notifyListeners();

    if (response.statusCode == 200) {
      allLabReportName = AllLabReportName.fromJson(jsonDecode(response.body));
      for (int i = 0; i < allLabReportName.data.length; i++) {
        testName.add(allLabReportName.data[i].testname);
      }
      print('test Name');
      print(testName);

      notifyListeners();
    } else {
      //something went wrong

      allLabReportName = "error";
    }
  }
}
