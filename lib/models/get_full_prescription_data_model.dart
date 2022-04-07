// To parse this JSON data, do
//
//     final getFullPrescriptionDataModel = getFullPrescriptionDataModelFromJson(jsonString);

import 'dart:convert';

GetFullPrescriptionDataModel getFullPrescriptionDataModelFromJson(String str) =>
    GetFullPrescriptionDataModel.fromJson(json.decode(str));

String getFullPrescriptionDataModelToJson(GetFullPrescriptionDataModel data) =>
    json.encode(data.toJson());

class GetFullPrescriptionDataModel {
  GetFullPrescriptionDataModel({
    this.error,
    this.msg,
    this.data,
  });

  bool? error;
  String? msg;
  Data? data;

  factory GetFullPrescriptionDataModel.fromJson(Map<String, dynamic> json) =>
      GetFullPrescriptionDataModel(
        error: json["error"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data!.toJson(),
      };
}

class Data {
  Data({
    required this.pcpNoteSummery,
    required this.provisinalDiagnosis,
    required this.specialistAssessment,
    required this.orderLabTest,
    required this.oldMedicine,
    required this.newMedicine,
    this.userInfo,
  });

  List<PcpNoteSummery> pcpNoteSummery;
  List<ProvisinalDiagnosis> provisinalDiagnosis;
  List<SpecialistAssessment> specialistAssessment;
  List<OrderLabTest> orderLabTest;
  List<Medicine> oldMedicine;
  List<Medicine> newMedicine;
  dynamic userInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pcpNoteSummery: List<PcpNoteSummery>.from(
            json["pcp_note_summery"].map((x) => PcpNoteSummery.fromJson(x))),
        provisinalDiagnosis: List<ProvisinalDiagnosis>.from(
            json["provisinal_diagnosis"]
                .map((x) => ProvisinalDiagnosis.fromJson(x))),
        specialistAssessment: List<SpecialistAssessment>.from(
            json["specialist_assessment"]
                .map((x) => SpecialistAssessment.fromJson(x))),
        orderLabTest: List<OrderLabTest>.from(
            json["OrderLabTest"].map((x) => OrderLabTest.fromJson(x))),
        oldMedicine: List<Medicine>.from(
            json["old_medicine"].map((x) => Medicine.fromJson(x))),
        newMedicine: List<Medicine>.from(
            json["New_medicine"].map((x) => Medicine.fromJson(x))),
        userInfo: json["user_info"],
      );

  Map<String, dynamic> toJson() => {
        "pcp_note_summery":
            List<dynamic>.from(pcpNoteSummery.map((x) => x.toJson())),
        "provisinal_diagnosis":
            List<dynamic>.from(provisinalDiagnosis.map((x) => x.toJson())),
        "specialist_assessment":
            List<dynamic>.from(specialistAssessment.map((x) => x.toJson())),
        "OrderLabTest": List<dynamic>.from(orderLabTest.map((x) => x.toJson())),
        "old_medicine": List<dynamic>.from(oldMedicine.map((x) => x.toJson())),
        "New_medicine": List<dynamic>.from(newMedicine.map((x) => x.toJson())),
        "user_info": userInfo,
      };
}

class Medicine {
  Medicine({
    this.id,
    this.type,
    this.medicineName,
    this.photo,
    this.barQrCode,
    this.measurement,
    this.measurementUnit,
    this.takingPeriod,
    this.morning,
    this.afternoon,
    this.night,
    this.userId,
    this.createdAt,
    this.genericName,
    this.takingTds,
    this.disease,
    this.isNotified,
    this.borameal,
    this.howManyDays,
    this.howMuch,
    this.medicineStatus,
    this.howManyMedicineHave,
    this.diseaseName,
    this.actionBy,
    this.prescribedBy,
    this.medicineReason,
    this.specialInstruction,
    this.visitId,
    this.updatedAt,
  });

