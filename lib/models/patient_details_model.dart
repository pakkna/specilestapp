// To parse this JSON data, do
//
//     final patientDetailsModel = patientDetailsModelFromJson(jsonString);

import 'dart:convert';

PatientDetailsModel patientDetailsModelFromJson(String str) =>
    PatientDetailsModel.fromJson(json.decode(str));

String patientDetailsModelToJson(PatientDetailsModel data) =>
    json.encode(data.toJson());

class PatientDetailsModel {
  PatientDetailsModel({
    this.error,
    this.msg,
    required this.data,
  });

  bool? error;
  String? msg;
  Data data;

  factory PatientDetailsModel.fromJson(Map<String, dynamic> json) =>
      PatientDetailsModel(
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
    this.pid,
    this.id,
    required this.uinfo,
    required this.patCode,
    required this.prescription,
    required this.vitalReport,
  });

  String? pid;
  String? id;
  Uinfo uinfo;
  PatCode patCode;
  Prescription prescription;
  List<VitalReport> vitalReport;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pid: json["pid"],
        id: json["id"],
        uinfo: Uinfo.fromJson(json["uinfo"]),
        patCode: PatCode.fromJson(json["pat_code"]),
        prescription: Prescription.fromJson(json["prescription"]),
        vitalReport: List<VitalReport>.from(
            json["vital_report"].map((x) => VitalReport.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pid": pid,
        "id": id,
        "uinfo": uinfo.toJson(),
        "pat_code": patCode.toJson(),
        "prescription": prescription.toJson(),
        "vital_report": List<dynamic>.from(vitalReport.map((x) => x.toJson())),
      };
}

class PatCode {
  PatCode({
    this.id,
    this.category,
    this.shortCode,
    required this.tds,
    this.actionBy,
  });

  int? id;
  String? category;
  String? shortCode;
  DateTime tds;
  int? actionBy;

