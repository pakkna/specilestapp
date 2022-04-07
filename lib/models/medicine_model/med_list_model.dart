// To parse this JSON data, do
//
//     final medicineListModel = medicineListModelFromJson(jsonString);

import 'dart:convert';

MedicineListModel medicineListModelFromJson(String str) =>
    MedicineListModel.fromJson(json.decode(str));

String medicineListModelToJson(MedicineListModel data) =>
    json.encode(data.toJson());

class MedicineListModel {
  MedicineListModel({
    this.error,
    this.msg,
    required this.data,
  });

  bool? error;
  String? msg;
  Data data;

  factory MedicineListModel.fromJson(Map<String, dynamic> json) =>
      MedicineListModel(
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    this.type,
    this.medicineName,
    this.genericName,
    this.measurement,
    this.measurementUnit,
    this.morning,
    this.afternoon,
    this.night,
    this.isNotified,
    this.photo,
    this.photourl,
    this.barQrCode,
    this.howManyDays,
    this.howMuch,
    this.beforeOrAfterMeal,
    this.medicineStatus,
    this.howManyMedicineHave,
  });

  int? id;
  String? type;
  String? medicineName;
  String? genericName;
  String? measurement;
  String? measurementUnit;
  String? morning;
  String? afternoon;
  String? night;
  int? isNotified;
  String? photo;
  String? photourl;
  dynamic barQrCode;
  String? howManyDays;
  String? howMuch;
  String? beforeOrAfterMeal;
  String? medicineStatus;
  dynamic howManyMedicineHave;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        medicineName: json["medicine_name"],
        genericName: json["generic_name"] == null ? null : json["generic_name"],
        measurement: json["measurement"],
        measurementUnit: json["measurement_unit"],
        morning: json["morning"],
        afternoon: json["afternoon"],
        night: json["night"],
        isNotified: json["is_notified"],
        photo: json["photo"] == null ? null : json["photo"],
        photourl: json["photourl"] == null ? null : json["photourl"],
        barQrCode: json["bar_qr_code"],
        howManyDays: json["how_many_days"],
        howMuch: json["how_much"],
        beforeOrAfterMeal: json["before_or_after_meal"],
        medicineStatus: json["medicine_status"],
        howManyMedicineHave: json["how_many_medicine_have"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "medicine_name": medicineName,
        "generic_name": genericName == null ? null : genericName,
        "measurement": measurement,
        "measurement_unit": measurementUnit,
        "morning": morning,
        "afternoon": afternoon,
        "night": night,
        "is_notified": isNotified,
        "photo": photo == null ? null : photo,
        "photourl": photourl == null ? null : photourl,
        "bar_qr_code": barQrCode,
        "how_many_days": howManyDays,
        "how_much": howMuch,
        "before_or_after_meal": beforeOrAfterMeal,
        "medicine_status": medicineStatus,
        "how_many_medicine_have": howManyMedicineHave,
      };
}
