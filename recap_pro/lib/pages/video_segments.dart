import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:recap_pro/pages/chewi_video_player.dart';
import 'package:recap_pro/widgets/custom_card.dart';
import 'package:recap_pro/services/video_editing.dart';

class VideoSegmentsPage extends StatelessWidget {
  final List<String> segments;

  VideoSegmentsPage({Key? key, required this.segments}) : super(key: key);
  VideoEditingLogic editor = VideoEditingLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Segments'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: segments.isNotEmpty
            ? ListView.builder(
                itemCount: segments.length,
                itemBuilder: (context, index) {
                  return CustomCard(
                    title: 'Segment ${index + 1}',
                    subtitle: Text(segments[index]),
                    icon: Icons.play_arrow_outlined,
                    onIconTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChewiePlayerScreen(
                            videoPath:
                                "http://192.168.1.107:3000/${segments[index]}",
                            isNetwork: true,
                          ),
                        ),
                      );
                    },
                    onDownloadTap: () {
                      editor.downloadVideo(
                        "http://192.168.1.107:3000/${segments[index]}",
                      );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Video saved to gallery")),
                        );
                    },
                  );
                },
              )
            : Center(child: Text('No segments available')),
      ),
    );
  }
}
