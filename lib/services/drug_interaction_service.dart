import 'dart:convert';

import 'package:design/models/lab_report_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';

class DrugInteractionService with ChangeNotifier {
  var drugInteractionData;

  bool isDataExist = false;

  bool isloading = false;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  fetchDrugInteraction(
    String medNameOne,
    String medNameTwo,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    // var data = jsonEncode({
    //   'medinime_nam[]': medNameOne,
    //   'medinime_nam[]': medNameTwo,
    // });

    Future.delayed(const Duration(milliseconds: 200), () {
      setLoadingTrue();
    });

    // var response = await http
    //     .get(Uri.parse('${Api().baseUrl}/visit-summary/718'), headers: header);

    var response = await http.get(
        Uri.parse(
            '${Api().baseUrl}/getGenericName?medinime_nam[]=$medNameOne&medinime_nam[]=$medNameTwo'),
        headers: header);

    var responsebody = jsonDecode(response.body);

    if (responsebody["error"] == false) {
      // drugInteractionData = LabReportModel.fromJson(jsonDecode(response.body));

      drugInteractionData = responsebody;
      //check if these field exist in json data
      isDataExist =
          responsebody['data']['data'].containsKey('fullInteractionTypeGroup');

      setLoadingFalse();
      notifyListeners();
    } else {
      //something went wrong

      drugInteractionData = "error";
      setLoadingFalse();
    }
  }
}
