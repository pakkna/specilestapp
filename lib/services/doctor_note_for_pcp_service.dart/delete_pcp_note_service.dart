import 'dart:convert';
import 'package:design/constants/api.dart';
import 'package:design/helper/others_helper.dart';
import 'package:design/models/order_lab_model/all_order_lab_report_name_model.dart';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/doctor_note_for_pcp/doctor_note_for_pcp.dart';
import 'package:design/screen/others_screen/provisional_diagnosis/provisional_diagnosis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DeletePcpNoteService with ChangeNotifier {
  var deletepcpnote;

  deletePcpNote(String deleteId, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    print(deleteId);

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
        Uri.parse('${Api().baseUrl}/doctor_assessment_to_pcp_delete/$deleteId'),
        // body: data,
        headers: header);

    var responsebody = jsonDecode(response.body);
    print('delete');
    print(responsebody);

    if (response.statusCode == 200) {
      // diagnosisdeletebyid =
      //     AllLabReportName.fromJson(jsonDecode(response.body));

      OthersHelper().showToast("Delete successful", allColor.backGroundColor);
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DoctorNoteForPcp()));

      notifyListeners();
    } else {
      //something went wrong

      deletepcpnote = "error";
    }
  }
}
