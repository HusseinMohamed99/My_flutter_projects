
import 'package:flutter_projects/model/favorite_model.dart';
import 'package:flutter_projects/model/login_model.dart';

abstract class MainStates {}

class MainInitialState extends MainStates {}

class ChangeNavBarItem extends MainStates {}

class UserLoginLoadingState extends MainStates {}

class UserLoginSuccessState extends MainStates {
  final LoginModel  loginModel;

  UserLoginSuccessState(this.loginModel);
}

class UserLoginErrorState extends MainStates {
  final String error;

  UserLoginErrorState( this.error);
}

class UserUpdateLoadingState extends MainStates {}

class UserUpdateSuccessState extends MainStates {
  final LoginModel  loginModel;

  UserUpdateSuccessState(this.loginModel);
}

class UserUpdateErrorState extends MainStates {
  final String error;

  UserUpdateErrorState( this.error);
}

class UserChangePasswordState extends MainStates {}

class HomeLoadingState extends MainStates {}

class HomeSuccessState extends MainStates {}

class HomeErrorState extends MainStates {}

class CategoriesSuccessStates extends MainStates{}

class CategoriesErrorStates extends MainStates{}

class ChangeFavoritesSuccessStates extends MainStates
{
  final  ChangeFavoritesModel model;

  ChangeFavoritesSuccessStates(this.model);

}

class ChangeFavoritesStates extends MainStates{}

class ChangeFavoritesErrorStates extends MainStates{}

class FavoritesLoadingStates extends MainStates{}

class GetFavoritesSuccessStates extends MainStates{}

class GetFavoritesErrorStates extends MainStates{}






