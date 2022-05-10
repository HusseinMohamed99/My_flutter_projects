import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/shared/mode_cubit/cubit.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ModeCubit.get(context).isDark
              ? Image(
                  image: AssetImage('assets/images/Dark Logo.png'),
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                )
              : Image(
                  image: AssetImage('assets/images/Light Logo.png'),
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                )),
    );
  }
}
