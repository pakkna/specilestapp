// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.error,
    this.msg,
    this.data,
  });

  bool? error;
  String? msg;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.id,
    this.name,
    this.firstname,
    this.lastname,
    this.type,
    this.userCategory,
    this.userSubCategory,
    this.email,
    this.username,
    this.mobile,
    this.address,
    this.dateOfBirth,
    this.gender,
    this.height,
    this.heightFt,
    this.heightInch,
    this.weight,
    this.weightUnit,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.photo,
    this.bmdcCertificate,
    this.bmdc,
    this.zoomId,
    this.hospitalName,
    this.emergencyContactNumber,
    this.isExternal,
    this.fcmToken,
    this.emergencyContactPersonName,
    this.jwtToken,
  });

  int? id;
  String? name;
  String? firstname;
  String? lastname;
  String? type;
  int? userCategory;
  int? userSubCategory;
  String? email;
  String? username;
  String? mobile;
  String? address;
  String? dateOfBirth;
  String? gender;
  String? height;
  String? heightFt;
  String? heightInch;
  String? weight;
  String? weightUnit;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  String? photo;
  String? bmdcCertificate;
  String? bmdc;
  String? zoomId;
  String? hospitalName;
  String? emergencyContactNumber;
  int? isExternal;
  String? fcmToken;
  String? emergencyContactPersonName;
  JwtToken? jwtToken;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        type: json["type"],
        userCategory: json["user_category"],
        userSubCategory: json["user_sub_category"],
        email: json["email"],
        username: json["username"],
        mobile: json["mobile"],
        address: json["address"],
        dateOfBirth: json["date_of_birth"],
        gender: json["gender"],
        height: json["height"],
        heightFt: json["height_ft"],
        heightInch: json["height_inch"],
        weight: json["weight"],
        weightUnit: json["weight_unit"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        zipCode: json["zip_code"],
        photo: json["photo"],
        bmdcCertificate: json["bmdc_certificate"],
        bmdc: json["bmdc"],
        zoomId: json["zoom_id"],
        hospitalName: json["hospital_name"],
        emergencyContactNumber: json["emergency_contact_number"],
        isExternal: json["is_external"],
        fcmToken: json["fcm_token"],
        emergencyContactPersonName: json["emergency_contact_person_name"],
        jwtToken: JwtToken.fromJson(json["jwt_token"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "firstname": firstname,
        "lastname": lastname,
        "type": type,
        "user_category": userCategory,
        "user_sub_category": userSubCategory,
        "email": email,
        "username": username,
        "mobile": mobile,
        "address": address,
        "date_of_birth": dateOfBirth,
        "gender": gender,
        "height": height,
        "height_ft": heightFt,
        "height_inch": heightInch,
        "weight": weight,
        "weight_unit": weightUnit,
        "city": city,
        "state": state,
        "country": country,
        "zip_code": zipCode,
        "photo": photo,
        "bmdc_certificate": bmdcCertificate,
        "bmdc": bmdc,
        "zoom_id": zoomId,
        "hospital_name": hospitalName,
        "emergency_contact_number": emergencyContactNumber,
        "is_external": isExternal,
        "fcm_token": fcmToken,
        "emergency_contact_person_name": emergencyContactPersonName,
        "jwt_token": jwtToken!.toJson(),
      };
}

class JwtToken {
  JwtToken({
    this.headers,
    this.original,
    this.exception,
  });

  Headers? headers;
  Original? original;
  dynamic exception;

  factory JwtToken.fromJson(Map<String, dynamic> json) => JwtToken(
        headers: Headers.fromJson(json["headers"]),
        original: Original.fromJson(json["original"]),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "headers": headers!.toJson(),
        "original": original!.toJson(),
        "exception": exception,
      };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers();

  Map<String, dynamic> toJson() => {};
}

class Original {
  Original({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
