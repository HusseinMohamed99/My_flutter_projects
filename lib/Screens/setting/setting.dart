import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/edit/edit.dart';
import 'package:flutter_projects/cubit/cubit.dart';
import 'package:flutter_projects/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener:(context,state)
      {
        if(state is UserLoginSuccessStates) {}
      } ,
      builder: (context,state)
      {
        var model = MainCubit.get(context).UserData;
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children:
              [
                Stack(
                  children: [

                    Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.deepOrangeAccent,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                          radius: 100,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 90,
                            backgroundImage: NetworkImage('https://i.pinimg.com/564x/10/e7/67/10e7677471b96d788dabdab7bd20083a.jpg'),

                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                          onPressed: ()
                          {
                            navigateTo(context, EditScreen());
                          },
                          icon: Icon(
                            IconBroken.Edit_Square,
                            color: Colors.white,
                            size: 30,
                          )
                      ),
                    ),
                  ],
                ),
                space(0, 20),
                InkWell(
                  onTap: (){
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children:
                      [
                        Icon(IconBroken.Profile,color: Colors.deepOrange,size: 35,),
                        space(15, 0),
                        Text('My Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children:
                      [
                        Icon(IconBroken.Notification,color: Colors.deepOrange,size: 35,),
                        space(15, 0),
                        Text('Notifications',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children:
                      [
                        Icon(Icons.shopping_cart_outlined,color: Colors.deepOrange,size: 35,),
                        space(15, 0),
                        Text('My Orders',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                      ],
                    ),
                  ),
                ),
                InkWell(
                onTap: (){
                  navigateTo(context, EditScreen());
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children:
                    [
                      Icon(IconBroken.Document,color: Colors.deepOrange,size: 35,),
                      space(15, 0),
                      Text('Complaints',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    ],
                  ),
                ),
              ),
                InkWell(
                onTap: (){
                  navigateTo(context, EditScreen());
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children:
                    [
                      Icon(IconBroken.Setting,color: Colors.deepOrange,size: 35,),
                      space(15, 0),
                      Text('General',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    ],
                  ),
                ),
              ),
                InkWell(
                  onTap: (){
                    navigateTo(context, EditScreen());
                  },
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(15),
                    child: Row(
                      children:
                      [
                        Icon(FontAwesomeIcons.fontAwesome,color: Colors.deepOrange,size: 35,),
                        space(15, 0),
                        Text('FAQ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                      ],
                    ),
                  ),
                ),
                InkWell(
                onTap: (){
                  navigateTo(context, EditScreen());
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children:
                    [
                      Icon(Icons.help_outline,color: Colors.deepOrange,size: 35,),
                      space(15, 0),
                      Text('Help Center',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    ],
                  ),
                ),
              ),
                InkWell(
                onTap: (){
                  navigateTo(context, EditScreen());
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children:
                    [
                      Icon(IconBroken.Info_Circle,color: Colors.deepOrange,size: 35,),
                      space(15, 0),
                      Text('About us',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    ],
                  ),
                ),
              ),
                InkWell(
                onTap: (){
                  AwesomeDialog(
                    context: context,
                    dialogType: DialogType.QUESTION,
                    animType: AnimType.RIGHSLIDE,
                    title: 'Do you want to Logout?',
                    desc: "Please, Login soon 🤚",
                    btnOkOnPress: () {
                     logOut(context);
                    },
                    btnCancelOnPress: () {},
                  ).show();
                },
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Row(
                    children:
                    [
                      Icon(IconBroken.Logout,color: Colors.deepOrange,size: 35,),
                      space(15, 0),
                      Text('Log Out',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

                    ],
                  ),
                ),
              ),

              ],
            ),
          ),

        );
      },

    );
  }
}
