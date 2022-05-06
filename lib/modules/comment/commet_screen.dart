// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';

class CommentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              IconBroken.Chart,
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              IconBroken.Login,
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(
              IconBroken.Arrow___Right,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              IconBroken.Heart,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildCommentItem(context),
        separatorBuilder: (context, index) => myDivider(),
        itemCount: 10,
      ),
    );
  }

  Widget buildCommentItem(context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          myDivider(),
          SizedBox(
            height: 10.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35.0,
                backgroundImage: AssetImage('assets/images/M.png'),
              ),
              SizedBox(
                width: 5.0,
              ),
              Column(
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    color: Colors.blueGrey,
                    child: Column(
                      children: [
                        Text(
                          'Hussein Mohamed ',
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                color: Colors.white,
                              ),
                        ),
                        Text(
                          'حمثلاح بتاع شو ',
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        DateTime.now().minute.toString(),
                      ),
                      Text('m'),
                      SizedBox(
                        width: 10.0,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Like',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      );
}
