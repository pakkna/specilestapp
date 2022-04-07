import 'dart:convert';

import 'package:design/models/lab_report_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';

class LabReportService with ChangeNotifier {
  var labReports;

  bool isloading = false;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  fetchPatientDetails(
      //String id,
      ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    SharedPreferences pref = await SharedPreferences.getInstance();
    //  var visitId = pref.getString('vId');
    var patientId = pref.getString('patientId');

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    Future.delayed(const Duration(milliseconds: 200), () {
      setLoadingTrue();
    });

    // var response = await http
    //     .get(Uri.parse('${Api().baseUrl}/visit-summary/718'), headers: header);

    var response =
        await http.get(Uri.parse('${Api().baseUrl}/test_list/$patientId'),
            // body: data,
            headers: header);

    var responsebody = jsonDecode(response.body);
    print(responsebody);

    if (responsebody["error"] == false) {
      labReports = LabReportModel.fromJson(jsonDecode(response.body));

      setLoadingFalse();
      notifyListeners();
    } else {
      //something went wrong

      labReports = "error";

      setLoadingFalse();
    }
  }
}
