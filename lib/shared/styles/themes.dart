import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';


ThemeData darkTheme  =  ThemeData(
  scaffoldBackgroundColor: HexColor('#04043A'),
  primarySwatch: defaultColor,
  appBarTheme:  AppBarTheme(
    titleSpacing: 20.0,

    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('#04043A'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('#04043A'),
    elevation: 0.0,
    titleTextStyle:  TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    unselectedItemColor: Colors.white,
    backgroundColor: Colors.black38,
    elevation: 25.0,
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      )
  ),
  iconTheme: IconThemeData(
    color: Colors.black54,
  ),
  fontFamily: 'Jannah',
);

ThemeData lightTheme = ThemeData(
  primarySwatch:defaultColor,
  androidOverscrollIndicator: AndroidOverscrollIndicator.glow,

  scaffoldBackgroundColor: Colors.white,
  appBarTheme:  AppBarTheme(
    titleSpacing: 20.0,

    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle:  TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),

    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defaultColor,
    backgroundColor: Colors.white,
    elevation: 25.0,
    unselectedIconTheme: IconThemeData(
      color: Colors.black54,
    ),
  ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        fontSize: 18.0,
        color: Colors.black,
      )
  ),
  fontFamily: 'Jannah',

) ;










