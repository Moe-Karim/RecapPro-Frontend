import 'package:flutter/material.dart';
import 'package:recap_pro/widgets/custom_card.dart';

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
                  return CustomCard(
                      title: 'Segment ${index + 1}',
                      subtitle:Text(segments[index]),
                      icon: Icons.download,
                      onTap: () {});
                },
              )
            : Center(child: Text('No segments available')),
      ),
    );
  }
}
