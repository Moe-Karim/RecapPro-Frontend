import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:recap_pro/pages/home_page.dart';
import 'package:recap_pro/utils/design.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  // final TextEditingController _lnameController = TextEditingController();

  Future<void> registerUser(
      String username, String password, String name) async {
    final url = Uri.parse('http://192.168.1.107:8080/register');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': username,
        'password': password,
        'name': name,
        // 'lname': lname
      }),
    );

    if (response.statusCode == 201) {
      final data = json.decode(response.body);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomePage();
      }));
    } else {
      final data = json.decode(response.body);
      print('Register failed: ${data['message']}');
    }
  }

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
                  "Full Name",
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
                    controller: _nameController,
                    style: const TextStyle(fontSize: 18.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Full Name")),
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
            // SizedBox(
            //   height: 5.0,
            // ),
            // SizedBox(
            //   width: double.infinity,
            //   height: 50.0,
            //   child: Padding(
            //     padding: textFieldPadding,
            //     child: TextField(
            //         controller: _lnameController,
            //         style: const TextStyle(fontSize: 18.0),
            //         decoration: const InputDecoration(
            //             border: OutlineInputBorder(), hintText: "Last Name")),
            //   ),
            // ),
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
            SizedBox(
              height: 5.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
              child: Padding(
                padding: textFieldPadding,
                child: TextField(
                    controller: _emailController,
                    style: const TextStyle(fontSize: 18.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Email")),
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
                  "Password",
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
                    controller: _passwordController,
                    style: const TextStyle(fontSize: 18.0),
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: "Password")),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  String username = _emailController.text;
                  String password = _passwordController.text;
                  String name = _nameController.text;
                  // String lname = _lnameController.text;

                  registerUser(username, password, name);
                },
                style: loginBtn,
                child: Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
