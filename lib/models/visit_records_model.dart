// To parse this JSON data, do
//
//     final visitRecordsModel = visitRecordsModelFromJson(jsonString);

import 'dart:convert';

VisitRecordsModel visitRecordsModelFromJson(String str) =>
    VisitRecordsModel.fromJson(json.decode(str));

String visitRecordsModelToJson(VisitRecordsModel data) =>
    json.encode(data.toJson());

class VisitRecordsModel {
  VisitRecordsModel({
    this.error,
    this.msg,
    required this.data,
  });

  bool? error;
  String? msg;
  List<Datum> data;

  factory VisitRecordsModel.fromJson(Map<String, dynamic> json) =>
      VisitRecordsModel(
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
    this.docName,
    this.patientId,
    this.patientName,
    this.prescriptionId,
    this.visitId,
    this.date,
  });

  String? docName;
  int? patientId;
  String? patientName;
  int? prescriptionId;
  String? visitId;
  DateTime? date;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        docName: json["doc_name"],
        patientId: json["patient_id"],
        patientName: json["patient_name"],
        prescriptionId: json["prescription_id"],
        visitId: json["visit_id"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "doc_name": docName,
        "patient_id": patientId,
        "patient_name": patientName,
        "prescription_id": prescriptionId,
        "visit_id": visitId,
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
      };
}
