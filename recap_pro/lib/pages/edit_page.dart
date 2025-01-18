import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  final String videoPath;
  const VideoPlayer({super.key, required this.videoPath});

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
