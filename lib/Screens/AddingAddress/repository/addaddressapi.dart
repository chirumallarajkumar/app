import 'dart:convert';

import 'package:arawinzhilo/Screens/AddingAddress/Model/AddAddressModel.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

class addAddressRepository {
  Future<AddAddressmodel> addAddressApi(
      String label,
      String line1,
      String line2,
      String city,
      String State,
      String mobile,
      String Status,
      String pincode) async {
    final prefs = await SharedPreferences.getInstance();
    var tkn = prefs.getString('tkn');
    var userid = prefs.getString('user_id');
    Map<String, String> headers = { 'tkn':'$tkn','Content-Type': 'application/x-www-form-urlencoded'};
    final uri = Uri.parse('http://192.168.29.59:4000/apis/add_address');
    Map<String, String> body = {
    'uid': '$userid',
    'label': '$label',
    'line1': '$line1',
    'line2': '$line2',
    'city': '$city',
    'state': '$State',
    'pincode': '$pincode',
    'mobile': '$mobile',
    'status': '$Status'
  };
    final encoding = Encoding.getByName('utf-8');
    Response response = await post(
      uri,
      headers: headers,
      body: body,
      encoding: encoding,
    );
    print(body);
    if (response.statusCode == 200) {
      String data = response.body;
      print(jsonDecode(response.body));
      final AddAddressmodel = addAddressmodelFromJson(response.body);
      print(AddAddressmodel.status);
      return AddAddressmodel;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
