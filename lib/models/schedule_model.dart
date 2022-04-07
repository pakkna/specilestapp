// To parse this JSON data, do
//
//     final scheduleModel = scheduleModelFromJson(jsonString);

import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) =>
    ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
  ScheduleModel({
    required this.error,
    required this.msg,
    required this.data,
  });

  bool error;
  String msg;
  Data data;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        error: json["error"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.externalScheduleList,
  });

  ExternalScheduleList externalScheduleList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        externalScheduleList:
            ExternalScheduleList.fromJson(json["external_schedule_list"]),
      );

  Map<String, dynamic> toJson() => {
        "external_schedule_list": externalScheduleList.toJson(),
      };
}

class ExternalScheduleList {
  ExternalScheduleList({
    required this.currentPage,
    required this.data,
  });

  int currentPage;
  List<Datum> data;

  factory ExternalScheduleList.fromJson(Map<String, dynamic> json) =>
      ExternalScheduleList(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.physicianId,
    this.type,
    required this.memberId,
    required this.sdate,
    required this.stime,
    this.sday,
    this.remarks,
    this.instantFeedback,
    required this.feedbackReview,
    required this.anyMoreHelp,
    this.anyMoreHelpDetails,
    this.visitId,
    this.mrn,
    this.questions,
    this.category,
    required this.dateTime,
    required this.endDateTime,
    this.meetingUrl,
    this.confidentialInformation,
    this.exposed,
    this.otherConfidentialInformation,
    this.noteBy,
    this.note,
    this.noteFor,
    this.patientView,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.updatedBy,
    required this.userId,
    required this.name,
    required this.mobile,
    this.gender,
    this.age,
    required this.patientId,
    this.photo,
  });

  int id;
  int physicianId;
  dynamic type;
  int memberId;
  DateTime sdate;
  String stime;
  dynamic sday;
  dynamic remarks;
  dynamic instantFeedback;
  int feedbackReview;
  int anyMoreHelp;
  dynamic anyMoreHelpDetails;
  dynamic visitId;
  dynamic mrn;
  dynamic questions;
  dynamic category;
  String dateTime;
  String endDateTime;
  dynamic meetingUrl;
  dynamic confidentialInformation;
  dynamic exposed;
  dynamic otherConfidentialInformation;
  dynamic noteBy;
  dynamic note;
  dynamic noteFor;
  dynamic patientView;
  String createdAt;
  String updatedAt;
  int createdBy;
  dynamic updatedBy;
  int userId;
  String name;
  String mobile;
  dynamic gender;
  dynamic age;
  int patientId;
  dynamic photo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        physicianId: json["physician_id"],
        type: json["type"],
        memberId: json["member_id"],
        sdate: DateTime.parse(json["sdate"]),
        stime: json["stime"],
        sday: json["sday"],
        remarks: json["remarks"],
        instantFeedback: json["instant_feedback"],
        feedbackReview: json["feedback_review"],
        anyMoreHelp: json["any_more_help"],
        anyMoreHelpDetails: json["any_more_help_details"],
        visitId: json["visit_id"],
        mrn: json["mrn"],
        questions: json["questions"],
        category: json["category"],
        dateTime: json["date_time"],
        endDateTime: json["end_date_time"],
        meetingUrl: json["meeting_url"],
        confidentialInformation: json["confidential_information"],
        exposed: json["exposed"],
        otherConfidentialInformation: json["other_confidential_information"],
        noteBy: json["note_by"],
        note: json["note"],
        noteFor: json["note_for"],
        patientView: json["patient_view"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        userId: json["user_id"],
        name: json["name"],
        mobile: json["mobile"],
        gender: json["gender"],
        age: json["age"],
        patientId: json["patient_id"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "physician_id": physicianId,
        "type": type,
        "member_id": memberId,
        "sdate":
            "${sdate.year.toString().padLeft(4, '0')}-${sdate.month.toString().padLeft(2, '0')}-${sdate.day.toString().padLeft(2, '0')}",
        "stime": stime,
        "sday": sday,
        "remarks": remarks,
        "instant_feedback": instantFeedback,
        "feedback_review": feedbackReview,
        "any_more_help": anyMoreHelp,
        "any_more_help_details": anyMoreHelpDetails,
        "visit_id": visitId,
        "mrn": mrn,
        "questions": questions,
        "category": category,
        "date_time": dateTime,
        "end_date_time": endDateTime,
        "meeting_url": meetingUrl,
        "confidential_information": confidentialInformation,
        "exposed": exposed,
        "other_confidential_information": otherConfidentialInformation,
        "note_by": noteBy,
        "note": note,
        "note_for": noteFor,
        "patient_view": patientView,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "user_id": userId,
        "name": name,
        "mobile": mobile,
        "gender": gender,
        "age": age,
        "patient_id": patientId,
        "photo": photo,
      };
}
