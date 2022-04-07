import 'dart:convert';
import 'package:design/helper/others_helper.dart';
import 'package:design/models/order_lab_model/all_order_lab_report_name_model.dart';
import 'package:design/models/schedule_model.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/home/home_page.dart';
import 'package:design/screen/patient/patient_list.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';

class ScheduleService with ChangeNotifier {
  var schedule;
  String? s;

  fetchSchedule(String type, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ3NTk0NDI2LCJuYmYiOjE2NDc1OTQ0MjYsImp0aSI6InB3OWY5bXljU1V6UFI5MzMiLCJzdWIiOjgwMywicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.DBLZQ1K5yKZvy878frMxa4TE4JF34XS_8iUPEZKLeVk';

    print('token');
    print(token);

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    // var response = await http
    //     .get(Uri.parse('${Api().baseUrl}/visit-summary/718'), headers: header);
    // present, previous, future

    var response = await http.get(
        Uri.parse('${Api().baseUrl}/external-schedule?schedule_type=$type'),
        // body: data,
        headers: header);
    var responsebody = jsonDecode(response.body);
    print(responsebody);
    print(responsebody['data']['external_schedule_list']['total']);

    if (response.statusCode == 200) {
      if (responsebody['data']['external_schedule_list']['total'] == 0) {
        notifyListeners();
        OthersHelper()
            .showToast("Don't have any patient", allColor.backGroundColor);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        schedule = ScheduleModel.fromJson(jsonDecode(response.body));
        debugPrint(schedule.data.externalScheduleList.data.length.toString());

        int f = 0;
        for (int i = 0;
            i < schedule.data.externalScheduleList.data.length;
            i++) {
          int k = 0;

          f = (k + i);
          //  print(schedule.data.externalScheduleList.data[i].name);
        }
        s = ("${f + 1}");

        notifyListeners();
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PatientList()));
      }
    } else {
      //something went wrong

      schedule = "error";
    }
  }
}
