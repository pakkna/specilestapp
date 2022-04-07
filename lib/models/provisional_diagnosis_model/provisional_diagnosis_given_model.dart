// To parse this JSON data, do
//
//     final provisinalDiagnosisGivenModel = provisinalDiagnosisGivenModelFromJson(jsonString);

import 'dart:convert';

ProvisinalDiagnosisGivenModel provisinalDiagnosisGivenModelFromJson(
        String str) =>
    ProvisinalDiagnosisGivenModel.fromJson(json.decode(str));

String provisinalDiagnosisGivenModelToJson(
        ProvisinalDiagnosisGivenModel data) =>
    json.encode(data.toJson());

class ProvisinalDiagnosisGivenModel {
  ProvisinalDiagnosisGivenModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  bool error;
  String msg;
  List<Datum> data;

  factory ProvisinalDiagnosisGivenModel.fromJson(Map<String, dynamic> json) =>
      ProvisinalDiagnosisGivenModel(
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
    required this.doctorId,
    required this.dname,
    required this.patientId,
    required this.provisinalNote,
    required this.provisinalDiagnosis,
    required this.createdAt,
  });

  int? id;
  int? doctorId;
  String? dname;
  int? patientId;
  String? provisinalNote;
  String? provisinalDiagnosis;
  DateTime? createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        doctorId: json["doctor_id"],
        dname: json["dname"],
        patientId: json["patient_id"],
        provisinalNote: json["provisinal_note"],
        provisinalDiagnosis: json["provisinal_diagnosis"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "dname": dname,
        "patient_id": patientId,
        "provisinal_note": provisinalNote,
        "provisinal_diagnosis": provisinalDiagnosis,
        "created_at": createdAt!.toIso8601String(),
      };
}
