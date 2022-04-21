import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/cubit/cubit.dart';
import 'package:flutter_projects/cubit/state.dart';

import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        var cubit = MainCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading:   Icon(Icons.add_shopping_cart_sharp),
              title: Text("E_Commerce"),

              actions:
              [
                IconButton(
                  icon: Icon(
                      IconBroken.Search,
                    color: Colors.deepOrangeAccent,
                  ),
                  onPressed: (){

                  },
                ),
                IconButton(
                  onPressed: ()
                  {
                  logOut(context);
                  },
                  icon: Icon(IconBroken.Logout),
                )
              ],
            ),
            body: cubit.pages[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 50.0,
              onTap: (index) {
                cubit.ChangeNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Category,
                  ),
                  label: 'Categories',
                ),

                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Bag,
                  ),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    IconBroken.Setting,
                  ),
                  label: 'Settings',
                ),

              ],
            ),
          ),
        );
      },

    );
  }
}
