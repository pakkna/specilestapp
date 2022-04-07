// To parse this JSON data, do
//
//     final pcpNotestListModel = pcpNotestListModelFromJson(jsonString);

import 'dart:convert';

PcpNotestListModel pcpNotestListModelFromJson(String str) =>
    PcpNotestListModel.fromJson(json.decode(str));

String pcpNotestListModelToJson(PcpNotestListModel data) =>
    json.encode(data.toJson());

class PcpNotestListModel {
  PcpNotestListModel({
    this.error,
    this.msg,
    required this.data,
  });

  bool? error;
  String? msg;
  List<Datum> data;

  factory PcpNotestListModel.fromJson(Map<String, dynamic> json) =>
      PcpNotestListModel(
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
    required this.createdAt,
  });

  int? id;
  int? doctorId;
  String? dname;
  int? userId;
  String? note;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        doctorId: json["doctor_id"],
        dname: json["dname"],
        userId: json["user_id"],
        note: json["note"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "dname": dname,
        "user_id": userId,
        "note": note,
        "created_at": createdAt.toIso8601String(),
      };
}
