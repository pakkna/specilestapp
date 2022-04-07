// To parse this JSON data, do
//
//     final labReportModel = labReportModelFromJson(jsonString);

import 'dart:convert';

LabReportModel labReportModelFromJson(String str) =>
    LabReportModel.fromJson(json.decode(str));

String labReportModelToJson(LabReportModel data) => json.encode(data.toJson());

class LabReportModel {
  LabReportModel({
    this.error,
    this.msg,
    required this.data,
  });

  bool? error;
  String? msg;
  List<Datum> data;

  factory LabReportModel.fromJson(Map<String, dynamic> json) => LabReportModel(
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
    this.testname,
    this.tds,
    required this.images,
    this.id,
  });

  String? testname;
  String? tds;
  List<Image> images;
  int? id;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        testname: json["testname"],
        tds: json["tds"],
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "testname": testname,
        "tds": tds,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "id": id,
      };
}

class Image {
  Image({
    this.img,
  });

  String? img;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
      };
}
