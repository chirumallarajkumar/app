// To parse this JSON data, do
//
//     final addAddressmodel = addAddressmodelFromJson(jsonString);

import 'dart:convert';

AddAddressmodel addAddressmodelFromJson(String str) => AddAddressmodel.fromJson(json.decode(str));

String addAddressmodelToJson(AddAddressmodel data) => json.encode(data.toJson());

class AddAddressmodel {
    AddAddressmodel({
       required this.status,
       required  this.msg,
    });

    int status;
    String msg;

    factory AddAddressmodel.fromJson(Map<String, dynamic> json) => AddAddressmodel(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
