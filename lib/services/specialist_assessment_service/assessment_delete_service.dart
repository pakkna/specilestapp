import 'dart:convert';
import 'package:design/helper/others_helper.dart';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/screen/others_screen/specialist_assessment/special_assessment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api.dart';

class AssessmentDeleteService with ChangeNotifier {
  var deleteassessment;

  Future<void> deleteAssessment(String noteId, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    var data = jsonEncode({
      'note_id': noteId,
    });

    var response = await http.post(
        Uri.parse('${Api().baseUrl}/doctor_note_delete'),
        body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);

    print(responsebody);
    print('doctor_note_delete');

    if (responsebody["error"] == false) {
      //   // deleteorderlab = AllLabReportName.fromJson(jsonDecode(response.body));

      OthersHelper().showToast("Delete successful", allColor.backGroundColor);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const SpecialistAssessmentN()));

      notifyListeners();
    } else {
      //something went wrong

      deleteassessment = "error";
    }
  }
}
