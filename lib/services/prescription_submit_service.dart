import 'dart:convert';
// import 'package:design/helper/others_helper.dart';
// import 'package:design/screen/get_started.dart';
// import 'package:design/screen/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api.dart';
import '../helper/others_helper.dart';
import '../screen/get_started.dart';
import '../screen/home/home_page.dart';

class PrescriptionSubmitService with ChangeNotifier {
  var prescriptionsubmit;

  Future<void> prescriptionSubmit(
    String? patientTalk,
    String? advice,
    BuildContext context,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var specilestId = prefs.getString('specilestId');
    SharedPreferences pref = await SharedPreferences.getInstance();
    var visitId = pref.getString('vId');
    var patientId = pref.getString('patientId');
    // print('visitId');
    // print(visitId);
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';
    if (patientTalk!.isEmpty) {
      patientTalk = '';
    }
    if (advice!.isEmpty) {
      advice = '';
    }

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    var data = jsonEncode({
      'patient_id': patientId,
      'visit_id': visitId,
      'advice': advice,
      'doctor_id': specilestId,
      'patient_talk': patientTalk,
    });

    var response = await http.post(
        Uri.parse('${Api().baseUrl}/prescription_data_submit'),
        body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);

    // print(responsebody);
    // print('prescripttion submit');
    // print(patientTalk);
    // print(advice);

    if (responsebody["error"] == false) {
      //   storeOrderLabtest = GivenTestListModel.fromJson(jsonDecode(response.body));

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      OthersHelper().showToast(
          "Prescription submit successful", allColor.backGroundColor);

      notifyListeners();
    } else {
      //something went wrong

      prescriptionsubmit = "error";
    }
  }
}
