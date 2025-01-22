import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recap_pro/Onboarding/onboarding_screen.dart';
import 'package:recap_pro/pages/home_page.dart';
import 'package:recap_pro/services/theme_provider.dart';
import 'package:recap_pro/services/auth_service.dart';

void main() {
  runApp(MyApp());
}

AuthService authService = AuthService();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeProvider.isDarkMode ? darkTheme() : lightTheme(),
            home: FutureBuilder<String?>(
              future: authService.getToken(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(); 
                }

                if (snapshot.hasData && snapshot.data != null) {
                  return HomePage(); 
                } else {
                  return OnboardingScreen(); 
                }
              },
            ),
          );
        },
      ),
    );
  }

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light, 
    primaryColor: Color(0xFF61DBFB),
    appBarTheme: AppBarTheme(color: Colors.white), 
    scaffoldBackgroundColor: Colors.white,
    cardTheme: CardTheme(
      color: Colors.white, 
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ), 
    ),
  );
}
  ThemeData darkTheme() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.black,
      appBarTheme: AppBarTheme(color: Colors.black),
    );
  }
}
