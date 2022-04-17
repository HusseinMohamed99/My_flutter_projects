import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/home/home_screen.dart';
import 'package:flutter_projects/Screens/login/login_screen.dart';
import 'package:flutter_projects/Screens/splash/splash_screen.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/Screens/home/cubit/cubit.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';
import 'package:flutter_projects/shared/styles/themes.dart';





void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  token = CacheHelper.getData(key: 'token');
  print('token $token');

  if(onBoarding != null)
  {
    if(token != null) {
      widget = HomeScreen();
    } else {
      widget = LoginScreen();
    }
  }else
  {
    widget = LoginScreen();
  }


  runApp( Myapp(
    startWidget : widget,
  ));
}
class Myapp extends StatelessWidget {
  final Widget startWidget;

  Myapp({this.startWidget,});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider(create: (context) => MainCubit()
         ..getHomeData()
         ..getCategoriesData()
         ..getFavoritesData()
         ..getUserData()


       ),

      ],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
