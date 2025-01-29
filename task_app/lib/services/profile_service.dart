import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/user.dart';

class ProfileService {
  final String apiUrl = 'http://127.0.0.1:8000/api';
  final String? token;

  ProfileService(this.token);

  Future<User> getProfile() async {
    final response = await http.get(
      Uri.parse('$apiUrl/user/profile'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load profile');
    }
  }

  Future<User> updateProfile(String name, String email, String? photo) async {
    var request =
        http.MultipartRequest('POST', Uri.parse('$apiUrl/user/profile'))
          ..headers['Authorization'] = 'Bearer $token'
          ..fields['name'] = name
          ..fields['email'] = email;

    if (photo != null) {
      request.files.add(await http.MultipartFile.fromPath('photo', photo));
    }

    var response = await request.send();

    if (response.statusCode == 200) {
      var responseData = await response.stream.bytesToString();
      return User.fromJson(json.decode(responseData));
    } else {
      throw Exception('Failed to update profile');
    }
  }
}
