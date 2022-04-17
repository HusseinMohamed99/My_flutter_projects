
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF69A03A),
      body: Container(
        child: Column(
          children:
          [
            Spacer(),
            Text(
              'Fruit Market',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 51,
                fontWeight: FontWeight.w700,
                color:  Color(0xffffffff),
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
