import 'package:flutter/material.dart';
import 'package:recap_pro/utils/design.dart';
import 'package:recap_pro/widgets/bottom_navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Home",style: title,),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigation(currentPage: currentPage, onPageSelected: onPageSelected),
    );
  }
}