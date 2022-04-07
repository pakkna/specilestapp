import 'dart:convert';

import 'package:design/models/doctor_note_for_pcp_model/pcp_notest_list_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api.dart';

class PcpNotestListService with ChangeNotifier {
  var pcpNotes;

  bool isloading = false;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  fetchPcpList(
    String id,
  ) async {
    if (pcpNotes == null) {
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // var token = prefs.getString('token');

      var token =
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvZGV2LmthbWJhaWloZWFsdGguY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjQ2ODQwOTI1LCJuYmYiOjE2NDY4NDA5MjUsImp0aSI6InFQczhzcGgyUlF2OXVldjQiLCJzdWIiOjc3OSwicHJ2IjoiODdlMGFmMWVmOWZkMTU4MTJmZGVjOTcxNTNhMTRlMGIwNDc1NDZhYSJ9.qyKi40YPygjKpKqPN1qbFMn8WaXpOQf_DEiVX4NcKrQ';

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
          await http.get(Uri.parse('${Api().baseUrl}/doctor_note_list/201'),
              // body: data,
              headers: header);

      var responsebody = jsonDecode(response.body);
      print(responsebody);

      if (responsebody["error"] == false) {
        pcpNotes = PcpNotestListModel.fromJson(jsonDecode(response.body));

        setLoadingFalse();
        notifyListeners();
      } else {
        //something went wrong

        pcpNotes = "error";

        setLoadingFalse();
      }
    }
  }
}
