import 'dart:convert';

import 'package:hilo_bloc/Screens/AllAddress/Model/allAddressModel.dart';
import "package:hilo_bloc/route.dart" as route;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class UserRepository {
  Future<List<alladdressmodel>> getalladdress() async {
    final prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('tkn').toString();
    String? userid = prefs.getString('user_id');
    print(token);
    print(userid);
    var headers = {
      'tkn': '$token',
      'Content-Type': 'application/x-www-form-urlencoded'
    };
;

  final uri = Uri.parse('http://192.168.29.59:4000/apis/get_all_addresses');
Map<String, String> body = {'uid': '${userid}'};
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
    final List result = jsonDecode(response.body)['data'];
    print(result);
    return result.map(((e) => alladdressmodel.fromJson(e))).toList();
    
    } else {
      throw Exception(response.reasonPhrase);
      
    }
  }
}
