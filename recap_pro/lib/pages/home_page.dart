import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recap_pro/pages/edit_page.dart';
import 'package:recap_pro/services/screen_recording.dart';
import 'package:recap_pro/utils/design.dart';
import 'package:recap_pro/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RecordingService recordingService = RecordingService();
  int currentPage = 0;
  bool isRecording = false;
  final ImagePicker _picker = ImagePicker();

  Future<void> getVideo() async {
    final XFile? pickedFile =
        await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoPlayer(videoPath: pickedFile.path),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No video selected')),
      );
    }
  }

  Future<void> _handleRecording() async {
    try {
      if (isRecording) {
        await recordingService.stopRecording(context);
      } else {
        await recordingService.startRecording();
      }
      setState(() => isRecording = !isRecording);
    } catch (e) {
      print("Error toggling recording: $e");
    }
  }

  void _onPageSelected(int index) {
    setState(() {
      currentPage = index;
    });
    switch (index) {
      case 0:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const VideoPlayer()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Home",
          style: title,
        ),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: (Colors.black),
        onPressed: _handleRecording,
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
      bottomNavigationBar: BottomNavigation(
          currentPage: currentPage, onPageSelected: _onPageSelected),
    );
  }
}
