import 'package:flutter/material.dart';
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

  void _onPageSelected(int index) {
    setState(() {
      currentPage = index;
    });
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
        onPressed: () {},
        child: Stack(
          alignment: Alignment.center,
          children: [
            const Icon(
              Icons.circle_outlined,
              color: Color(0xFF61DBFB),
              size: 40,
            ),
            Icon(
              Icons.circle,
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
