import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingService {
  Future<void> requestPermissions() async {
    await [
      Permission.microphone,
      Permission.storage,
    ].request();
  }
}
