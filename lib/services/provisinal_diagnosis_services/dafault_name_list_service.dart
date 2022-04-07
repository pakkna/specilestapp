import 'dart:convert';
import 'package:design/constants/api.dart';
import 'package:design/models/provisional_diagnosis_model/provisional_diagnosis_name_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DefaultNameListService with ChangeNotifier {
  var defaultnamelist;
  List<String> diagnosisNameList = [];

  defaultNameList() async {
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

    var response = await http.get(
        Uri.parse('${Api().baseUrl}/default_provisinal_diagnosis_name'),
        // body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);
    print('Diagnosis response');
    print(responsebody);

    if (response.statusCode == 200) {
      defaultnamelist =
          ProvisinalDiagnosisNameModel.fromJson(jsonDecode(response.body));
      for (int i = 0; i < defaultnamelist.data.length; i++) {
        diagnosisNameList.add(defaultnamelist.data[i]);
      }
      print('Diagnosis Name');
      print(diagnosisNameList);

      notifyListeners();
    } else {
      //something went wrong

      defaultnamelist = "error";
    }
  }
}
