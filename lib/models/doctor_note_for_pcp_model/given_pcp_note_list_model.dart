// To parse this JSON data, do
//
//     final givenPcpNoteListModel = givenPcpNoteListModelFromJson(jsonString);

import 'dart:convert';

GivenPcpNoteListModel givenPcpNoteListModelFromJson(String str) =>
    GivenPcpNoteListModel.fromJson(json.decode(str));

String givenPcpNoteListModelToJson(GivenPcpNoteListModel data) =>
    json.encode(data.toJson());

class GivenPcpNoteListModel {
  GivenPcpNoteListModel({
    this.error,
    this.msg,
    required this.data,
  });

  bool? error;
  String? msg;
  List<Datum> data;

  factory GivenPcpNoteListModel.fromJson(Map<String, dynamic> json) =>
      GivenPcpNoteListModel(
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
    this.specilestId,
    this.spdoctorname,
    this.patientId,
    this.note,
    this.createdAt,
  });

  int? id;
  int? doctorId;
  String? dname;
  int? specilestId;
  String? spdoctorname;
  int? patientId;
  String? note;
  DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        doctorId: json["doctor_id"],
        dname: json["dname"],
        specilestId: json["specilest_id"],
        spdoctorname: json["spdoctorname"],
        patientId: json["patient_id"],
        note: json["note"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "dname": dname,
        "specilest_id": specilestId,
        "spdoctorname": spdoctorname,
        "patient_id": patientId,
        "note": note,
        "created_at": createdAt!.toIso8601String(),
      };
}
