import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;
  const VideoPlayerScreen({super.key, required this.videoPath});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _isPlaying = false;
  double _currentPosition = 0.0;
  double _totalDuration = 1.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.videoPath));
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.addListener(() {
      if (_controller.value.isInitialized) {
        setState(() {
          _currentPosition = _controller.value.position.inSeconds.toDouble();
          _totalDuration = _controller.value.duration.inSeconds.toDouble();
        });
      }
    });
  }

  void _playPause() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
        _isPlaying = false;
      } else {
        _controller.play();
        _isPlaying = true;
      }
    });
  }

  void _seekTo(double value) {
    final position = Duration(seconds: value.toInt());
    _controller.seekTo(position);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Column(
              children: [
                AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
                IconButton(
                  icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                  onPressed: _playPause,
                ),
                Slider(
                  min: 0.0,
                  max: _totalDuration,
                  value: _currentPosition,
                  onChanged: _seekTo,
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '${Duration(seconds: _currentPosition.toInt()).toString().split('.').first} / ${Duration(seconds: _totalDuration.toInt()).toString().split('.').first}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
