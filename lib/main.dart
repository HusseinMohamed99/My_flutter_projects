// ignore_for_file: unused_local_variable

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/home/home_screen.dart';
import 'package:flutter_projects/modules/on_boarding/on_boardingScreen.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';
import 'package:flutter_projects/shared/styles/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var token = FirebaseMessaging.instance.getToken();
  // print(token);
  // FirebaseMessaging.onMessage.listen((event)
  // {
  //   print('on message');
  //   print(event.data.toString());
  //
  //   ShowToast(text: 'on Message', state: ToastStates.SUCCESS);
  // });

  // FirebaseMessaging.onBackgroundMessage.listen((event)
  // {
  //   print('on Message Opened App');
  //   print(event.data.toString());
  //
  //   ShowToast(text: 'on Message Opened App', state: ToastStates.SUCCESS);
  // });

  await Firebase.initializeApp();

  // FirebaseMessaging.onMessageOpenedApp.listen((event)
  // {
  //   print('on Message Opened App');
  //   print(event.data.toString());
  //
  //   ShowToast(text: 'on Message Opened App', state: ToastStates.SUCCESS);
  // });

  DioHelper.init();
  await CacheHelper.init();

  Widget widget;

  bool onBoarding = CacheHelper.getData(key: 'onBoarding');

  uId = CacheHelper.getData(key: 'uId');

  if (uId != null) {
    widget = const HomeScreen();
  } else {
    widget = onBoardingScreen();
  }

  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;

  const MyApp({
    Key key,
    this.startWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => SocialCubit()
              ..getPosts()
              ..getUserData()),
      ],
      child: MaterialApp(
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
        home: startWidget,
      ),
    );
  }
}
