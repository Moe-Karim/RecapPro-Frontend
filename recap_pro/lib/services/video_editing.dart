import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:recap_pro/services/auth_service.dart';

class VideoEditingLogic {
  AuthService authService = AuthService();


 Future<Map<String, dynamic>> uploadVideo(File _video, String endpoint) async {
  if (_video == null) {
    throw Exception("No video found");
  }

  final token = await authService.getToken();  

  final request = http.MultipartRequest(
    'POST',
    Uri.parse('http://192.168.1.107:3000/$endpoint'),
  );

  
  request.headers.addAll({
    'Authorization': 'Bearer $token',  
    'Content-Type': 'multipart/form-data',
  });

  request.files.add(await http.MultipartFile.fromPath("video", _video.path));

  try {
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final data = json.decode(responseData);
      print(data);
      return data; 
    } else {
      throw Exception('Failed to process video');
    }
  } catch (e) {
    throw Exception('Error uploading video: $e');
  }
}

  Future<String> generateTextFile(String transcript) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/transcription.txt';
    final file = File(filePath);

    await file.writeAsString(transcript);

    return filePath;
  }

  Future<void> downloadVideo(String videoUrl) async {
    var status = await Permission.storage.request();
    try {
      final directory = await getApplicationDocumentsDirectory();
      final fileName = videoUrl.split('/').last;
      final filePath = '${directory.path}/$fileName';
      final file = File(filePath);

      final response = await http.get(Uri.parse(videoUrl));
      if (response.statusCode == 200) {
        await file.writeAsBytes(response.bodyBytes);
        Gal.putVideo(filePath);
      } else {
        throw Exception('Failed to download video');
      }
    } catch (e) {
      throw Exception('Error downloading video: $e');
    }
  }
}
