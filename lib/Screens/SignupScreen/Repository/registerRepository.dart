import 'dart:convert';

import 'package:arawinzhilo/Screens/AllAddress/Model/allAddressModel.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/Model/otpmodel.dart';
import 'package:arawinzhilo/Screens/SignupScreen/Model/MobileOtpmodel.dart';
import "package:arawinzhilo/route.dart" as route;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class registerRepository {
  Future<dynamic> useradd(String mobile,email,pass,otp,otp_token,name) async {
    
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final uri = Uri.parse('http://192.168.29.59:4000/apis/validate_otp');
    Map<String, String> body ={
  'mob': '${mobile}',
  'email': '${email}',
  'pass': '${pass}',
  'otp': '${otp}',
  'otp_token': '${otp_token}', 
  'name': '${name}'
};
    // String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    print(body);

    Response response = await post(
      uri,
      headers: headers,
      body: body,
      encoding: encoding,
    );
    print(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(response.body));
       final mobileOtpmodel = mobileOtpmodelFromJson(response.body);
      print(mobileOtpmodel.otp);
      return mobileOtpmodel;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
