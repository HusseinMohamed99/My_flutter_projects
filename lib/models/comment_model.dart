import 'package:cloud_firestore/cloud_firestore.dart';

class CommentModel
{
  String name;
  String image;
  String commentText;
  Map<String,dynamic> commentImage;
  String time;
  FieldValue dateTime;


  CommentModel({
    this.name,
    this.image,
    this.commentText,
    this.commentImage,
    this.time,
    this.dateTime,
  });

  CommentModel.fromJson(Map<String, dynamic> json){
    name = json['name'];
    image = json['image'];
    commentText = json['commentText'];
    commentImage = json['commentImage'];
    time = json['time'];
  }

  Map<String, dynamic> toMap (){
    return {
      'name':name,
      'image':image,
      'commentText':commentText,
      'commentImage': commentImage,
      'time':time,
      'dateTime':dateTime,

    };
  }
}