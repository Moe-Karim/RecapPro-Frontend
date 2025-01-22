import 'package:flutter/material.dart';
import 'package:recap_pro/utils/design.dart';
import 'package:recap_pro/controllers/user_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  UserController user = UserController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController;
    _passwordController;
    _nameController;
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

                  user.registerUser(username, password, name, context);
                },
                style: loginBtn,
                child: Text("Register"),
              ),
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
