import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recap_pro/pages/home_page.dart';
import 'package:recap_pro/services/auth_service.dart';
class UserController {
  
AuthService authService = AuthService();

  Future<void> loginUser(String username, String password,bool _isChecked ,BuildContext context) async {
    final url = Uri.parse('http://192.168.1.107:3000/login');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final getToken = data['token'];
      if (_isChecked) {
        authService.storeToken(getToken);
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } else {
      final data = json.decode(response.body);
      print('Login failed: ${data['message']}');
    }
  }

  }
