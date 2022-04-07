import 'dart:convert';

import 'package:design/models/lab_report_model.dart';
import 'package:design/models/medicine_model/drug_ineraction_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/api.dart';

class DrugInteractionService with ChangeNotifier {
  var drugInteractionData;

  bool isDataExist = false;

  bool isloading = false;
  String? comment;

  setLoadingTrue() {
    isloading = true;
    notifyListeners();
  }

  setLoadingFalse() {
    isloading = false;
    notifyListeners();
  }

  fetchDrugInteraction(
    String? medNameOne,
    String? medNameTwo,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // String medNameOne = 'Heparin';
    // String medNameTwo = 'warfarin';
    // String medNameOne = 'zimax';
    // String medNameTwo = 'warfarin';
    // print('object');
    // print(medNameOne);
    // print(medNameTwo);

    var header = {
      //if header type is application/json then the data should be in jsonEncode method
      "Accept": "application/json",
      // "Content-Type": "application/json",
      "Authorization": "Bearer $token",
    };

    // var data = jsonEncode({
    //   'medinime_nam[]': medNameOne,
    //   'medinime_nam[]': medNameTwo,
    // });

    Future.delayed(const Duration(milliseconds: 200), () {
      setLoadingTrue();
    });

    var response = await http.get(
        Uri.parse(
            '${Api().baseUrl}/getGenericName?medinime_nam[]=$medNameOne&medinime_nam[]=$medNameTwo'),
        headers: header);
    // var response = await http.get(
    //     Uri.parse('${Api().baseUrl}/getGenericName?medinime_nam[]=$medNameOne'),
    //     headers: header);

    var responsebody = jsonDecode(response.body);
    print(responsebody);
    print('DI');
    developer.log(response.body);

    if (responsebody["error"] == false) {
      try {
        isDataExist = responsebody['data']['data']
            .containsKey('fullInteractionTypeGroup');
        if (isDataExist) {
          comment = (responsebody['data']['data']['fullInteractionTypeGroup'][0]
              ['fullInteractionType'][0]['comment']);
        } else {
          comment = 'no interaction';
        }
      } catch (e) {
        //  print('catch');
        comment = 'no interaction';
      }
      // drugInteractionData =
      //     DrugInteractionModel.fromJson(jsonDecode(response.body));

      // drugInteractionData = responsebody;
      //check if these field exist in json data
      // print('yes');
      // isDataExist =
      //     responsebody['data']['data'].containsKey('fullInteractionTypeGroup');
      // print(isDataExist);
      // if (isDataExist) {
      //   comment = (responsebody['data']['data']['fullInteractionTypeGroup'][0]
      //       ['fullInteractionType'][0]['comment']);
      // } else {
      //   comment = 'no interaction';
      // }
      // print('ggggg');
      // print(comment);

      // print(responsebody['data']['data']['fullInteractionTypeGroup'][0]
      //     ['fullInteractionType'][0]['comment']);

      // isDataExist = responsebody['data']['data']['fullInteractionTypeGroup']
      //         ['fullInteractionType']
      //     .containsKey('comment');
      // print('isDataExist');
      // print(isDataExist);

      setLoadingFalse();
      notifyListeners();
    } else {
      //something went wrong

      drugInteractionData = "error";
      setLoadingFalse();
    }
  }
}
