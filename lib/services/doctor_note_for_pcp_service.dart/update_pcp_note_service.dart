import 'dart:convert';
import 'package:design/constants/api.dart';
import 'package:design/helper/others_helper.dart';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/doctor_note_for_pcp/doctor_note_for_pcp.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/screen/others_screen/specialist_assessment/special_assessment.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdatePcpNoteService with ChangeNotifier {
  var updatepcpnote;

  Future<void> updatePcpnote(
      String noteId, String note, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2OTAzNTIwLCJuYmYiOjE2NDY5MDM1MjAsImp0aSI6Ik9oYjFFV1VRMlNWbkFKQ0YiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.hjYs6uxZnc5vzAsLl8yXuzZmHOdgSG3B6yIf7dCvfrQ';

    //  print(token);
    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
    var data = jsonEncode({
      'assesment_id': noteId,
      'note': note,
      //'doctor_id':"233"
    });

    var response = await http.post(
        Uri.parse('${Api().baseUrl}/doctor_assessment_to_pcp_edit'),
        body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);

    print(responsebody);
    print('update pcp');

    if (responsebody["error"] == false) {
      //   storeOrderLabtest = GivenTestListModel.fromJson(jsonDecode(response.body));
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DoctorNoteForPcp()));
      OthersHelper().showToast("Update successful", allColor.backGroundColor);

      notifyListeners();
    } else {
      //something went wrong

      updatepcpnote = "error";
    }
  }
}
