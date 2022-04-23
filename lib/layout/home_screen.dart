import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/cart/cart.dart';
import 'package:flutter_projects/Screens/product_detalis/product_details.dart';
import 'package:flutter_projects/Screens/search/search.dart';
import 'package:flutter_projects/cubit/cubit.dart';
import 'package:flutter_projects/cubit/state.dart';
import 'package:flutter_projects/model/home/home_model.dart';

import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit,MainStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        ProductModel model;
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
                  onPressed: ()
                  {
                    navigateTo(context, SearchScreen());

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
              backgroundColor: Colors.deepOrangeAccent,
              onPressed: ()
              {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>CartScreen()));
              },
              child: Icon(
                  Icons.add_shopping_cart,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: AnimatedBottomNavigationBar(
              elevation: 50.0,
              onTap: (index) {
                cubit.ChangeNavBar(index);
              },
              activeIndex: cubit.currentIndex,

              icons: [
                IconBroken.Home,
                IconBroken.Category,
                IconBroken.Heart,
                IconBroken.Setting,
              ],
              activeColor: Colors.deepOrangeAccent,
              splashColor: Colors.red,
              inactiveColor: Colors.black,
              iconSize: 30.0,
              //backgroundColor: Colors.grey[200],
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.smoothEdge,
              leftCornerRadius: 32,
              rightCornerRadius: 32,
            ),
          ),
        );
      },

    );
  }
}