  int? id;
  String? type;
  String? medicineName;
  Photo? photo;
  String? barQrCode;
  String? measurement;
  String? measurementUnit;
  String? takingPeriod;
  String? morning;
  String? afternoon;
  String? night;
  int? userId;
  DateTime? createdAt;
  String? genericName;
  dynamic takingTds;
  dynamic disease;
  int? isNotified;
  String? borameal;
  String? howManyDays;
  String? howMuch;
  MedicineStatus? medicineStatus;
  dynamic howManyMedicineHave;
  dynamic diseaseName;
  int? actionBy;
  int? prescribedBy;
  dynamic medicineReason;
  dynamic specialInstruction;
  int? visitId;
  DateTime? updatedAt;

  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        id: json["id"],
        type: json["type"],
        medicineName: json["medicine_name"],
        photo: json["photo"] == null ? null : photoValues.map[json["photo"]],
        barQrCode: json["bar_qr_code"] == null ? null : json["bar_qr_code"],
        measurement: json["measurement"],
        measurementUnit: json["measurement_unit"],
        takingPeriod:
            json["taking_period"] == null ? null : json["taking_period"],
        morning: json["morning"],
        afternoon: json["afternoon"],
        night: json["night"],
        userId: json["user_id"],
        createdAt: DateTime.parse(json["created_at"]),
        genericName: json["generic_name"] == null ? null : json["generic_name"],
        takingTds: json["taking_tds"],
        disease: json["disease"],
        isNotified: json["is_notified"],
        borameal: json["borameal"],
        howManyDays: json["how_many_days"],
        howMuch: json["how_much"],
        medicineStatus: medicineStatusValues.map[json["medicine_status"]],
        howManyMedicineHave: json["how_many_medicine_have"],
        diseaseName: json["disease_name"],
        actionBy: json["action_by"] == null ? null : json["action_by"],
        prescribedBy:
            json["prescribed_by"] == null ? null : json["prescribed_by"],
        medicineReason: json["medicine_reason"],
        specialInstruction: json["special_instruction"],
        visitId: json["visit_id"] == null ? null : json["visit_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "medicine_name": medicineName,
        "photo": photo == null ? null : photoValues.reverse[photo],
        "bar_qr_code": barQrCode == null ? null : barQrCode,
        "measurement": measurement,
        "measurement_unit": measurementUnit,
        "taking_period": takingPeriod == null ? null : takingPeriod,
        "morning": morning,
        "afternoon": afternoon,
        "night": night,
        "user_id": userId,
        "created_at": createdAt!.toIso8601String(),
        "generic_name": genericName == null ? null : genericName,
        "taking_tds": takingTds,
        "disease": disease,
        "is_notified": isNotified,
        "borameal": borameal,
        "how_many_days": howManyDays,
        "how_much": howMuch,
        "medicine_status": medicineStatusValues.reverse[medicineStatus],
        "how_many_medicine_have": howManyMedicineHave,
        "disease_name": diseaseName,
        "action_by": actionBy == null ? null : actionBy,
        "prescribed_by": prescribedBy == null ? null : prescribedBy,
        "medicine_reason": medicineReason,
        "special_instruction": specialInstruction,
        "visit_id": visitId == null ? null : visitId,
        "updated_at": updatedAt!.toIso8601String(),
      };
}

enum MedicineStatus { CONTINUE, DISCONTINUE }

final medicineStatusValues = EnumValues({
  "continue": MedicineStatus.CONTINUE,
  "discontinue": MedicineStatus.DISCONTINUE
});

enum Photo {
  EMPTY,
  THE_1639320212_JPEG,
  THE_1639318326_JPEG,
  THE_1639318219_JPEG
}

final photoValues = EnumValues({
  "": Photo.EMPTY,
  "1639318219.jpeg": Photo.THE_1639318219_JPEG,
  "1639318326.jpeg": Photo.THE_1639318326_JPEG,
  "1639320212.jpeg": Photo.THE_1639320212_JPEG
});

class OrderLabTest {
  OrderLabTest({
    this.id,
    this.testName,
    this.userId,
    this.doctorId,
    this.status,
    this.reason,
    this.visitId,
    this.tds,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? testName;
  int? userId;
  int? doctorId;
  dynamic status;
  String? reason;
  int? visitId;
  DateTime? tds;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory OrderLabTest.fromJson(Map<String, dynamic> json) => OrderLabTest(
        id: json["id"],
        testName: json["test_name"],
        userId: json["user_id"],
        doctorId: json["doctor_id"],
        status: json["status"],
        reason: json["reason"],
        visitId: json["visit_id"],
        tds: DateTime.parse(json["tds"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "test_name": testName,
        "user_id": userId,
        "doctor_id": doctorId,
        "status": status,
        "reason": reason,
        "visit_id": visitId,
        "tds": tds!.toIso8601String(),
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class PcpNoteSummery {
  PcpNoteSummery({
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

  factory PcpNoteSummery.fromJson(Map<String, dynamic> json) => PcpNoteSummery(
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

class ProvisinalDiagnosis {
  ProvisinalDiagnosis({
    this.id,
    this.doctorId,
    this.dname,
    this.patientId,
    this.provisinalNote,
    this.provisinalDiagnosis,
    this.createdAt,
  });

  int? id;
  int? doctorId;
  String? dname;
  int? patientId;
  String? provisinalNote;
  String? provisinalDiagnosis;
  DateTime? createdAt;

  factory ProvisinalDiagnosis.fromJson(Map<String, dynamic> json) =>
      ProvisinalDiagnosis(
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

class SpecialistAssessment {
  SpecialistAssessment({
    this.id,
    this.doctorId,
    this.optionsId,
    this.tds,
    this.optionsValue,
    this.userId,
    this.note,
    this.visitId,
    this.pIssues,
    this.status,
    this.iSolutions,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? doctorId;
  dynamic optionsId;
  DateTime? tds;
  dynamic optionsValue;
  int? userId;
  String? note;
  String? visitId;
  dynamic pIssues;
  dynamic status;
  dynamic iSolutions;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory SpecialistAssessment.fromJson(Map<String, dynamic> json) =>
      SpecialistAssessment(
        id: json["id"],
        doctorId: json["doctor_id"],
        optionsId: json["options_id"],
        tds: DateTime.parse(json["tds"]),
        optionsValue: json["options_value"],
        userId: json["user_id"],
        note: json["note"],
        visitId: json["visit_id"],
        pIssues: json["pIssues"],
        status: json["status"],
        iSolutions: json["iSolutions"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "doctor_id": doctorId,
        "options_id": optionsId,
        "tds": tds!.toIso8601String(),
        "options_value": optionsValue,
        "user_id": userId,
        "note": note,
        "visit_id": visitId,
        "pIssues": pIssues,
        "status": status,
        "iSolutions": iSolutions,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
