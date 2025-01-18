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
      data:NavigationBarThemeData(
        indicatorColor: Color(0xFF61DBFB),
           labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(WidgetState.selected)) {
            return const TextStyle(color: Colors.white); 
          }
          return const TextStyle(color: Color(0xFF61DBFB));
        }),
      ) ,
      child:NavigationBar(
        backgroundColor: Colors.black,
      ) ,
    );
  }
}