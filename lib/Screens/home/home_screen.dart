import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/Screens/home/cubit/cubit.dart';
import 'package:flutter_projects/Screens/home/cubit/state.dart';
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
                  icon: Icon(IconBroken.Search),
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
              currentIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.ChangeNavBar(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Home),
                 label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Category),
                  label: 'Category',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Heart),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(IconBroken.Profile),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
