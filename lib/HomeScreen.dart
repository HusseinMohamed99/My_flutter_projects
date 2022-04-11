import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.teal,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'MASTER',
                  style: Theme.of(context).textTheme.headline1.copyWith(
                    color: Colors.white
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
