import 'dart:convert';
import 'package:design/constants/api.dart';
import 'package:design/models/order_lab_model/all_order_lab_report_name_model.dart';
import 'package:design/models/doctor_note_for_pcp_model/given_pcp_note_list_model.dart';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:design/models/specialist_assessment_model/given_assessment_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GivenPcpNoteListService with ChangeNotifier {
  var givenpcpnotelist;

  fetchGivenPcpNoteList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    SharedPreferences pref = await SharedPreferences.getInstance();
    //  var visitId = pref.getString('vId');
    var patientId = pref.getString('patientId').toString();
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODQwOTI1LCJuYmYiOjE2NDY4NDA5MjUsImp0aSI6InFQczhzcGgyUlF2OXVldjQiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.qyKi40YPygjKpKqPN1qbFMn8WaXpOQf_DEiVX4NcKrQ';

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    var response = await http.get(
        Uri.parse('${Api().baseUrl}/doctor_assessment_to_pcp/$patientId'),
        // body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    print('Pcp List');

    if (response.statusCode == 200) {
      givenpcpnotelist =
          GivenPcpNoteListModel.fromJson(jsonDecode(response.body));

      notifyListeners();
    } else {
      //something went wrong

      givenpcpnotelist = "error";
    }
  }
}
