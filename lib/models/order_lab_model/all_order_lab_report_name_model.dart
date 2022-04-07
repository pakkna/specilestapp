// To parse this JSON data, do
//
//     final allLabReportName = allLabReportNameFromJson(jsonString);

import 'dart:convert';

AllLabReportName allLabReportNameFromJson(String str) =>
    AllLabReportName.fromJson(json.decode(str));

String allLabReportNameToJson(AllLabReportName data) =>
    json.encode(data.toJson());

class AllLabReportName {
  AllLabReportName({
    required this.error,
    required this.msg,
    required this.data,
  });

  bool error;
  String msg;
  List<Datum> data;

  factory AllLabReportName.fromJson(Map<String, dynamic> json) =>
      AllLabReportName(
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
    required this.id,
    required this.testname,
    required this.images,
  });

  int id;
  dynamic testname;
  List<String> images;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        testname: json["testname"],
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "testname": testname,
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
