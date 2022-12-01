// To parse this JSON data, do
//
//     final signinmodel = signinmodelFromJson(jsonString);

import 'dart:convert';

Signinmodel signinmodelFromJson(String str) =>
    Signinmodel.fromJson(json.decode(str));

String signinmodelToJson(Signinmodel data) => json.encode(data.toJson());

class Signinmodel {
  Signinmodel({
    required this.status,
    required this.msg,
    required this.userData,
    required this.tkn,
  });

  int status;
  String msg;
  UserData userData;
  String tkn;

  factory Signinmodel.fromJson(Map<String, dynamic> json) => Signinmodel(
        status: json["status"],
        msg: json["msg"],
        userData: UserData.fromJson(json["user_data"]),
        tkn: json["tkn"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "user_data": userData.toJson(),
        "tkn": tkn,
      };
}

class UserData {
  UserData({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userMobile,
    required this.emailVerified,
  });

  int userId;
  String userName;
  String userEmail;
  String userMobile;
  int emailVerified;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userMobile: json["user_mobile"],
        emailVerified: json["email_verified"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_mobile": userMobile,
        "email_verified": emailVerified,
      };
}
