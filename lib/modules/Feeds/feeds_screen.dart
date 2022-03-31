import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/home/cubit/state.dart';
import 'package:flutter_projects/models/post_model.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';


class FeedsScreen extends StatelessWidget {

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<SocialCubit,SocialStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).posts.length >= 0 && SocialCubit.get(context).userModel != null,
          builder: (context)=> SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                // Card(
                //   margin: const EdgeInsets.all(9.0),
                //   clipBehavior: Clip.antiAliasWithSaveLayer,
                //   elevation: 20.0,
                //   child: Stack(
                //     alignment: AlignmentDirectional.bottomEnd,
                //     children: [
                //       const Image(
                //         image: NetworkImage(
                //             'https://img.freepik.com/free-photo/pyramids-with-beautiful-sky-giza-cairo-egypt_87394-2.jpg?w=740'),
                //         height: 200.0,
                //         width: double.infinity,
                //         fit: BoxFit.cover,
                //       ),
                //       Padding(
                //         padding: const EdgeInsets.all(8.0),
                //         child: Text(
                //           'Communicate with friends',
                //           style: Theme.of(context)
                //               .textTheme
                //               .subtitle1
                //               .copyWith(color: Colors.white),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => buildPostItem( SocialCubit.get(context).posts[index],context,index),
                  itemCount: SocialCubit.get(context).posts.length,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.0,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),

        );
      },
    );
  }

  Widget buildPostItem(PostModel model , context , index) =>  Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 20.0,
    margin: EdgeInsets.all(
      8.0,
    ),
    child: Padding(
      padding:  EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:  NetworkImage(
                  '${model.image}',
                ),
                radius: 25.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '${model.name}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(
                            height: 1.4,
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                          size: 16.0,
                        ),
                      ],
                    ),
                    Text(
                      '${model.dateTime}',
                      style:
                      Theme.of(context).textTheme.caption.copyWith(
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.more_horiz,
                  size: 18.0,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:10.0 ),
            child: myDivider(),
          ),
          Text(
            '${model.text}',
          ),

          //wrap
          // Padding(
          //   padding: const EdgeInsets.all(10.0),
          //   child: Container(
          //     width: double.infinity,
          //     child: Wrap(
          //       children:
          //       [
          //         Padding(
          //           padding: const EdgeInsetsDirectional.only(end: 6.0),
          //           child: Container(
          //             height: 20.0,
          //             child: MaterialButton(
          //               minWidth: 1.0,
          //               padding: EdgeInsets.zero,
          //               onPressed: () {},
          //               child: Text(
          //                 '#flutter',
          //                 style:
          //                 Theme.of(context).textTheme.caption.copyWith(
          //                   color: defaultColor,
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ),
          //
          //       ],
          //     ),
          //   ),
          // ),

          if(model.postImage != '')
            Padding(
              padding: const EdgeInsetsDirectional.only(
                top: 15.0,
              ),
              child: Container(
                clipBehavior:Clip.antiAliasWithSaveLayer,
                height: 300.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${model.postImage}',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
            ),
            child: Row(
              children:
              [

                Expanded(
                  child: InkWell(
                    onTap: ()
                    {

                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            IconBroken.Heart,
                            color: Colors.red,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '${SocialCubit.get(context).likes[index]}',
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            IconBroken.Chat,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                              'Comments'
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:10.0 ),
            child: myDivider(),
          ),
          Row(
            children:
            [
              Expanded(
                child: InkWell(
                  onTap: ()
                  {

                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:  NetworkImage(
                          '${SocialCubit.get(context).userModel.image}',
                        ),
                        radius: 20.0,
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        'Write a comment ...',
                        style:
                        Theme.of(context).textTheme.caption.copyWith(

                        ),
                      ),

                    ],
                  ),
                ),
              ),

              InkWell(

                onTap: ()
                {
                  SocialCubit.get(context).likePost(SocialCubit.get(context).postsId[index]);
                },
                child: Row(
                  children: [
                    Icon(
                      IconBroken.Heart,
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Text(
                      'Like',
                      style: Theme.of(context).textTheme.caption,

                    ),
                  ],
                ),
              ),
            ],
          ),

        ],
      ),
    ),
  );
}
