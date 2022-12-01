// To parse this JSON data, do
//
//     final alladresses = alladressesFromJson(jsonString);

import 'dart:convert';



class alladdressmodel {
    alladdressmodel({
     required   this.addId,
       required this.userids,
      required  this.addLabel,
      required  this.addLine1,
       required this.addLine2,
       required this.city,
       required this.state,
       required this.pincode,
       required this.contactNo,
       required this.addStatus,   });

    int addId;
    int userids;
    String addLabel;
    String addLine1;
    String addLine2;
    String city;
    String state;
    int pincode;
    String contactNo;
    int addStatus;

    factory alladdressmodel.fromJson(Map<String, dynamic> json) => alladdressmodel(
        addId: json["add_id"],
        userids: json["userids"],
        addLabel: json["add_label"],
        addLine1: json["add_line1"],
        addLine2: json["add_line2"],
        city: json["city"],
        state: json["state"],
        pincode: json["pincode"],
        contactNo: json["contact_no"],
        addStatus: json["add_status"],
    );

    
}
