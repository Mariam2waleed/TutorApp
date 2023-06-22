import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:tutor/service/models.dart';

import '../service/EndPoints.dart';

///////////////////////////// LogIn ////////////////////////////

Future login(String email, String password) async {
  final response = await http.post(
    Uri.parse(EndPoints.login),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(<String, String>{'email': email, 'password': password}),
  );

  final responseData = jsonDecode(response.body);

  if (response.statusCode == 200) {
    final accessToken = responseData['accessToken'];
    print(accessToken);

    return {'success': true, 'token': accessToken};
  } else {
    return {'success': false, 'message': responseData['message']};
  }
}

///////////////////////////// Get profile ////////////////////////////

Future<Map<String, dynamic>> getUserProfile(String token) async {
  try {
    final response = await http.get(
      Uri.parse(EndPoints.getUserProfile),
      headers: {'Authorization': 'Bearer $token'},
    );

    final responseData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return {'success': true, 'profile': responseData};
    } else {
      return {'success': false, 'message': responseData['message']};
    }
  } catch (e) {
    return {'success': false, 'message': 'An error occurred: $e'};
  }
}

///////////////////////////// Contact US ////////////////////////////

Future<Map<String, dynamic>> contactUS(
    ContactFormData formData, String token) async {
  final response = await http.post(
    Uri.parse(EndPoints.contactus),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
    body: jsonEncode(formData.toJson()),
  );

  final responseData = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return {'success': true};
  } else {
    return {'success': false, 'message': responseData['message']};
  }
}

///////////////////////////// insert product ////////////////////////////
  // var formKey = GlobalKey<FormState>();
  // var name = TextEditingController();
  // var price = TextEditingController();
  // var desc = TextEditingController();
  // insert() async {
  //   var res = await http.post(Uri.parse(EndPoints.product),
  //       body: {"name": name.text, "price": price.text, "desc": desc.text},
  //       headers: {"Content-Type": "application/x-www-form-urlencoded"});
  // }