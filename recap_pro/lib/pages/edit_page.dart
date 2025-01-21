import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:recap_pro/services/video_editing.dart';
import 'package:recap_pro/utils/design.dart';
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

  bool _isUploading = false;
  bool _isDownloading = false;
  String? _result;
  String? _filePath;
  String? _subtitled;
  List<String> _segments = [];
  final _videoEditingLogic = VideoEditingLogic();

  // ignore: non_constant_identifier_names, use_function_type_syntax_for_parameters
  Future<void> _uploadVideo(String endpoint) async {
    setState(() {
      _isUploading = true;
    });
    try {
      final data = await _videoEditingLogic.uploadVideo(
          File(widget.videoPath), endpoint);
      final filePath =
          await _videoEditingLogic.generateTextFile(data['content']);

      setState(() {
        _segments = List<String>.from(data['segments']);
        _filePath = filePath;
        _subtitled = data['subtitles'];
      });
    } catch (e) {
      setState(() {
        _result = "Error uploading video: $e";
        print("$e");
      });
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  Future<void> _downloadTextFile() async {
    if (_filePath != null) {
      await OpenFile.open(_filePath!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Text file not found')),
      );
    }
  }

  Future<void> _downloadVideo(String videoUrl) async {
    setState(() {
      _isDownloading = true;
    });
    final String baseUrl = "http://192.168.1.107:3000/";
    final String fullUrl = baseUrl + videoUrl;
    try {
      await _videoEditingLogic.downloadVideo(fullUrl);
    } catch (e) {
      setState(() {
        _result = "Error downloading video: $e";
        print("$e");
      });
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  Future<void> transcribeVideo() async {
    if ((widget.videoPath) != null) {
      await _uploadVideo("transcribe");
      print("video Uploaded");
    } else {
      print("Video not found");
    }
  }
    Future<void> segmentVideo() async {
    if ((widget.videoPath) != null) {
      await _uploadVideo("segment");
      print("video Uploaded");
    } else {
      print("Video not found");
    }
  }

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
        appBar: AppBar(
          title: Text(
            "Edit Video",
            style: title,
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    SizedBox(
                      height: 300.0,
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 50.0,
                            color: Color(0xFF61DBFB),
                          ),
                          onPressed: _playPause,
                        ),
                        Expanded(
                          child: Slider(
                            min: 0.0,
                            max: _totalDuration,
                            value: _currentPosition,
                            onChanged: _seekTo,
                            activeColor: Color(0xFF61DBFB),
                            inactiveColor: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        '${Duration(seconds: _currentPosition.toInt()).toString().split('.').first} / ${Duration(seconds: _totalDuration.toInt()).toString().split('.').first}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    if (_segments.isNotEmpty)
                      Column(
                        children: _segments.map((segmentUrl) {
                          return ElevatedButton(
                            onPressed: () => _downloadVideo(segmentUrl),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.download, color: Color(0xFF61DBFB)),
                                SizedBox(width: 8),
                                Text("Download Video"),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    if (_subtitled != null)
                      ElevatedButton(
                        onPressed: () {
                          _downloadVideo(_subtitled!);
                        },
                        child: Text('Download Processed Video'),
                      )
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "fab2",
              backgroundColor: Colors.black,
              onPressed: () {
                print("Object");
              },
              child: const Icon(
                Icons.auto_fix_high_outlined,
                color: Color(0xFF61DBFB),
                size: 35.0,
              ),
            ),
            FloatingActionButton(
              heroTag: "fab3",
              backgroundColor: Colors.black,
              onPressed: () {},
              child: const Icon(
                Icons.content_cut_sharp,
                color: Color(0xFF61DBFB),
                size: 35.0,
              ),
            ),
            FloatingActionButton(
              heroTag: "fab4",
              backgroundColor: Colors.black,
              onPressed: _isUploading
                  ? null
                  : (_filePath != null ? _downloadTextFile : transcribeVideo),
              child: _isUploading
                  ? const CircularProgressIndicator()
                  : (_filePath != null
                      ? const Icon(
                          Icons.file_download_outlined,
                          color: Color(0xFF61DBFB),
                          size: 35.0,
                        )
                      : const Icon(
                          Icons.transcribe_outlined,
                          color: Color(0xFF61DBFB),
                          size: 35.0,
                        )),
            ),
          ],
        ));
  }
}
