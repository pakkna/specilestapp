import 'dart:convert';
import 'package:design/constants/api.dart';
import 'package:design/helper/others_helper.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/provisional_diagnosis/provisional_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DiagnosisCreateService with ChangeNotifier {
  var diagnosiscreate;

  Future<void> diagnosisCreate(String provisinalDiagnosis,
      String provisinalNote, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var specilestId = prefs.getString('specilestId');
    SharedPreferences pref = await SharedPreferences.getInstance();
    var visitId = pref.getString('vId');
    var patientId = pref.getString('patientId');
    print('visitId');
    print(visitId);
    print("patientId");
    print(patientId);

    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    var data = jsonEncode({
      'doctor_id': specilestId,
      'patient_id': patientId,
      'provisinal_note': provisinalNote,
      'provisinal_diagnosis': provisinalDiagnosis,
      'visit_id': visitId
    });

    var response = await http.post(
        Uri.parse('${Api().baseUrl}/provisinal_diagnosis_create'),
        body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);

    print('Diagnosis Create');
    print(responsebody);

    if (responsebody["error"] == false) {
      //   storeOrderLabtest = GivenTestListModel.fromJson(jsonDecode(response.body));
      print(responsebody["msg"]);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const ProvitionalDiagnosis()));
      OthersHelper().showToast("Adding successful", allColor.backGroundColor);

      notifyListeners();
    } else {
      //something went wrong

      diagnosiscreate = "error";
    }
  }
}
