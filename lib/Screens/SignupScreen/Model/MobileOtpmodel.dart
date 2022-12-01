// To parse this JSON data, do
//
//     final mobileOtpmodel = mobileOtpmodelFromJson(jsonString);

import 'dart:convert';

MobileOtpmodel mobileOtpmodelFromJson(String str) =>
    MobileOtpmodel.fromJson(json.decode(str));

String mobileOtpmodelToJson(MobileOtpmodel data) => json.encode(data.toJson());

class MobileOtpmodel {
  MobileOtpmodel({
    required this.status,
    required this.msg,
    required this.otpToken,
    required this.otp,
  });

  int status;
  String msg;
  String otpToken;
  String otp;

  factory MobileOtpmodel.fromJson(Map<String, dynamic> json) => MobileOtpmodel(
        status: json["status"],
        msg: json["msg"],
        otpToken: json["otp_token"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "otp_token": otpToken,
        "otp": otp,
      };
}
