import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

const TextStyle title = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 0, 0));

const TextStyle bodyText = TextStyle(
  fontSize: 20.0,
  color: Color.fromARGB(255, 0, 0, 0),
);

const TextStyle loginText = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 0, 0, 0));

const TextStyle linkText =
    TextStyle(color: Color(0xFF61DBFB), fontStyle: FontStyle.italic);

const TextStyle buttonTextStyle = TextStyle(color: Colors.black);

ButtonStyle loginBtn = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF61DBFB),
  foregroundColor: Colors.black,
  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  textStyle: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
);
const textFieldPadding = EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0);

const ExpandingDotsEffect indicatorEffect = ExpandingDotsEffect(
  activeDotColor: Color(0xFF61DBFB),
  dotColor: Color(0xFFBDBDBD),
  dotHeight: 7.0,
  dotWidth: 7.0,
  spacing: 5.0,
);
