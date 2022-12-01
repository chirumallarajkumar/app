import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

Future<void> addAddress(String label,String line1,String line2,String city,String State,String mobile,String Status,String pincode) async {
  print(label);
  final prefs = await SharedPreferences.getInstance();
  var tkn = prefs.getString('tkn');
  var userid = prefs.getString('user_id');
  print(userid);
  print(tkn);
  var headers = {
    'tkn':'$tkn',
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  var request = http.Request(
      'POST', Uri.parse('http://192.168.29.59:4000/apis/add_address'));
  request.bodyFields = {
    'uid': '$userid',
    'label': '$label',
    'line1': '$line1',
    'line2': '$line2',
    'city': '$city',
    'state': '$State',
    'pincode': '$pincode',
    'mobile': '$mobile',
    'status': '1'
  };
  print(request.bodyFields);
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
}
