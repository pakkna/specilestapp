// To parse this JSON data, do
//
//     final provisinalDiagnosisNameModel = provisinalDiagnosisNameModelFromJson(jsonString);

import 'dart:convert';

ProvisinalDiagnosisNameModel provisinalDiagnosisNameModelFromJson(String str) =>
    ProvisinalDiagnosisNameModel.fromJson(json.decode(str));

String provisinalDiagnosisNameModelToJson(ProvisinalDiagnosisNameModel data) =>
    json.encode(data.toJson());

class ProvisinalDiagnosisNameModel {
  ProvisinalDiagnosisNameModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  bool error;
  String msg;
  List<String> data;

  factory ProvisinalDiagnosisNameModel.fromJson(Map<String, dynamic> json) =>
      ProvisinalDiagnosisNameModel(
        error: json["error"],
        msg: json["msg"],
        data: List<String>.from(json["data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x)),
      };
}
