import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/bloc_observer.dart';
import 'package:flutter_projects/layout/todo_app/todo_layout.dart';
import 'package:flutter_projects/network/local/cache_helper.dart';
import 'package:flutter_projects/network/remote/dio_helper.dart';
import 'package:flutter_projects/shared/cubit/cubit.dart';
import 'package:flutter_projects/styles/themes.dart';


import 'shared/cubit/states.dart';

void main() async {

  // بيتأكد ان كل حاجة خلصت و بعدين يرن
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getData(key: 'isDark');



  runApp(MyApp(
    isDark: isDark,

  ));
}
// Stateless
// Stateful
// class MyApp
class MyApp extends StatelessWidget {

  final bool isDark;


  MyApp({
    this.isDark,

  });
  // constructor
  // build
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(create:(context)=> AppCubit()
          ..changeAppMode(
            fromShared: isDark,
          )
        ),


      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state)
        {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
            AppCubit.get(context).isDark? ThemeMode.light : ThemeMode.dark,
            home:Home_Layout(),
          );
        },
      ),
    );
  }
}
