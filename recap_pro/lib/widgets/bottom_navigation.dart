import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentPage;
  final Function(int) onPageSelected;

  const BottomNavigation({
    super.key,
    required this.currentPage,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarThemeData(
        indicatorColor: Color(0xFF61DBFB),
        labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: Colors.white);
          }
          return const TextStyle(color: Color(0xFF61DBFB));
        }),
      ),
      child: NavigationBar(
        backgroundColor: Colors.black,
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: currentPage == 0 ? Colors.white : const Color(0xFF61DBFB),
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.video_settings_outlined,
              color: currentPage == 1 ? Colors.white : const Color(0xFF61DBFB),
            ),
            label: 'Edit',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outline_rounded,
              color: currentPage == 2 ? Colors.white : const Color(0xFF61DBFB),
            ),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(
              Icons.settings_outlined,
              color: currentPage == 3 ? Colors.white : const Color(0xFF61DBFB),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
