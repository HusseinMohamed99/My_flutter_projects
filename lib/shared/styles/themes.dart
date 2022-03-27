import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_projects/shared/styles/colors.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: HexColor('#121212'),
  primarySwatch: defaultColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('#121212'),
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: HexColor('#121212'),
    elevation: 0.0,
    titleTextStyle: TextStyle(
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
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.white,
    backgroundColor: HexColor('#121212'),
    elevation: 25.0,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    caption: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    headline1: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    headline5: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    headline6: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    subtitle2: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    button: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
    overline: TextStyle(
      fontSize: 18.0,
      color: Colors.white,
    ),
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
  inputDecorationTheme: InputDecorationTheme(prefixIconColor: Colors.white),
  fontFamily: 'Jannah',
);

ThemeData lightTheme = ThemeData(
  primarySwatch: defaultColor,
  androidOverscrollIndicator: AndroidOverscrollIndicator.glow,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
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
    unselectedItemColor: Colors.black,
    backgroundColor: Colors.white,
    elevation: 25.0,
    unselectedIconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  textTheme:   TextTheme(
    bodyText1: TextStyle(
      fontSize: 16.0,
      color: Colors.black,
    ),
    bodyText2: TextStyle(
      fontSize: 14.0,
      color: Colors.black,
    ),
    caption:   TextStyle(
      fontSize: 12.0,
      color: Colors.black,
    ),
    headline1: TextStyle(
      fontSize: 96.0,
      color: Colors.black,
    ),
    headline2: TextStyle(
      fontSize: 60.0,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 48.0,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontSize: 34.0,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontSize: 24.0,
      color: Colors.black,
    ),
    headline6: TextStyle(
      fontSize: 20.0,
      color: Colors.black,
    ),
    overline:  TextStyle(
      fontSize: 10.0,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Jannah',
);
