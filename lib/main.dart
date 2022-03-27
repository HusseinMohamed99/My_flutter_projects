import 'package:flutter/material.dart';
import 'package:flutter_projects/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home:Counter_Screen() ,
    );
  }
}