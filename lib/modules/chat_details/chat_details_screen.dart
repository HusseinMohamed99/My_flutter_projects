import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/home/cubit/state.dart';
import 'package:flutter_projects/models/message_model.dart';
import 'package:flutter_projects/models/user_model.dart';
import 'package:flutter_projects/shared/styles/colors.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';


class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel userModel;
  ChatDetailsScreen({this.userModel});
  final controller = ScrollController();
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/99.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Builder(
        builder: (context) {
          SocialCubit.get(context).getMessages(receiverId: userModel.uId);
          return BlocConsumer<SocialCubit, SocialStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.transparent,
                  ),
                  backgroundColor: Colors.teal[300],
                  titleSpacing: -19.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          userModel.image,
                        ),
                        radius: 20.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        userModel.name,
                        style: TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconBroken.Video,
                        size: 22.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconBroken.Call,
                        size: 22.0,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        IconBroken.More_Circle,
                        size: 22.0,
                      ),
                    ),
                  ],
                ),
                body: ConditionalBuilder(
                  condition: SocialCubit.get(context).messages.length > 0 ||
                      SocialCubit.get(context).messages.length == 0,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            controller: controller,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              var message =
                                  SocialCubit.get(context).messages[index];
                              if (SocialCubit.get(context).userModel.uId ==
                                  message.senderId) {
                                return buildReceiverMessage(message);
                              } else {
                                return buildMessage(message);
                              }
                            },
                            separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                            itemCount: SocialCubit.get(context).messages.length,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                                controller: messageController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[900],
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20.0),
                                      bottomLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                      topLeft: Radius.circular(20.0),
                                    ),
                                    borderSide: BorderSide(
                                      color: Colors.green,
                                    ),
                                  ),
                                  hintText: 'type a message ......',
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                  prefixIcon: Icon(
                                    IconBroken.Voice,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: defaultColor,
                                shape: BoxShape.circle,
                              ),
                              height: 50.0,
                              child: MaterialButton(
                                onPressed: () {
                                  SocialCubit.get(context).sendMessages(
                                    receiverId: userModel.uId,
                                    dateTime: DateTime.now().toString(),
                                    text: messageController.text,
                                  );
                                  messageController.clear();
                                  controller.animateTo(
                                    controller.position.maxScrollExtent,
                                    duration: Duration(microseconds: 1),
                                    curve: Curves.easeIn,
                                  );
                                },
                                minWidth: 1.0,
                                child: Icon(
                                  IconBroken.Send,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  fallback: (context) => Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadiusDirectional.only(
                bottomEnd: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              )),
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          child: Text(
            model.text,
            textWidthBasis: TextWidthBasis.parent,
          ),
        ),
      );
  Widget buildReceiverMessage(MessageModel model) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadiusDirectional.only(
                bottomStart: Radius.circular(10.0),
                topEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              )),
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 5.0,
          ),
          child: Text(
            model.text,
            maxLines: 1,
          ),
        ),
      );
}
