import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/modules/business/business_screen.dart';
import 'package:flutter_projects/modules/sports/sports_screen.dart';
import 'package:flutter_projects/shared/cubit/states.dart';
import '../../modules/science/science_screen.dart';
import '../network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> BottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_basketball_sharp,
        ),
        label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science_outlined,
        ),
        label: 'Science'),

  ];
  List<Widget> screens = [
    Sports_Screen(),
    BusinessScreen(),
    ScienceScreen(),

  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1)
      getbusiness();
    if (index == 2)
      getscience();

    emit(NewsBottomNavState());
  }

  List <dynamic> sports = [];

  void getsports ()
  {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:
      {
        'country' : 'eg',
        'category' : 'sports',
        'apiKey' : '0803a9972d064bd8b3b7379123ea164c',
      },
    ).then((value)
    {
      sports = value.data['articles'];
      print (sports[0]['title']);
      emit(NewsGetSportsSuccessState());

    }).catchError((Error)
    {
      print (Error.toString());
      emit(NewsGetSportsErrorState(Error.toString()));
    });
  }


  List <dynamic> business = [];

  void getbusiness ()
  {
    emit(NewsGetBusinessLoadingState());
    if(business.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'eg',
          'category' : 'business',
          'apiKey' : '0803a9972d064bd8b3b7379123ea164c',
        },
      ).then((value)
      {
        business = value.data['articles'];
        print (business[0]['title']);
        emit(NewsGetBusinessSuccessState());

      }).catchError((Error)
      {
        print (Error.toString());
        emit(NewsGetBusinessErrorState(Error.toString()));
      });
    }else
    {
      emit(NewsGetBusinessSuccessState());
    }

  }


  List <dynamic> science = [];

  void getscience ()
  {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0)
    {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'country' : 'eg',
          'category' : 'science',
          'apiKey' : '0803a9972d064bd8b3b7379123ea164c',
        },
      ).then((value)
      {
        science = value.data['articles'];
        print (science[0]['title']);
        emit(NewsGetScienceSuccessState());

      }).catchError((Error)
      {
        print (Error.toString());
        emit(NewsGetScienceErrorState(Error.toString()));
      });
    }else
    {
      emit(NewsGetScienceSuccessState());
    }
  }

  
  List<dynamic> search = [];

  void getSearch(String value)
  {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
      url: 'v2/everything',
      query:
      {
        'q':'$value',
        'apiKey':'0803a9972d064bd8b3b7379123ea164c',
      },
    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }








}
