import 'dart:convert';

import 'package:arawinzhilo/Screens/AllAddress/Model/allAddressModel.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/Model/otpmodel.dart';
import "package:arawinzhilo/route.dart" as route;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class otpRepository {
  Future<Otpmodel> getotp(String mobile) async {
    
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final uri = Uri.parse('http://192.168.29.59:4000/apis/otp_forgotpassword');
    Map<String, String> body = {'mob': '${mobile}'};
    // String jsonBody = json.encode(body);
    final encoding = Encoding.getByName('utf-8');
    print(body);

    Response response = await post(
      uri,
      headers: headers,
      body: body,
      encoding: encoding,
    );

    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(response.body));
      final Otpmodel = otpmodelFromJson(response.body);
      print(Otpmodel.otp);
      return Otpmodel;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
