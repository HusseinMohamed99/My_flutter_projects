// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_projects/modules/BMI_Screen.dart';

void main() {
  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

// constructor
// build

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMI_Screen(),
    );
  }
}
