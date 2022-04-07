// To parse this JSON data, do
//
//     final givenTestListModel = givenTestListModelFromJson(jsonString);

import 'dart:convert';

GivenTestListModel givenTestListModelFromJson(String str) =>
    GivenTestListModel.fromJson(json.decode(str));

String givenTestListModelToJson(GivenTestListModel data) =>
    json.encode(data.toJson());

class GivenTestListModel {
  GivenTestListModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  bool error;
  String msg;
  List<Datum> data;

  factory GivenTestListModel.fromJson(Map<String, dynamic> json) =>
      GivenTestListModel(
        error: json["error"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.testName,
    required this.tds,
    required this.reason,
    required this.doctorName,
    required this.id,
  });

  String? testName;
  String? tds;
  String? reason;
  String? doctorName;
  int? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        testName: json["test_name"],
        tds: json["tds"],
        reason: json["reason"],
        doctorName: json["doctor_name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "test_name": testName,
        "tds": tds,
        "reason": reason,
        "doctor_name": doctorName,
        "id": id,
      };
}
