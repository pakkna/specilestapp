import 'dart:convert';
import 'package:design/models/get_full_prescription_data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api.dart';

class GetFullPrescriptionDataService with ChangeNotifier {
  var getfullprescriptiondata;

  Future<void> getFullPrescriptionData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // var specilestId = prefs.getString('specilestId');
    SharedPreferences pref = await SharedPreferences.getInstance();
    var visitId = pref.getString('vId');
    var patientId = pref.getString('patientId');
    print('visitId');
    print(visitId);
    print('patientId');
    print(patientId);
    print("token");
    print(token);
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    //718
    //1436
    var data = jsonEncode({
      'patient_id': patientId,
      'visit_id': visitId,
    });

    var response = await http.post(
        Uri.parse('${Api().baseUrl}/get-pcp-rescription-data'),
        body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);

    print(responsebody);
    print('getfullprescriptiondata');
    // developer.log(response.body);

    if (responsebody["error"] == false) {
      getfullprescriptiondata =
          GetFullPrescriptionDataModel.fromJson(jsonDecode(response.body));
      // print(getfullprescriptiondata.data);
      //print(getfullprescriptiondata.data.pcp_note_summery[0]);

      print(getfullprescriptiondata.data.specialistAssessment.length);
      print(
          getfullprescriptiondata.data.specialistAssessment.length.runtimeType);

      // print(
      //     double.parse(getfullprescriptiondata.data.specialistAssessment.length)
      //         .runtimeType);

      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (context) => const DoctorNoteForPcp()));
      // OthersHelper()
      //     .showToast("Data successfully saved", allColor.backGroundColor);

      notifyListeners();
    } else {
      //something went wrong

      getfullprescriptiondata = "error";
    }
  }
}
