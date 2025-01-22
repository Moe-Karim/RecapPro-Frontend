import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recap_pro/pages/edit_page.dart';
import 'package:recap_pro/widgets/bottom_navigation.dart';
import 'home_page.dart';
import 'projects_page.dart';
import 'settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; 
  XFile? _pickedVideo; 

  Future<void> _getVideoFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _pickedVideo = pickedFile; 
        _currentIndex = 1; 
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No video selected')),
      );
    }
  }

  void _onPageSelected(int index) {
    if (index == 1) {
      _getVideoFromGallery(); 
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], 
      bottomNavigationBar: BottomNavigation(
        currentPage: _currentIndex,
        onPageSelected: _onPageSelected,
      ),
    );
  }

  List<Widget> get _pages => [
    const HomePage(),
    _pickedVideo != null ? VideoPlayerScreen(videoPath: _pickedVideo!.path) : const Center(child: Text('No video selected')),
    const ProjectsPage(),
    SettingsPage(),
  ];
}
