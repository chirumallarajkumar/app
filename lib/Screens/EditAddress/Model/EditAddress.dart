// To parse this JSON data, do
//
//     final editAddress = editAddressFromJson(jsonString);

import 'dart:convert';

EditAddress editAddressFromJson(String str) => EditAddress.fromJson(json.decode(str));

String editAddressToJson(EditAddress data) => json.encode(data.toJson());

class EditAddress {
    EditAddress({
      required this.status,
      required  this.msg,
    });

    int status;
    String msg;

    factory EditAddress.fromJson(Map<String, dynamic> json) => EditAddress(
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
    };
}
