import 'package:flutter/material.dart';
import 'package:recap_pro/login/register_page.dart';
import 'package:recap_pro/utils/design.dart';
import 'package:recap_pro/controllers/user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  UserController user = UserController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  @override
  void dispose() {
    super.dispose();
    _usernameController;
    _passwordController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "Login",
          style: title,
        ),
      ),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
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
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Remember Me', style: TextStyle(fontSize: 16)),
                Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                  activeColor: Color(0xFF61DBFB),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            SizedBox(
              width: 250.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;
                  user.loginUser(username, password, _isChecked, context);
                },
                style: loginBtn,
                child: Text("Login"),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16.0),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const RegisterPage();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "Register Now!",
                      style: linkText,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
