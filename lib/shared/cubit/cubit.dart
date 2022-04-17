import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/Screens/Categories/category.dart';
import 'package:flutter_projects/Screens/Favorites/favorite.dart';
import 'package:flutter_projects/Screens/Products/product.dart';
import 'package:flutter_projects/Screens/home/home_screen.dart';
import 'package:flutter_projects/Screens/setting/setting.dart';
import 'package:flutter_projects/model/category_model.dart';
import 'package:flutter_projects/model/favorite_model.dart';
import 'package:flutter_projects/model/home_model.dart';
import 'package:flutter_projects/model/login_model.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/shared/cubit/state.dart';
import 'package:flutter_projects/shared/network/End_Points.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());
  static MainCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> pages = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  void ChangeNavBar(int index) {
    currentIndex = index;
    emit(ChangeNavBarItem());
  }

  LoginModel UserData;


void getUserData() {
emit(UserLoginLoadingState());

DioHelper.getData(
    url: PROFILE,
  token: token,
).then((value)
{
  UserData = LoginModel.fromJson(value.data);
  emit(UserLoginSuccessState(UserData));
}).catchError((error)
{
  print(error.toString());
  emit(UserLoginErrorState(error.toString()));
});
}

  void UpdateUserData({
  @required String email,
  @required String name,
  @required String phone,
  }) {
    emit(UserUpdateLoadingState());

    DioHelper.putData(
      url: UPDATE,
      token: token,
      data: {
        'email': email,
        'name': name,
        'phone': phone,
      },
    ).then((value)
    {
      UserData = LoginModel.fromJson(value.data);
      emit(UserUpdateSuccessState(UserData));
    }).catchError((error)
    {
      print(error.toString());
      emit(UserUpdateErrorState(error.toString()));
    });
  }





  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePassword() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(UserChangePasswordState());
  }

  HomeModel homeModel;
  Map<int,bool> favorites = {};

  void getHomeData() {
    emit(HomeLoadingState());

    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);
      printFullText(homeModel.data.banners.toString());
      print(homeModel.status);
      print(token);

      homeModel.data.products.forEach((element)
      {
        favorites.addAll({
          element.id : element.inFavorites,
        });
      });


      emit(HomeSuccessState());
    }

    ).catchError((error)
    {
      print(error.toString());
      emit(HomeErrorState());
    });

  }


  CategoriesModel categoriesModel;

  void getCategoriesData() {
    DioHelper.getData(
      url: CATEGORIES,
      token: token,
    ).then((value)
    {
      categoriesModel = CategoriesModel.fromJson(value.data);


      emit(CategoriesSuccessStates());
    }

    ).catchError((error)
    {
      print(error.toString());
      emit(CategoriesErrorStates());
    });

  }



  ChangeFavoritesModel changeFavoritesModel;

  void ChangeFavorites(int productID)
  {
    favorites[productID] =!favorites[productID];
    emit(ChangeFavoritesStates());

    DioHelper.postData(
        url: FAVORITES,
        token: token,
        data:
        {
          'product_id' : productID,
        }
    ).then((value)
    {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);

      if(!changeFavoritesModel.status)
      {
        favorites[productID] =!favorites[productID];

      }else
      {
        getFavoritesData();
      }
      emit(ChangeFavoritesSuccessStates(changeFavoritesModel));
    }

    ).catchError((error)
    {
      favorites[productID] =!favorites[productID];
      emit(ChangeFavoritesErrorStates());
    });

  }


  FavoritesModel favoritesModel ;

  void getFavoritesData() {

    emit(FavoritesLoadingStates());

    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value)
    {
      favoritesModel = FavoritesModel.fromJson(value.data);


      emit(GetFavoritesSuccessStates());
    }

    ).catchError((error)
    {
      print(error.toString());
      emit(GetFavoritesErrorStates());
    });

  }
}