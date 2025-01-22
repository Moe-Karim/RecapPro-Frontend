import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recap_pro/main.dart';
import 'package:http/http.dart' as http;

class VideoController {
  Future<void> deleteAllVideos(BuildContext context) async {
    final url = Uri.parse('http://192.168.1.107:3000/videos/');
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
          .showSnackBar(SnackBar(content: Text('All videos deleted!')));
    } else {
      final data = json.decode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Failed to clear videos: ${data['message']}')));
    }
  }
}
