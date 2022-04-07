// To parse this JSON data, do
//
//     final drugInteractionModel = drugInteractionModelFromJson(jsonString);

import 'dart:convert';

DrugInteractionModel drugInteractionModelFromJson(String str) =>
    DrugInteractionModel.fromJson(json.decode(str));

String drugInteractionModelToJson(DrugInteractionModel data) =>
    json.encode(data.toJson());

class DrugInteractionModel {
  DrugInteractionModel({
    this.error,
    this.msg,
    required this.data,
  });

  bool? error;
  String? msg;
  DrugInteractionModelData data;

  factory DrugInteractionModel.fromJson(Map<String, dynamic> json) =>
      DrugInteractionModel(
        error: json["error"],
        msg: json["msg"],
        data: DrugInteractionModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "msg": msg,
        "data": data.toJson(),
      };
}

class DrugInteractionModelData {
  DrugInteractionModelData({
    this.code1,
    this.code2,
    this.data,
    required this.medicineName,
    this.data5,
    required this.data6,
  });

  int? code1;
  int? code2;
  DataData? data;
  List<String> medicineName;
  String? data5;
  List<String> data6;

  factory DrugInteractionModelData.fromJson(Map<String, dynamic> json) =>
      DrugInteractionModelData(
        code1: json["code1"],
        code2: json["code2"],
        data: DataData.fromJson(json["data"]),
        medicineName: List<String>.from(json["medicine_name"].map((x) => x)),
        data5: json["data5"],
        data6: List<String>.from(json["data6"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "code1": code1,
        "code2": code2,
        "data": data!.toJson(),
        "medicine_name": List<dynamic>.from(medicineName.map((x) => x)),
        "data5": data5,
        "data6": List<dynamic>.from(data6.map((x) => x)),
      };
}

class DataData {
  DataData({
    this.nlmDisclaimer,
    required this.fullInteractionTypeGroup,
  });

  String? nlmDisclaimer;
  List<FullInteractionTypeGroup> fullInteractionTypeGroup;

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
        nlmDisclaimer: json["nlmDisclaimer"],
        fullInteractionTypeGroup: List<FullInteractionTypeGroup>.from(
            json["fullInteractionTypeGroup"]
                .map((x) => FullInteractionTypeGroup.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "nlmDisclaimer": nlmDisclaimer,
        "fullInteractionTypeGroup":
            List<dynamic>.from(fullInteractionTypeGroup.map((x) => x.toJson())),
      };
}

class FullInteractionTypeGroup {
  FullInteractionTypeGroup({
    this.sourceDisclaimer,
    this.sourceName,
    required this.fullInteractionType,
  });

  String? sourceDisclaimer;
  String? sourceName;
  List<FullInteractionType> fullInteractionType;

  factory FullInteractionTypeGroup.fromJson(Map<String, dynamic> json) =>
      FullInteractionTypeGroup(
        sourceDisclaimer: json["sourceDisclaimer"],
        sourceName: json["sourceName"],
        fullInteractionType: List<FullInteractionType>.from(
            json["fullInteractionType"]
                .map((x) => FullInteractionType.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sourceDisclaimer": sourceDisclaimer,
        "sourceName": sourceName,
        "fullInteractionType":
            List<dynamic>.from(fullInteractionType.map((x) => x.toJson())),
      };
}

class FullInteractionType {
  FullInteractionType({
    this.comment,
    required this.minConcept,
    required this.interactionPair,
  });

  String? comment;
  List<MinConcept> minConcept;
  List<InteractionPair> interactionPair;

  factory FullInteractionType.fromJson(Map<String, dynamic> json) =>
      FullInteractionType(
        comment: json["comment"],
        minConcept: List<MinConcept>.from(
            json["minConcept"].map((x) => MinConcept.fromJson(x))),
        interactionPair: List<InteractionPair>.from(
            json["interactionPair"].map((x) => InteractionPair.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "minConcept": List<dynamic>.from(minConcept.map((x) => x.toJson())),
        "interactionPair":
            List<dynamic>.from(interactionPair.map((x) => x.toJson())),
      };
}

class InteractionPair {
  InteractionPair({
    required this.interactionConcept,
    this.severity,
    this.description,
  });

  List<InteractionConcept> interactionConcept;
  String? severity;
  String? description;

  factory InteractionPair.fromJson(Map<String, dynamic> json) =>
      InteractionPair(
        interactionConcept: List<InteractionConcept>.from(
            json["interactionConcept"]
                .map((x) => InteractionConcept.fromJson(x))),
        severity: json["severity"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "interactionConcept":
            List<dynamic>.from(interactionConcept.map((x) => x.toJson())),
        "severity": severity,
        "description": description,
      };
}

class InteractionConcept {
  InteractionConcept({
    this.minConceptItem,
    this.sourceConceptItem,
  });

  MinConcept? minConceptItem;
  SourceConceptItem? sourceConceptItem;

  factory InteractionConcept.fromJson(Map<String, dynamic> json) =>
      InteractionConcept(
        minConceptItem: MinConcept.fromJson(json["minConceptItem"]),
        sourceConceptItem:
            SourceConceptItem.fromJson(json["sourceConceptItem"]),
      );

  Map<String, dynamic> toJson() => {
        "minConceptItem": minConceptItem!.toJson(),
        "sourceConceptItem": sourceConceptItem!.toJson(),
      };
}

class MinConcept {
  MinConcept({
    this.rxcui,
    this.name,
    this.tty,
  });

  String? rxcui;
  MinConceptName? name;
  Tty? tty;

  factory MinConcept.fromJson(Map<String, dynamic> json) => MinConcept(
        rxcui: json["rxcui"],
        name: minConceptNameValues.map[json["name"]],
        tty: ttyValues.map[json["tty"]],
      );

  Map<String, dynamic> toJson() => {
        "rxcui": rxcui,
        "name": minConceptNameValues.reverse[name],
        "tty": ttyValues.reverse[tty],
      };
}

enum MinConceptName {
  ANTITHROMBIN_III,
  WARFARIN,
  ANTITHROMBIN_ALFA,
  ANTITHROMBIN_III_HUMAN
}

final minConceptNameValues = EnumValues({
  "antithrombin alfa": MinConceptName.ANTITHROMBIN_ALFA,
  "antithrombin III": MinConceptName.ANTITHROMBIN_III,
  "antithrombin III, human": MinConceptName.ANTITHROMBIN_III_HUMAN,
  "warfarin": MinConceptName.WARFARIN
});

enum Tty { IN, PIN }

final ttyValues = EnumValues({"IN": Tty.IN, "PIN": Tty.PIN});

class SourceConceptItem {
  SourceConceptItem({
    this.id,
    this.name,
    this.url,
  });

  Id? id;
  SourceConceptItemName? name;
  String? url;

  factory SourceConceptItem.fromJson(Map<String, dynamic> json) =>
      SourceConceptItem(
        id: idValues.map[json["id"]],
        name: sourceConceptItemNameValues.map[json["name"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id],
        "name": sourceConceptItemNameValues.reverse[name],
        "url": url,
      };
}

enum Id { DB11598, DB00682, DB11166 }

final idValues = EnumValues(
    {"DB00682": Id.DB00682, "DB11166": Id.DB11166, "DB11598": Id.DB11598});

enum SourceConceptItemName {
  ANTITHROMBIN_III_HUMAN,
  WARFARIN,
  ANTITHROMBIN_ALFA
}

final sourceConceptItemNameValues = EnumValues({
  "Antithrombin Alfa": SourceConceptItemName.ANTITHROMBIN_ALFA,
  "Antithrombin III human": SourceConceptItemName.ANTITHROMBIN_III_HUMAN,
  "Warfarin": SourceConceptItemName.WARFARIN
});

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