  factory PatCode.fromJson(Map<String, dynamic> json) => PatCode(
        id: json["id"],
        category: json["category"],
        shortCode: json["short_code"],
        tds: DateTime.parse(json["tds"]),
        actionBy: json["action_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "short_code": shortCode,
        "tds": tds.toIso8601String(),
        "action_by": actionBy,
      };
}

class Prescription {
  Prescription({
    this.currentPage,
    required this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<Datum> data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  dynamic nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  Datum({
    this.id,
    this.dname,
    this.ptype,
    required this.tds,
    this.image,
    this.photourl,
  });

  int? id;
  String? dname;
  String? ptype;
  DateTime tds;
  dynamic image;
  dynamic photourl;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        dname: json["dname"],
        ptype: json["ptype"],
        tds: DateTime.parse(json["tds"]),
        image: json["image"],
        photourl: json["photourl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "dname": dname,
        "ptype": ptype,
        "tds":
            "${tds.year.toString().padLeft(4, '0')}-${tds.month.toString().padLeft(2, '0')}-${tds.day.toString().padLeft(2, '0')}",
        "image": image,
        "photourl": photourl,
      };
}

class Uinfo {
  Uinfo({
    this.id,
    this.prefix,
    this.name,
    this.firstname,
    this.lastname,
    this.mobile,
    this.email,
    this.type,
    this.patientType,
    this.project,
    this.emailVerifiedAt,
    this.username,
    this.designation,
    this.isApproved,
    this.isEmailVerified,
    this.token,
    this.transactionId,
    this.isPaid,
    this.height,
    this.heightUnit,
    this.heightFt,
    this.heightInch,
    this.weight,
    this.weightUnit,
    this.bmi,
    this.gender,
    this.address,
    required this.dateOfBirth,
    this.age,
    this.photo,
    this.primaryCareGiverContactInfo,
    this.emergencyContactRelation,
    this.otherRelation,
    this.emergencyContactNumber,
    this.emergencyContactPersonName,
    this.note,
    this.fatherName,
    this.motherName,
    this.schoolName,
    this.className,
    this.paymentAmount,
    this.speciality,
    this.officeNumber,
    this.emergencyNumber,
    this.details,
    this.zone,
    this.morning,
    this.afternoon,
    this.night,
    this.morningTemp,
    this.afternoonTemp,
    this.nightTemp,
    this.morningTypeTemp,
    this.afternoonTypeTemp,
    this.nightTypeTemp,
    this.deviceStatus,
    this.fcmToken,
    this.otp,
    this.bmdc,
    this.point,
    this.authorizedBy,
    this.skype,
    this.whatsappNumber,
    this.zoomId,
    this.patientId,
    this.forWhom,
    this.otherForWhom,
    this.timeToContact,
    this.fromTimeToContact,
    this.toTimeToContact,
    this.anyTime,
    this.isPermitted,
    this.actionBy,
    this.status,
    this.mode,
    this.weightMachineStatus,
    this.watchStatus,
    this.comments,
    this.userPin,
    this.registrationSouce,
    this.remarks,
    this.isRegister,
    this.didCall,
    this.pickedCall,
    this.followupDate,
    this.followupStartTime,
    this.followupEndTime,
    this.followupAnytme,
    this.cancelSchedule,
    this.reasonForCancelSchedule,
    this.salesId,
    this.isArchive,
    this.enrollmentStatusFromSocialNetworking,
    this.currentPlanId,
    this.infoPacketSent,
    required this.currentPlanActivated,
    required this.currentPlanEndDate,
    this.planEndDateSpecial,
    this.reasonExpandEndTime,
    this.planStatus,
    this.planStatusRemarks,
    this.twoFactorCode,
    this.mobileVerificationCode,
    this.emailVerificationCode,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.district,
    this.upazila,
    this.ip,
    this.isExternal,
    this.pcpVisitStatus,
    this.qualification,
    this.rollNo,
    this.degree,
    this.passingYear,
    this.university,
    this.bmdcCertificate,
    this.contactPersonName,
    this.doctorType,
    this.userCategory,
    this.userSubCategory,
  });

  int? id;
  dynamic prefix;
  String? name;
  String? firstname;
  String? lastname;
  String? mobile;
  String? email;
  String? type;
  dynamic patientType;
  dynamic project;
  dynamic emailVerifiedAt;
  String? username;
  dynamic designation;
  int? isApproved;
  int? isEmailVerified;
  dynamic token;
  dynamic transactionId;
  int? isPaid;
  dynamic height;
  dynamic heightUnit;
  int? heightFt;
  int? heightInch;
  int? weight;
  String? weightUnit;
  double? bmi;
  String? gender;
  String? address;
  DateTime dateOfBirth;
  int? age;
  String? photo;
  String? primaryCareGiverContactInfo;
  String? emergencyContactRelation;
  dynamic otherRelation;
  String? emergencyContactNumber;
  String? emergencyContactPersonName;
  dynamic note;
  dynamic fatherName;
  dynamic motherName;
  dynamic schoolName;
  dynamic className;
  dynamic paymentAmount;
  dynamic speciality;
  dynamic officeNumber;
  dynamic emergencyNumber;
  dynamic details;
  dynamic zone;
  String? morning;
  String? afternoon;
  String? night;
  String? morningTemp;
  String? afternoonTemp;
  String? nightTemp;
  dynamic morningTypeTemp;
  dynamic afternoonTypeTemp;
  dynamic nightTypeTemp;
  int? deviceStatus;
  String? fcmToken;
  dynamic otp;
  String? bmdc;
  int? point;
  dynamic authorizedBy;
  dynamic skype;
  dynamic whatsappNumber;
  dynamic zoomId;
  int? patientId;
  dynamic forWhom;
  dynamic otherForWhom;
  dynamic timeToContact;
  dynamic fromTimeToContact;
  dynamic toTimeToContact;
  int? anyTime;
  int? isPermitted;
  dynamic actionBy;
  String? status;
  String? mode;
  String? weightMachineStatus;
  String? watchStatus;
  dynamic comments;
  int? userPin;
  dynamic registrationSouce;
  dynamic remarks;
  dynamic isRegister;
  int? didCall;
  int? pickedCall;
  dynamic followupDate;
  dynamic followupStartTime;
  dynamic followupEndTime;
  int? followupAnytme;
  int? cancelSchedule;
  dynamic reasonForCancelSchedule;
  dynamic salesId;
  int? isArchive;
  dynamic enrollmentStatusFromSocialNetworking;
  int? currentPlanId;
  int? infoPacketSent;
  DateTime currentPlanActivated;
  DateTime currentPlanEndDate;
  dynamic planEndDateSpecial;
  dynamic reasonExpandEndTime;
  String? planStatus;
  dynamic planStatusRemarks;
  dynamic twoFactorCode;
  dynamic mobileVerificationCode;
  dynamic emailVerificationCode;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  dynamic district;
  dynamic upazila;
  dynamic ip;
  int? isExternal;
  int? pcpVisitStatus;
  String? qualification;
  String? rollNo;
  String? degree;
  String? passingYear;
  String? university;
  dynamic bmdcCertificate;
  dynamic contactPersonName;
  dynamic doctorType;
  int? userCategory;
  int? userSubCategory;

  factory Uinfo.fromJson(Map<String, dynamic> json) => Uinfo(
        id: json["id"],
        prefix: json["prefix"],
        name: json["name"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        mobile: json["mobile"],
        email: json["email"],
        type: json["type"],
        patientType: json["patient_type"],
        project: json["project"],
        emailVerifiedAt: json["email_verified_at"],
        username: json["username"],
        designation: json["designation"],
        isApproved: json["is_approved"],
        isEmailVerified: json["is_email_verified"],
        token: json["token"],
        transactionId: json["transaction_id"],
        isPaid: json["is_paid"],
        height: json["height"],
        heightUnit: json["height_unit"],
        heightFt: json["height_ft"],
        heightInch: json["height_inch"],
        weight: json["weight"],
        weightUnit: json["weight_unit"],
        bmi: json["bmi"].toDouble(),
        gender: json["gender"],
        address: json["address"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        age: json["age"],
        photo: json["photo"],
        primaryCareGiverContactInfo: json["primary_care_giver_contact_info"],
        emergencyContactRelation: json["emergency_contact_relation"],
        otherRelation: json["other_relation"],
        emergencyContactNumber: json["emergency_contact_number"],
        emergencyContactPersonName: json["emergency_contact_person_name"],
        note: json["note"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        schoolName: json["school_name"],
        className: json["class_name"],
        paymentAmount: json["payment_amount"],
        speciality: json["speciality"],
        officeNumber: json["office_number"],
        emergencyNumber: json["emergency_number"],
        details: json["details"],
        zone: json["zone"],
        morning: json["morning"],
        afternoon: json["afternoon"],
        night: json["night"],
        morningTemp: json["morning_temp"],
        afternoonTemp: json["afternoon_temp"],
        nightTemp: json["night_temp"],
        morningTypeTemp: json["morning_type_temp"],
        afternoonTypeTemp: json["afternoon_type_temp"],
        nightTypeTemp: json["night_type_temp"],
        deviceStatus: json["device_status"],
        fcmToken: json["fcm_token"],
        otp: json["otp"],
        bmdc: json["bmdc"],
        point: json["point"],
        authorizedBy: json["authorized_by"],
        skype: json["skype"],
        whatsappNumber: json["whatsapp_number"],
        zoomId: json["zoom_id"],
        patientId: json["patient_id"],
        forWhom: json["forWhom"],
        otherForWhom: json["other_for_whom"],
        timeToContact: json["time_to_contact"],
        fromTimeToContact: json["from_time_to_contact"],
        toTimeToContact: json["to_time_to_contact"],
        anyTime: json["any_time"],
        isPermitted: json["is_permitted"],
        actionBy: json["action_by"],
        status: json["status"],
        mode: json["mode"],
        weightMachineStatus: json["weight_machine_status"],
        watchStatus: json["watch_status"],
        comments: json["comments"],
        userPin: json["user_pin"],
        registrationSouce: json["registration_souce"],
        remarks: json["remarks"],
        isRegister: json["is_register"],
        didCall: json["did_call"],
        pickedCall: json["picked_call"],
        followupDate: json["followup_date"],
        followupStartTime: json["followup_start_time"],
        followupEndTime: json["followup_end_time"],
        followupAnytme: json["followup_anytme"],
        cancelSchedule: json["cancel_schedule"],
        reasonForCancelSchedule: json["reason_for_cancel_schedule"],
        salesId: json["sales_id"],
        isArchive: json["is_archive"],
        enrollmentStatusFromSocialNetworking:
            json["enrollment_status_from_social_networking"],
        currentPlanId: json["current_plan_id"],
        infoPacketSent: json["info_packet_sent"],
        currentPlanActivated: DateTime.parse(json["current_plan_activated"]),
        currentPlanEndDate: DateTime.parse(json["current_plan_end_date"]),
        planEndDateSpecial: json["plan_end_date_special"],
        reasonExpandEndTime: json["reason_expand_end_time"],
        planStatus: json["plan_status"],
        planStatusRemarks: json["plan_status_remarks"],
        twoFactorCode: json["two_factor_code"],
        mobileVerificationCode: json["mobile_verification_code"],
        emailVerificationCode: json["email_verification_code"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"],
        district: json["district"],
        upazila: json["upazila"],
        ip: json["ip"],
        isExternal: json["is_external"],
        pcpVisitStatus: json["pcp_visit_status"],
        qualification: json["qualification"],
        rollNo: json["roll_no"],
        degree: json["degree"],
        passingYear: json["passing_year"],
        university: json["university"],
        bmdcCertificate: json["bmdc_certificate"],
        contactPersonName: json["contact_person_name"],
        doctorType: json["doctor_type"],
        userCategory: json["user_category"],
        userSubCategory: json["user_sub_category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "prefix": prefix,
        "name": name,
        "firstname": firstname,
        "lastname": lastname,
        "mobile": mobile,
        "email": email,
        "type": type,
        "patient_type": patientType,
        "project": project,
        "email_verified_at": emailVerifiedAt,
        "username": username,
        "designation": designation,
        "is_approved": isApproved,
        "is_email_verified": isEmailVerified,
        "token": token,
        "transaction_id": transactionId,
        "is_paid": isPaid,
        "height": height,
        "height_unit": heightUnit,
        "height_ft": heightFt,
        "height_inch": heightInch,
        "weight": weight,
        "weight_unit": weightUnit,
        "bmi": bmi,
        "gender": gender,
        "address": address,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "age": age,
        "photo": photo,
        "primary_care_giver_contact_info": primaryCareGiverContactInfo,
        "emergency_contact_relation": emergencyContactRelation,
        "other_relation": otherRelation,
        "emergency_contact_number": emergencyContactNumber,
        "emergency_contact_person_name": emergencyContactPersonName,
        "note": note,
        "father_name": fatherName,
        "mother_name": motherName,
        "school_name": schoolName,
        "class_name": className,
        "payment_amount": paymentAmount,
        "speciality": speciality,
        "office_number": officeNumber,
        "emergency_number": emergencyNumber,
        "details": details,
        "zone": zone,
        "morning": morning,
        "afternoon": afternoon,
        "night": night,
        "morning_temp": morningTemp,
        "afternoon_temp": afternoonTemp,
        "night_temp": nightTemp,
        "morning_type_temp": morningTypeTemp,
        "afternoon_type_temp": afternoonTypeTemp,
        "night_type_temp": nightTypeTemp,
        "device_status": deviceStatus,
        "fcm_token": fcmToken,
        "otp": otp,
        "bmdc": bmdc,
        "point": point,
        "authorized_by": authorizedBy,
        "skype": skype,
        "whatsapp_number": whatsappNumber,
        "zoom_id": zoomId,
        "patient_id": patientId,
        "forWhom": forWhom,
        "other_for_whom": otherForWhom,
        "time_to_contact": timeToContact,
        "from_time_to_contact": fromTimeToContact,
        "to_time_to_contact": toTimeToContact,
        "any_time": anyTime,
        "is_permitted": isPermitted,
        "action_by": actionBy,
        "status": status,
        "mode": mode,
        "weight_machine_status": weightMachineStatus,
        "watch_status": watchStatus,
        "comments": comments,
        "user_pin": userPin,
        "registration_souce": registrationSouce,
        "remarks": remarks,
        "is_register": isRegister,
        "did_call": didCall,
        "picked_call": pickedCall,
        "followup_date": followupDate,
        "followup_start_time": followupStartTime,
        "followup_end_time": followupEndTime,
        "followup_anytme": followupAnytme,
        "cancel_schedule": cancelSchedule,
        "reason_for_cancel_schedule": reasonForCancelSchedule,
        "sales_id": salesId,
        "is_archive": isArchive,
        "enrollment_status_from_social_networking":
            enrollmentStatusFromSocialNetworking,
        "current_plan_id": currentPlanId,
        "info_packet_sent": infoPacketSent,
        "current_plan_activated":
            "${currentPlanActivated.year.toString().padLeft(4, '0')}-${currentPlanActivated.month.toString().padLeft(2, '0')}-${currentPlanActivated.day.toString().padLeft(2, '0')}",
        "current_plan_end_date":
            "${currentPlanEndDate.year.toString().padLeft(4, '0')}-${currentPlanEndDate.month.toString().padLeft(2, '0')}-${currentPlanEndDate.day.toString().padLeft(2, '0')}",
        "plan_end_date_special": planEndDateSpecial,
        "reason_expand_end_time": reasonExpandEndTime,
        "plan_status": planStatus,
        "plan_status_remarks": planStatusRemarks,
        "two_factor_code": twoFactorCode,
        "mobile_verification_code": mobileVerificationCode,
        "email_verification_code": emailVerificationCode,
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode,
        "district": district,
        "upazila": upazila,
        "ip": ip,
        "is_external": isExternal,
        "pcp_visit_status": pcpVisitStatus,
        "qualification": qualification,
        "roll_no": rollNo,
        "degree": degree,
        "passing_year": passingYear,
        "university": university,
        "bmdc_certificate": bmdcCertificate,
        "contact_person_name": contactPersonName,
        "doctor_type": doctorType,
        "user_category": userCategory,
        "user_sub_category": userSubCategory,
      };
}

class VitalReport {
  VitalReport({
    this.title,
    this.visitDate,
    this.normal,
    this.findings,
    this.remarks,
  });

  String? title;
  VisitDate? visitDate;
  String? normal;
  dynamic findings;
  dynamic remarks;

  factory VitalReport.fromJson(Map<String, dynamic> json) => VitalReport(
        title: json["title"],
        visitDate: visitDateValues.map[json["visit_date"]],
        normal: json["normal"] == null ? null : json["normal"],
        findings: json["findings"],
        remarks: json["remarks"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "visit_date": visitDateValues.reverse![visitDate],
        "normal": normal == null ? null : normal,
        "findings": findings,
        "remarks": remarks,
      };
}

class Finding {
  Finding({
    this.weber,
    this.rinne,
  });

  dynamic weber;
  dynamic rinne;

  factory Finding.fromJson(Map<String, dynamic> json) => Finding(
        weber: json["weber"],
        rinne: json["rinne"],
      );

  Map<String, dynamic> toJson() => {
        "weber": weber,
        "rinne": rinne,
      };
}

class Remark {
  Remark({
    this.weber,
  });

  RemarksEnum? weber;

  factory Remark.fromJson(Map<String, dynamic> json) => Remark(
        weber: remarksEnumValues.map[json["weber"]],
      );

  Map<String, dynamic> toJson() => {
        "weber": remarksEnumValues.reverse![weber],
      };
}

enum RemarksEnum { NORMAL, INTACT, YES }

final remarksEnumValues = EnumValues({
  "Intact": RemarksEnum.INTACT,
  "Normal": RemarksEnum.NORMAL,
  "Yes": RemarksEnum.YES
});

enum VisitDate { THE_16122021 }

final visitDateValues = EnumValues({"16-12-2021": VisitDate.THE_16122021});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
