import 'package:flutter/material.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingService {
  bool isRecording = false;
  Future<void> requestPermissions() async {
    await [
      Permission.microphone,
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();
  }

  Future<void> startRecording() async {
    try {
      bool result = await FlutterScreenRecording.startRecordScreenAndAudio(
          "recorded_video");
      if (result) {
        isRecording = true;
      }
    } catch (e) {
      print("Error starting recording: $e");
    }
  }
}
