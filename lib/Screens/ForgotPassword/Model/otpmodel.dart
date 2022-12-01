// To parse this JSON data, do
//
//     final otpmodel = otpmodelFromJson(jsonString);

import 'dart:convert';

Otpmodel otpmodelFromJson(String str) => Otpmodel.fromJson(json.decode(str));

String otpmodelToJson(Otpmodel data) => json.encode(data.toJson());

class Otpmodel {
    Otpmodel({
           required this.status,
       required this.msg,
       required this.otpToken,
       required this.otp,
       required this.userId,
    });

    int status;
    String msg;
    String otpToken;
    String otp;
    int userId;

    factory Otpmodel.fromJson(Map<String, dynamic> json) => Otpmodel(
        status: json["status"],
        msg: json["msg"],
        otpToken: json["otp_token"],
        otp: json["otp"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "otp_token": otpToken,
        "otp": otp,
        "user_id": userId,
    };
}
