import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/cart/cart.dart';
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
            floatingActionButton: FloatingActionButton(
              onPressed: ()
              {
                navigateTo(context, CartScreen());
              },
              child: Icon(
                  Icons.shopping_cart
              ),
              backgroundColor: Colors.deepOrangeAccent,

            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

            bottomNavigationBar: AnimatedBottomNavigationBar(
              activeIndex: cubit.currentIndex,
              onTap: (index)
              {
                cubit.ChangeNavBar(index);
              },
              splashColor: Colors.red,
              activeColor: Colors.deepOrangeAccent,
              backgroundColor: Colors.white,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,

              icons: [
                IconBroken.Home,
                IconBroken.Category,
                IconBroken.Heart,
                IconBroken.Profile,
              ],
            ),
          ),
        );
      },

    );
  }
}
