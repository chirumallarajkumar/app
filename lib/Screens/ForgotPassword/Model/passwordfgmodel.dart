// To parse this JSON data, do
//
//     final passwordfgmodel = passwordfgmodelFromJson(jsonString);

import 'dart:convert';

Passwordfgmodel passwordfgmodelFromJson(String str) => Passwordfgmodel.fromJson(json.decode(str));

String passwordfgmodelToJson(Passwordfgmodel data) => json.encode(data.toJson());

class Passwordfgmodel {
    Passwordfgmodel({
       required this.status,
       required this.msg,
    });
    int status;
    String msg;

    factory Passwordfgmodel.fromJson(Map<String, dynamic> json) => Passwordfgmodel(
        status: json["status"],
        msg: json["msg"],
    );
    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
