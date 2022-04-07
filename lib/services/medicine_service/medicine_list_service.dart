import 'dart:convert';
import 'package:design/models/medicine_model/med_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api.dart';

class MedicineListService with ChangeNotifier {
  var medList;
  List<bool> indeX = [false];

  bool isloading = false;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  fetchMedList(bool newMedicine) async {
    //  if (medList == null || medList == "error") {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    SharedPreferences pref = await SharedPreferences.getInstance();
    var visitId = pref.getString('vId');
    var patientId = pref.getString('patientId');
    // var token =
    //     'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODQwOTI1LCJuYmYiOjE2NDY4NDA5MjUsImp0aSI6InFQczhzcGgyUlF2OXVldjQiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.qyKi40YPygjKpKqPN1qbFMn8WaXpOQf_DEiVX4NcKrQ';

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };
//     if(newMedicine){
// var data = jsonEncode({
//       'user_id': "718",
//     });
//     }else {
//     var data = jsonEncode({
//       'user_id': "718",
//       'visit_id' : visitId,
//     });
//     }
    var data = jsonEncode({
      'user_id': patientId,
      'visit_id': newMedicine ? visitId : '',
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      setLoadingTrue();
    });

    // var response = await http
    //     .get(Uri.parse('${Api().baseUrl}/visit-summary/718'), headers: header);

    var response = await http.post(Uri.parse('${Api().baseUrl}/view_medicines'),
        body: data, headers: header);

    var responsebody = jsonDecode(response.body);
    print(responsebody);
    if (responsebody["error"] == false) {
      medList = MedicineListModel.fromJson(responsebody);

      for (int i = 0; i < medList.data.data.length; i++) {
        indeX.add(false);
      }

      setLoadingFalse();
      notifyListeners();
    } else {
      //something went wrong
      medList = "error";
      setLoadingFalse();
    }
    // }
  }
}
