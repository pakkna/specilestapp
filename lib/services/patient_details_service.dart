import 'dart:convert';

import 'package:design/models/patient_details_model.dart';
import 'package:design/services/visit_start_service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';

class PatientDetailsService with ChangeNotifier {
  var patientDetails;

  bool isloading = false;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  fetchPatientDetails(String id, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // print(token);

    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    Future.delayed(const Duration(milliseconds: 200), () {
      setLoadingTrue();
    });

    // var response = await http
    //     .get(Uri.parse('${Api().baseUrl}/visit-summary/718'), headers: header);

    var response =
        await http.get(Uri.parse('${Api().baseUrl}/visit-summary/718'),
            // body: data,
            headers: header);
    var responsebody = jsonDecode(response.body);
    print('vitals');
    print(responsebody);
    if (response.statusCode == 200) {
      patientDetails = PatientDetailsModel.fromJson(jsonDecode(response.body));
      Provider.of<VisitStratService>(context, listen: false)
          .visitStrat(context);

      setLoadingFalse();
      notifyListeners();
    } else {
      //something went wrong

      patientDetails = "error";

      setLoadingFalse();
    }
  }
}
