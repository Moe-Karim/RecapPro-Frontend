import 'package:flutter/material.dart';
import 'package:recap_pro/utils/design.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25.0),
            Image.asset(
              "./assets/splash_Text.png",
              width: 200.0,
              height: 200.0,
            ),
            const SizedBox(height: 20.0),
            Container(
              margin: EdgeInsets.all(10.0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Username",
                  style: loginText,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Padding(
                padding: textFieldPadding,
                child: TextField(
                    controller: _usernameController,
                    style: const TextStyle(fontSize: 18.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Username")),
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              margin: EdgeInsets.all(10.0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text("Password", style: loginText),
              ),
            )
          ],
        ),
      ),
    );
  }
}
