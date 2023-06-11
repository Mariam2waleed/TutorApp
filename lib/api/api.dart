import 'dart:convert';
import 'package:http/http.dart' as http;

import '../service/EndPoints.dart';

///////////////////////////// LogIn ////////////////////////////

Future<Map<String, dynamic>> login(String email, String password) async {
  try {
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
  } catch (e) {
    print(e);

    return {'success': false, 'message': 'An error occurred: $e'};
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
