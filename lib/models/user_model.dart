class SocialUserModel
{
  String name;
  String email;
  String phone;
  String image;
  String bio;
  String cover;
  String uId;
  bool isEmailVerified;

  SocialUserModel({
    this.email,
    this.name,
    this.image,
    this.phone,
    this.cover,
    this.bio,
    this.uId,
    this.isEmailVerified,
});

  SocialUserModel.fromJson(Map<String,dynamic>json)
  {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    image = json['image'];
    bio = json['bio'];
    cover = json['cover'];
    uId = json['uId'];
    isEmailVerified = json['isEmailVerified'];
  }


  Map<String,dynamic> toMap()
  {
    return
      {
        'email' : email,
        'name' : name,
        'phone' : phone,
        'uId' : uId,
        'image' : image,
        'cover' : cover,
        'bio' : bio,
        'isEmailVerified' : isEmailVerified,
      };
  }

}