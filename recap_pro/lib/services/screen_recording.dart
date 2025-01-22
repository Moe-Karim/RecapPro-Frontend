import 'package:flutter/material.dart';
import 'package:flutter_screen_recording/flutter_screen_recording.dart';
import 'package:gal/gal.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingService {
  bool isRecording = false;
  void _setRecordingState(bool state) {
    isRecording = state;
  }

  Future<void> requestPermissions() async {
    var statuses = await [
      Permission.microphone,
      Permission.storage,
      Permission.manageExternalStorage,
    ].request();

    if (statuses[Permission.microphone] != PermissionStatus.granted ||
        statuses[Permission.storage] != PermissionStatus.granted ||
        statuses[Permission.manageExternalStorage] !=
            PermissionStatus.granted) {
      print("Permissions denied!");
    }
  }

  Future<void> startRecording() async {
    try {
      bool result = await FlutterScreenRecording.startRecordScreenAndAudio(
          "Recap_Pro-${DateTime.now()}");
      if (result) {
        _setRecordingState(true);
      }
    } catch (e) {
      print("Error starting recording: $e");
    }
  }

  Future<void> stopRecording(BuildContext context) async {
    try {
      String? path = await FlutterScreenRecording.stopRecordScreen;
      _setRecordingState(false);
    } catch (e) {
      print("Error stopping recording: $e");
    }
  }
}
