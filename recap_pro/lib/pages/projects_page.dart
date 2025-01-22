import 'package:flutter/material.dart';
import 'package:recap_pro/controllers/video_controller.dart';
import 'package:recap_pro/pages/chewi_video_player.dart';
import 'package:recap_pro/widgets/custom_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  List<Map<String, dynamic>> videoData = [];
  VideoController videoController = VideoController();
  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    final fetchedVideos = await videoController.getAllVideos(context);
    setState(() {
      videoData = fetchedVideos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Videos", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: videoData.isEmpty
          ? const Center(child: Text('No videos found'))
          : ListView.builder(
              itemCount: videoData.length,
              itemBuilder: (context, index) {
                return CustomCard(
                  title: videoData[index]['path']!,
                  subtitle: Text('Video file path: ${videoData[index]['createdAt']}'),
                  icon: Icons.play_arrow_outlined,
                  onIconTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChewiePlayerScreen(
                                videoPath: videoData[index]['path']!,isNetwork: true)));
                  },
                  onDownloadTap: () {
                    print("Downloading video: ${videoData[index]['title']}");
                  },
                );
              },
            ),
    );
  }
}
