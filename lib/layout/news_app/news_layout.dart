// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors, camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/layout/cubit/cubit.dart';
import 'package:flutter_projects/modules/search/search_screen.dart';
import 'package:flutter_projects/shared/components/componentes.dart';
import 'package:flutter_projects/shared/cubit/cubit.dart';

import '../../shared/cubit/states.dart';

class News_Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        var Cubit = ModeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                  size: 30.0,
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              IconButton(
                onPressed: () {
                  ModeCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                  size: 30.0,
                ),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.BottomItems,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
          ),
        );
      },
    );
  }
}
