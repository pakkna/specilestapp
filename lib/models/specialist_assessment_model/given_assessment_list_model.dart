// To parse this JSON data, do
//
//     final givenAssessmentListModel = givenAssessmentListModelFromJson(jsonString);

import 'dart:convert';

GivenAssessmentListModel givenAssessmentListModelFromJson(String str) =>
    GivenAssessmentListModel.fromJson(json.decode(str));

String givenAssessmentListModelToJson(GivenAssessmentListModel data) =>
    json.encode(data.toJson());

class GivenAssessmentListModel {
  GivenAssessmentListModel({
    this.error,
    this.msg,
    required this.data,
  });

  bool? error;
  String? msg;
  List<Datum> data;

  factory GivenAssessmentListModel.fromJson(Map<String, dynamic> json) =>
      GivenAssessmentListModel(
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
    this.id,
    this.doctorId,
    this.dname,
    this.userId,
    this.note,
    this.createdAt,
  });

  int? id;
  int? doctorId;
  String? dname;
  int? userId;
  String? note;
  String? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        doctorId: json["doctor_id"],
        dname: json["dname"],
        userId: json["user_id"],
        note: json["note"],
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "dname": dname,
        "user_id": userId,
        "note": note,
        "created_at": createdAt,
      };
}
