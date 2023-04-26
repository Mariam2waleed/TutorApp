import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> login(String email, String password) async {
  final response = await http.post(
    Uri.parse('http://localhost:3000/auth/login'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({'email': email, 'password': password}),
  );

  final responseData = jsonDecode(response.body);

  if (response.statusCode == 200) {
    return {'success': true, 'token': responseData['token']};
  } else {
    return {'success': false, 'message': responseData['message']};
  }
}
