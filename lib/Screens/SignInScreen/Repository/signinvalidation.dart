import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:arawinzhilo/Screens/AllAddress/Model/allAddressModel.dart';
import 'package:arawinzhilo/Screens/SignInScreen/Model/signinmodel.dart';
import "package:arawinzhilo/route.dart" as route;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class signinRepository {
  Future<Signinmodel> signinValidation(String mobile,String password) async {
    
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final uri = Uri.parse('http://192.168.29.59:4000/apis/login');
    Map<String, String> body = {'uname': '${mobile}', 'pass': '${password}'};
    final encoding = Encoding.getByName('utf-8');
    Response response = await post(
      uri,
      headers: headers,
      body: body,
      encoding: encoding,
    );
    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(response.body));
      final signinmodel = signinmodelFromJson(response.body);
      print(signinmodel.msg);
      
     return signinmodel;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}


// Future<void> signinvalidation(String mobile, String password) async {
//   var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
//   var request =
//       http.Request('POST', Uri.parse('http://192.168.29.59:4000/apis/login'));
//   request.bodyFields = {'uname': mobile, 'pass': password};
//   request.headers.addAll(headers);
//   final prefs = await SharedPreferences.getInstance();
//   http.StreamedResponse response = await request.send();
//   print(response.toString());
//   await prefs.setString('responsestatus', response.statusCode.toString());
//   if (response.statusCode == 200) {
//     var responseData = await response.stream.bytesToString();
//     var jsonData = json.decode(responseData);

//     await prefs.setString('status', jsonData['status'].toString());
//     await prefs.setString('msg', jsonData['msg'].toString());
//     if (prefs.getString('status') == "1") {
//       await prefs.setBool('login_status', true);
//       await prefs.setString(
//           'user_id', jsonData['user_data']['user_id'].toString());

//       await prefs.setString(
//           'user_name', jsonData['user_data']['user_name'].toString());
//       await prefs.setString(
//           'user_email', jsonData['user_data']['user_email'].toString());
//       await prefs.setString(
//           'user_mobile', jsonData['user_data']['user_mobile'].toString());
//       await prefs.setString('tkn', jsonData['tkn'].toString());
//       await prefs.setString(
//           'email_verified', jsonData['user_data']['email_verified'].toString());

//     }
//   } else {
   
//   }
// }
