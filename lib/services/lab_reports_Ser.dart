import 'dart:convert';

import 'package:design/models/lab_report_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';

class LabReportSer with ChangeNotifier {
  var labReports;

  Future<void> fetchLabReport() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    //test_list/718'
//all_lab_test_list
    var response =
        await http.get(Uri.parse('${Api().baseUrl}/delete_order_lab/112'),
            // body: data,
            headers: header);

    var responsebody = jsonDecode(response.body);
    print(responsebody);
    // if (responsebody["error"] == false) {
    //   labReports = LabReportModel.fromJson(jsonDecode(response.body));
    // }
  }
}
