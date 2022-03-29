class MessageModel
{
  String dateTime;
  String text;
  String senderId;
  String receiverId;


  MessageModel({
    this.dateTime,
    this.text,
    this.senderId,
    this.receiverId,

  });

  MessageModel.fromJson(Map<String,dynamic>json)
  {
    dateTime = json['dateTime'];
    text = json['text'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];

  }

  Map<String,dynamic> toMap()
  {
    return
      {
        'dateTime' : dateTime,
        'text' : text,
        'senderId' : senderId,
        'receiverId' : receiverId,
      };
  }

}