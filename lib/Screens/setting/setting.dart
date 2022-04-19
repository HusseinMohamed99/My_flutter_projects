import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/edit/edit.dart';
import 'package:flutter_projects/Screens/home/cubit/cubit.dart';
import 'package:flutter_projects/Screens/home/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';

class SettingScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener:(context,state)
      {
        if(state is UserLoginSuccessState) {}
      } ,
      builder: (context,state)
      {
        var model = MainCubit.get(context).UserData;
        return Scaffold(
          body: Column(
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
                      onTap: ()
                      {
                        MainCubit.get(context).pickImage(

                        );
                      },
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
            ],
          ),

        );
      },

    );
  }
}
