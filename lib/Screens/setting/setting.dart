import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/Favorites/favorite.dart';
import 'package:flutter_projects/Screens/edit/edit.dart';
import 'package:flutter_projects/cubit/cubit.dart';
import 'package:flutter_projects/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';

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
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.grey,
                child: Column(
                  children:
                  [
                    InkWell(
                      onTap: (){
                        navigateTo(context, FavoritesScreen());
                      },
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children:
                          [
                            Icon(Icons.favorite_border_rounded,color: Colors.green,),
                            separator(15, 0),
                            Text('Favorites',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded),
                            separator(10,0),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

        );
      },

    );
  }
}
