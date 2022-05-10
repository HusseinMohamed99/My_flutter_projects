// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, prefer_const_constructors_in_immutables

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/login/login_screen.dart';
import 'package:flutter_projects/Screens/splash/splash_screen.dart';
import 'package:flutter_projects/shared/bloc_observer.dart';
import 'package:flutter_projects/cubit/cubit.dart';
import 'package:flutter_projects/layout/home_screen.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/network/cache_helper.dart';
import 'package:flutter_projects/network/dio_helper.dart';
import 'package:flutter_projects/shared/mode_cubit/cubit.dart';
import 'package:flutter_projects/shared/mode_cubit/state.dart';
import 'package:flutter_projects/shared/styles/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );
  await DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getBoolean(key: 'isDark');
  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  token = CacheHelper.getData(key: 'token');

  // if(onBoarding != null)

  if (token != null) {
    widget = HomeScreen();
  } else {
    widget = LoginScreen();
  }

  runApp(Myapp(
    startWidget: widget,
    isDark: isDark,
  ));
}

class Myapp extends StatelessWidget {
  final bool isDark;
  final Widget startWidget;

  Myapp({this.startWidget, this.isDark});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => MainCubit()
              ..getHomeData()
              ..getCategoriesData()
              ..getFavoritesData()
              ..getUserData()
              ..getCartData()
              ..getFaqData()),
        BlocProvider(
          create: (context) => ModeCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
      ],
      child: BlocConsumer<ModeCubit, ModeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ModeCubit.get(context).isDark
                ? ThemeMode.dark
                : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(
              splash: SplashScreen(),
              backgroundColor:
                  ModeCubit.get(context).backgroundColor.withOpacity(1),
              nextScreen: startWidget,
              animationDuration: Duration(milliseconds: 2000),
              splashTransition: SplashTransition.scaleTransition,
            ),
          );
        },
      ),
    );
  }
}
