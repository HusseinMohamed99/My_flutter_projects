// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors, camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class BMI_Result_Screen extends StatelessWidget {
  final int Result;
  final bool isMale;
  final int Age;

  BMI_Result_Screen({
    @required this.Result,
    @required this.Age,
    @required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#04043A'),
      appBar: AppBar(
        backgroundColor: HexColor('#800080'),
        title: Text(
          'BMI Result',
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Container(
            width: double.infinity,
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: HexColor('#800080'),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      'Result : $Result ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 1.0,
                    ),
                    Text(
                      'BMI ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        2.0,
                      ),
                      color: Colors.blue,
                    ),
                    height: 5.0,
                    width: double.infinity,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  'Gender : ${isMale ? 'Male' : 'Female'} ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(
                    10.0,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        2.0,
                      ),
                      color: Colors.blue,
                    ),
                    height: 5.0,
                    width: double.infinity,
                  ),
                ),
                Text(
                  'Age : $Age ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
