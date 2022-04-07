import 'dart:convert';

import 'package:design/models/lab_report_model.dart';
import 'package:design/models/med_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';

class MedicineListService with ChangeNotifier {
  var medList;

  bool isloading = false;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  fetchMedList() async {
    if (medList == null || medList == "error") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');

      var header = {
        //if header type is application/json then the data should be in jsonEncode method
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };

      var data = jsonEncode({
        'user_id': "718",
      });

      Future.delayed(const Duration(milliseconds: 200), () {
        setLoadingTrue();
      });

      // var response = await http
      //     .get(Uri.parse('${Api().baseUrl}/visit-summary/718'), headers: header);

      var response = await http.post(
          Uri.parse('${Api().baseUrl}/view_medicines'),
          body: data,
          headers: header);

      var responsebody = jsonDecode(response.body);
      print(responsebody);
      if (responsebody["error"] == false) {
        medList = MedicineListModel.fromJson(responsebody);

        setLoadingFalse();
        notifyListeners();
      } else {
        //something went wrong
        medList = "error";
        setLoadingFalse();
      }
    }
  }
}
