import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recap_pro/login/login_page.dart';
import 'package:recap_pro/main.dart';
import 'package:recap_pro/pages/home_page.dart';
import 'package:recap_pro/pages/main_page.dart';
import 'package:recap_pro/services/auth_service.dart';

class UserController {
  AuthService authService = AuthService();

  Future<void> loginUser(String username, String password, bool _isChecked,
      BuildContext context) async {
    final url = Uri.parse('http://192.168.1.107:3000/auth/login');

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
        return const MainPage();
      }));
    } else {
      final data = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text ('Login failed: ${data['message']}')));
    }
  }

  Future<void> registerUser(String username, String password, String name,
      BuildContext context) async {
    final url = Uri.parse('http://192.168.1.107:3000/register');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': username,
        'password': password,
        'name': name,
      }),
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      final getToken = data['token'];
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const MainPage();
      }));
    } else {
      final data = json.decode(response.body);
      print('Register failed: ${data['message']}');
    }
  }

  Future<void> changePassword(
      String currentPassword, String newPassword, BuildContext context) async {
    final url = Uri.parse('http://192.168.1.107:3000/auth/password');
    final token = await authService.getToken();
    final response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode({
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password changed succesfully')));
    } else {
      final data = json.decode(response.body);
      print('password failed: ${data['message']}');
    }
  }

  Future<void> deleteUser(BuildContext context) async {
    final url = Uri.parse('http://192.168.1.107:3000/auth/delete');
    final token = await authService.getToken();
    final response = await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Account deleted')));
      authService.logOut(context);
    } else {
      final data = json.decode(response.body);
      print('password failed: ${data['message']}');
    }
  }
}
