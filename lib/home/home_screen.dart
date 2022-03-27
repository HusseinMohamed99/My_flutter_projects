import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/home/cubit/state.dart';
import 'package:flutter_projects/modules/on_boarding/on_boardingScreen.dart';
import 'package:flutter_projects/modules/search/search_screen.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Icon(
                    Icons.add_shopping_cart_sharp,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text('Panda Shop'),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    navigateTo(context, SearchScreen());
                  },
                  icon: Icon(
                    Icons.search_outlined,
                    size: 30.0,
                    color: Colors.black,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    navigateAndFinish(context, onBoardingScreen());
                    logOut(context);
                  },
                  child: Icon(
                    Icons.exit_to_app,
                    color: Colors.black,
                  ),
                  backgroundColor: Colors.white70,
                  elevation: 0.0,
                ),
              ],
            ),
            body: cubit.bottomScreens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              elevation: 50.0,
              onTap: (index) {
                cubit.changeNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_outlined,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.grid_view,
                  ),
                  label: 'Categories',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_border,
                  ),
                  label: 'Favorites',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
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
