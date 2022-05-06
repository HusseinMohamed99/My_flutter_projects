// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, camel_case_types, file_names, non_constant_identifier_names, avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'BMI_Result_Screen.dart';

class BMI_Screen extends StatefulWidget {
  @override
  _BMI_ScreenState createState() => _BMI_ScreenState();
}

class _BMI_ScreenState extends State<BMI_Screen> {
  bool isMale = true;
  double HEIGHT = 120.0;
  int AGE = 18;
  int WEIGHT = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor('#04043A'),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: HexColor('#04043A'),
          title: Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          children: [
            // Part 1
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: isMale
                                ? HexColor('#ff1493')
                                : HexColor('#800080'),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                color: Colors.white,
                                image: AssetImage(
                                  'assets/images/male.png',
                                ),
                                width: 90.0,
                                height: 90.0,
                              ),
                              Text(
                                'MALE',
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
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                            color: !isMale
                                ? HexColor('#ff1493')
                                : HexColor('#800080'),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                color: Colors.white,
                                image: AssetImage(
                                  'assets/images/female.png',
                                ),
                                width: 90.0,
                                height: 90.0,
                              ),
                              Text(
                                'FEMALE',
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
                  ],
                ),
              ),
            ),

            // Part 2
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: HexColor('#800080'),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${HEIGHT.round()}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'CM',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      inactiveColor: Colors.white,
                      value: HEIGHT,
                      min: 70,
                      max: 250,
                      onChanged: (value) {
                        setState(() {
                          HEIGHT = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            )),

            // Part 3
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          color: HexColor('#800080'),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$AGE',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      AGE--;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      AGE++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            10.0,
                          ),
                          color: HexColor('#800080'),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '$WEIGHT',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      WEIGHT--;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                                FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      WEIGHT++;
                                    });
                                  },
                                  mini: true,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  backgroundColor: Colors.black,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Part 4 (Button)
            Container(
              color: HexColor('#800080'),
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  double result = WEIGHT / pow(HEIGHT / 100, 2);

                  print(result.round());

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMI_Result_Screen(
                        isMale: isMale,
                        Age: AGE,
                        Result: result.round(),
                      ),
                    ),
                  );
                },
                height: 60.0,
                child: Text(
                  'CALCULATOR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
