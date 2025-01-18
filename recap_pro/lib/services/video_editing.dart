import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class VideoEditingLogic {
  Future<void> uploadVideo(File _video) async {
    if (_video == null) {
      print("No video found");
      return;
    }
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:3000/upload'),
    );
    request.files.add(await http.MultipartFile.fromPath("video", _video!.path));

    try {
      final response = await request.send();
      if (response.statusCode == 200) {
        final responseData = await response.stream.bytesToString();
        final data = json.decode(responseData);
        return (data);
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
    
  }
}
