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
        title: Text("Register",style: title,),
      ),
      body: SingleChildScrollView(
        child: Column(

        ),
      ),,
    );
  }
}