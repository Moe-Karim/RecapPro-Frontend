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
      if (path != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Recording saved to: $path")),
        );
        final hasAccess = await Gal.hasAccess();
        if (hasAccess) {
          await Gal.putVideo(path);
            ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Video saved to gallery")),
        );
        }
      }
    } catch (e) {
      print("Error stopping recording: $e");
    }
  }
}
