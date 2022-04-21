import 'package:flutter/material.dart';

void printFullText(String Text) {
  final pattern = RegExp('.{1,800}'); //800 is the size of each chunk
  pattern.allMatches(Text).forEach((match) => print(match.group(0)));
}


Widget separator (double wide,double high){
  return SizedBox(width: wide,height: high,);
}

 String token = '' ;

 String uId = '' ;

int cartLength = 0;




