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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: segments.isNotEmpty
            ? ListView.builder(
                itemCount: segments.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16.0),
                      title: Text(
                        'Segment ${index + 1}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(segments[index]),
                    ),
                  );
                },
              )
            : Center(child: Text('No segments available')),
      ),
    );
  }
}