void printFullText(String Text) {
  final pattern = RegExp('.{1,800}'); //800 is the size of each chunk
  pattern.allMatches(Text).forEach((match) => print(match.group(0)));
}

 String token = '' ;

 String uId = '' ;