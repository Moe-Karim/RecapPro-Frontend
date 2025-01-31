import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:recap_pro/pages/chewi_video_player.dart';
import 'package:recap_pro/services/screen_recording.dart';
import 'package:recap_pro/widgets/custom_card.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RecordingService recordingService = RecordingService();
  int currentPage = 0;
  bool isRecording = false;
  List<File> videoFiles = [];
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _loadVideos();
  }

  Future<void> _loadVideos() async {
    final directory = Directory(
        '/storage/emulated/0/Android/data/com.example.recap_pro/cache');
    if (directory.existsSync()) {
      setState(() {
        videoFiles = directory
            .listSync()
            .whereType<File>()
            .where((file) => file.path.endsWith('.mp4'))
            .toList();
      });
    }
  }

  Future<void> _toggleRecording() async {
    try {
      if (isRecording) {
        await recordingService.stopRecording(context);
        setState(() {
          _loadVideos();
        });
      } else {
        await recordingService.startRecording();
      }
      setState(() => isRecording = !isRecording);
    } catch (e) {
      print("Error toggling recording: $e");
    }
  }

  Future<void> _downloadVideo(String videoPath) async {
    final hasAccess = await Gal.hasAccess();
    if (hasAccess) {
      await Gal.putVideo(videoPath);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Video saved to gallery")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: videoFiles.isEmpty
          ? const Center(child: Text('No recorded videos found'))
          : ListView.builder(
              itemCount: videoFiles.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  title: videoFiles[index].path.split('/').last,
                  subtitle: _buildFileSize(videoFiles[index]),
                  icon: Icons.play_arrow_outlined,
                  onIconTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChewiePlayerScreen(
                                videoPath: videoFiles[index].path)));
                  },
                  onDownloadTap: () {
                    _downloadVideo(videoFiles[index].path);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: _toggleRecording,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.circle_outlined,
              color: Color(0xFF61DBFB),
              size: 40,
            ),
            Icon(
              isRecording ? Icons.stop : Icons.circle,
              color: const Color(0xFF61DBFB),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFileSize(File videoFile) {
    return FutureBuilder<int>(
      future: videoFile.length(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else if (snapshot.hasData) {
          double fileSizeMB = snapshot.data! / 1048576.0;
          return Text("${fileSizeMB.toStringAsFixed(2)} MB");
        } else {
          return const Text("No data");
        }
      },
    );
  }
}
