import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_projects/Screens/login/login_screen.dart';
import 'package:flutter_projects/layout/home_screen.dart';
import 'package:flutter_projects/network/cache_helper.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen>with SingleTickerProviderStateMixin {



   AnimationController animationController;
  Animation fadeAnimation;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this,duration: Duration(seconds: 10));
    fadeAnimation = Tween(begin: 0.2, end: 1.0).animate(animationController)..addListener(() {

    });
    animationController.repeat(reverse: true);

  }
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69A03A),
      body: Container(
        child: Column(
          children:
          [
            Spacer(),
            FadeTransition(
              opacity: fadeAnimation,

              child: Text(
                'Online Market',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 51,
                  fontWeight: FontWeight.w700,
                  color:  Color(0xffffffff),
                ),
              ),
            ),
            Spacer(),
            Image.asset(
                'assets/images/splash.png',
            ),

          ],
        ),
        ),

    );
  }
}
