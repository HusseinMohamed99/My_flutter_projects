import 'package:flutter/material.dart';
import 'package:flutter_projects/messanger_screen.dart';

void main() {
  runApp(MyApp());
}

// Stateless
// Stateful

// class MyApp

class MyApp extends StatelessWidget {
// constructor
// build

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:messenger_screen(),
    );
  }
}
