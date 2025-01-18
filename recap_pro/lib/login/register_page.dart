import 'package:flutter/material.dart';
import 'package:recap_pro/utils/design.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Register",
          style: title,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Image.asset(
              "./assets/splash_Text.png",
              width: 200.0,
              height: 200.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "First Name",
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
                    controller: _fnameController,
                    style: const TextStyle(fontSize: 18.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "First Name")),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Last Name",
                  style: loginText,
                ),
              ),
            ),
            SizedBox(height: 5.0,),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Padding(
                padding: textFieldPadding,
                child: TextField(
                    controller: _lnameController,
                    style: const TextStyle(fontSize: 18.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Last Name")),
              ),
            ),
            SizedBox(
              height: 10,
            ),
                 Container(
              margin: EdgeInsets.all(10.0),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: loginText,
                ),
              ),
            ),
            SizedBox(height: 5.0,),
          ],
        ),
      ),
    );
  }
}
