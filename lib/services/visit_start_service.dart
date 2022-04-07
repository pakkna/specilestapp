import 'dart:convert';
import 'package:design/helper/others_helper.dart';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:design/services/patient_details_service.dart';
import 'package:design/services/schedule_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';

class VisitStratService with ChangeNotifier {
  var visitstrat;

  Future<void> visitStrat(
    BuildContext context,
  ) async {
    String scheduleId;
    String patientId;
    String doctorId;
    final scheduleProvider =
        await Provider.of<ScheduleService>(context, listen: false).schedule;
    final patientDetailsProvider =
        await Provider.of<PatientDetailsService>(context, listen: false)
            .patientDetails;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var specilestId = prefs.getString('specilestId');
    var token = prefs.getString('token');
    scheduleId = '2';
    patientId = patientDetailsProvider.data.pid;
    doctorId = specilestId!;
    print(patientId);
    createvisitId(patientId);
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2OTAzNTIwLCJuYmYiOjE2NDY5MDM1MjAsImp0aSI6Ik9oYjFFV1VRMlNWbkFKQ0YiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.hjYs6uxZnc5vzAsLl8yXuzZmHOdgSG3B6yIf7dCvfrQ';

    //  print(token);
    // var header = {
    //   //if header type is application/json then the data should be in jsonEncode method
    //   "Accept": "application/json",
    //   "Content-Type": "application/json",
    //   "Authorization": "Bearer $token",
    // };
    // var data = jsonEncode({
    //   'schedule_id': scheduleId,
    //   'patient_id': patientId,
    //   'doctor_id': doctorId,
    // });

    // var response = await http.post(
    //     Uri.parse('${Api().baseUrl}/external-schedule-status-change'),
    //     body: data,
    //     headers: header);
    // var responsebody = jsonDecode(response.body);

    // print(responsebody);
    // print('update');

    // if (responsebody["error"] == false) {
    //   //   storeOrderLabtest = GivenTestListModel.fromJson(jsonDecode(response.body));
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => const OrderLabs()));
    //   OthersHelper().showToast("Update successful", allColor.backGroundColor);

    //   notifyListeners();
    // } else {
    //   //something went wrong

    //   updateOrderLabtest = "error";
    // }
  }

  Future<void> createvisitId(String c) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('patientId', c);
    int a = int.parse(c);
    int s = a + a;

    String vId = s.toString();
    print(vId);

    pref.setString('vId', vId);
  }
}
