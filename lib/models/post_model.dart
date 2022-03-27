class PostModel
{
  String name;
  String image;
  String uId;
  String dateTime;
  String text;
  String postImage;

  PostModel({
    this.name,
    this.image,
    this.uId,
    this.dateTime,
    this.text,
    this.postImage,
  });

  PostModel.fromJson(Map<String,dynamic>json)
  {

    name = json['name'];
    image = json['image'];
    dateTime = json['dateTime'];
    text = json['text'];
    postImage = json['postImage'];
    uId = json['uId'];
  }


  Map<String,dynamic> toMap()
  {
    return
      {
        'name' : name,
        'uId' : uId,
        'image' : image,
        'dateTime' : dateTime,
        'text' : text,
        'postImage' : postImage,
      };
  }

}