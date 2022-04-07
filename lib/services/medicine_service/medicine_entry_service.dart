import 'dart:convert';
import 'package:design/helper/others_helper.dart';
import 'package:design/models/order_lab_model/given_test_list_model.dart';
import 'package:design/screen/get_started.dart';
import 'package:design/screen/others_screen/order_lab/order_labs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api.dart';

class MedicineEntryService with ChangeNotifier {
  var medicineenrty;

  Future<void> medicineEntry({
    required String type,
    required String medicineName,
    required String measurement,
    required String? genericName,
    required String measurementUnit,
    required String morning,
    required String afternoon,
    required String night,
    required String howManyDays,
    required String beforeOrAfterMeal,
    required BuildContext context,
  }) async {
    genericName ??= '';
    print(type);
    print(medicineName);
    print(genericName);
    print(measurement);
    print(measurementUnit);
    print(morning);
    print(afternoon);
    print(night);
    print(howManyDays);
    print(beforeOrAfterMeal);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var specilestId = prefs.getString('specilestId');
    SharedPreferences pref = await SharedPreferences.getInstance();
    var visitId = pref.getString('vId');
    var patientId = pref.getString('patientId');

    print(specilestId);
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODA0MDI2LCJuYmYiOjE2NDY4MDQwMjYsImp0aSI6IjJZMEQxd1JyV0xQT3lmNDkiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.ytnjHunR8KZJ3RwVeqbTkPmtWX1rB3FVVQUbtiS1YGQ';
    // print(token);
    try {
      var header = {
        //if header type is application/json then the data should be in jsonEncode method
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      };
      var data = jsonEncode({
        'user_id': patientId,
        'type': type,
        'medicine_name': medicineName,
        'generic_name': genericName,
        'measurement': measurement,
        'measurement_unit': measurementUnit,
        'morning': morning,
        'afternoon': afternoon,
        'night': night,
        'how_many_days': howManyDays,
        'before_or_after_meal': beforeOrAfterMeal,
        //'prescribed_by': '739',
        'prescribed_by': specilestId,
        'medicine_status': 'continue',
        'visit_id': visitId
      });

      var response = await http.post(
          Uri.parse('${Api().baseUrl}/medicine_entry'),
          body: data,
          headers: header);
      var responsebody = jsonDecode(response.body);

      print(responsebody);
      print('medicineEntry');

      if (responsebody["error"] == false) {
        //   storeOrderLabtest = GivenTestListModel.fromJson(jsonDecode(response.body));
        print(responsebody["msg"]);
        // Navigator.pushReplacement(
        //     context, MaterialPageRoute(builder: (context) => const OrderLabs()));
        OthersHelper().showToast(
            "Medicine successfully added!", allColor.backGroundColor);

        notifyListeners();
      } else {
        //something went wrong

        medicineenrty = "error";
      }
    } catch (e) {
      print(e);
    }
  }
}
