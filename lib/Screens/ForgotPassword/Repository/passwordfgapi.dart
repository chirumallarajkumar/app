import 'dart:convert';

import 'package:arawinzhilo/Screens/ForgotPassword/Model/passwordfgmodel.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import '../Model/otpmodel.dart';

class fgpasswordRepository {
  Future<Passwordfgmodel> updatedpasswordstatus(Otpmodel otpmodel,String newpass) async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
    final uri =
        Uri.parse('http://192.168.29.59:4000/apis/update_password_with_otp');
    Map<String, String> body = {
      'uid': '${otpmodel.userId}',
      'otp': '${otpmodel.otp}',
      'otp_token': '${otpmodel.otpToken}',
      'newpass': '${newpass.toString()}'
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

    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(response.body));
    final passwordfgmodel = passwordfgmodelFromJson(response.body);
      return passwordfgmodel;
    
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
