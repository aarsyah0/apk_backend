import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthService {
  final String apiUrl = 'http://127.0.0.1:8000/api';

  Future<String?> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$apiUrl/auth/login'),
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['token'];
    } else {
      throw Exception('Failed to login');
    }
  }
}
