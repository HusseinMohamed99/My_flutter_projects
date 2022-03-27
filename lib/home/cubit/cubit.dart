import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/state.dart';
import 'package:flutter_projects/models/categories.dart';
import 'package:flutter_projects/models/favorite.dart';
import 'package:flutter_projects/models/home.dart';
import 'package:flutter_projects/models/login.dart';
import 'package:flutter_projects/modules/category/categories.dart';
import 'package:flutter_projects/modules/favorite/favorite.dart';
import 'package:flutter_projects/modules/products/products.dart';
import 'package:flutter_projects/modules/setting/setting.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/shared/network/end_points.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';


class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialStates());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> bottomScreens =
  [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];

  void changeNavBar (int index) {
    currentIndex = index;
    emit(ChangeBottomNavBar());
  }

  HomeModel homeModel;
  Map<int,bool> favorites = {};
  
  void getHomeData() {
    emit(HomeLoadingStates());

    DioHelper.getData(
        url: HOME,
      token: token,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);
     // printFullText(homeModel.data.banners.toString());
      print(homeModel.status);
      print(token);

      homeModel.data.products.forEach((element)
      {
       favorites.addAll({
         element.id : element.inFavorites,
       });
      });


      emit(HomeSuccessStates());
    }

    ).catchError((error)
    {
      print(error.toString());
      emit(HomeErrorStates());
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



LoginModel UserData ;

  void getLoginData() {

    emit(LoginUserLoadingStates());

    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value)
    {
      UserData = LoginModel.fromJson(value.data);


      emit(LoginUserSuccessStates(UserData));
    }

    ).catchError((error)
    {
      print(error.toString());
      emit(LoginUserErrorStates());
    });

  }


  void UpdateUserData({
  @required String name,
  @required String email,
  @required String phone,
}) {

    emit(UpdateUserLoadingStates());

    DioHelper.putData(
      url: UPDATE,
      token: token,
      data: {
       'name' : name,
       'email' : email,
       'phone' : phone,

      }
    ).then((value)
    {
      UserData = LoginModel.fromJson(value.data);


      emit(UpdateUserSuccessStates(UserData));
    }

    ).catchError((error)
    {
      print(error.toString());
      emit(UpdateUserErrorStates());
    });

  }

}