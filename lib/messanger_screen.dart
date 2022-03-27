import 'package:flutter/material.dart';

class messenger_screen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children:
          [
            CircleAvatar(
              radius:20.0 ,
              backgroundImage:  buildImage(),


            ),
            SizedBox(
              width: 15.0,
            ),
            Text(
              'Chats',
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.black,

              ),
            ),


          ],
        ),

        actions:

        [
          IconButton(onPressed: (){},

            icon: CircleAvatar
              (
                radius: 15.0,
                child: Icon
                  (
                  Icons.camera_alt,
                  size: 20.0,
                )),


          ),
          IconButton(onPressed: (){},

            icon: CircleAvatar
              (
                radius: 15.0,
                child: Icon
                  (
                  Icons.edit,
                  size: 20.0,
                )),

          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(


                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10.0,),

                      color: Colors.grey[300]
                  ),
                  padding: EdgeInsets.all(5.0,),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        'Search',
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height:25.0 ,
                ),
                Container(

                    height: 102.0,
                    child: ListView.separated(
                      shrinkWrap: true,

                      scrollDirection: Axis.horizontal ,
                      itemBuilder:(context, index) => buildStoryItem() ,
                      separatorBuilder: (context, index) => SizedBox(
                        width: 20.0,
                      ),
                      itemCount: 100,
                    )),
                SizedBox(
                  height:30.0 ,
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) =>  buildChatItem (),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20.0,
                  ) ,
                  itemCount: 100,
                ),



              ],
            )
        ),

      ),


    );
  }

  Widget buildChatItem ()=>Row(
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd ,
        children: [

          CircleAvatar(
            radius:25.0 ,
            backgroundImage:  buildImage(),


          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              bottom: 3.0,
              end: 3.0,
            ),

            child: CircleAvatar(
              radius: 6.0,
              backgroundColor: Colors.green,

            ),
          ),

        ],
      ),
      SizedBox(
        width:10.0 ,
      ),
      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hussein Mohamed',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              SizedBox(
                height:3.0 ,
              ),
              Row(
                children: [


                  Expanded(
                      child: Text(

                        'Sometimes a simple thanks is not enough and you feel like giving a million hugs to the people you love the most. This note is for those situations. If you have a family member that deserves all the thanks you can send their way, then message them with these few words. ',

                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )),
                  SizedBox(
                    width: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,),
                    child: Container(
                      width: 7.0,
                      height: 7.0,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Text(
                    '02:55 pm',
                  ),

                ],
              ),
            ],
          )),




    ],

  ) ;
  Widget buildStoryItem ()=> Container(
      width: 60.0 ,
      child: Column
        (
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd ,
            children: [

              CircleAvatar(
                radius:26.0 ,
                backgroundImage: buildImage(),

              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),

                child: CircleAvatar(
                  radius: 6.0,
                  backgroundColor: Colors.green,

                ),
              ),

            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(

            'Hussein Mohamed Ammar Mohamed ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,



            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 13.0,

            ),
          ),
        ],
      )
  );

  AssetImage buildImage()=> AssetImage('assets/images/online.png',);

}
