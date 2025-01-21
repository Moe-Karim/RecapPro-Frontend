import 'package:flutter/material.dart';

class VideoSegmentsPage extends StatelessWidget {
  final List<String> segments;

  VideoSegmentsPage({Key? key, required this.segments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Segments'),
      ),
      body: Center(
        child: Text('Video Segments Page'),
      ),
    );
  }
}