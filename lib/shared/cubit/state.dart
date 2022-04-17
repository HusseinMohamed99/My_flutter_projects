
import 'package:flutter_projects/model/favorite_model.dart';
import 'package:flutter_projects/model/login_model.dart';

abstract class MainState {}

class MainInitialState extends MainState {}

class ChangeNavBarItem extends MainState {}

class UserLoginLoadingState extends MainState {}

class UserLoginSuccessState extends MainState {
  final LoginModel  loginModel;

  UserLoginSuccessState(this.loginModel);
}

class UserLoginErrorState extends MainState {
  final String error;

  UserLoginErrorState( this.error);
}

class UserUpdateLoadingState extends MainState {}

class UserUpdateSuccessState extends MainState {
  final LoginModel  loginModel;

  UserUpdateSuccessState(this.loginModel);
}

class UserUpdateErrorState extends MainState {
  final String error;

  UserUpdateErrorState( this.error);
}

class UserChangePasswordState extends MainState {}

class HomeLoadingState extends MainState {}

class HomeSuccessState extends MainState {}

class HomeErrorState extends MainState {}

class CategoriesSuccessStates extends MainState{}

class CategoriesErrorStates extends MainState{}

class ChangeFavoritesSuccessStates extends MainState
{
  final  ChangeFavoritesModel model;

  ChangeFavoritesSuccessStates(this.model);

}

class ChangeFavoritesStates extends MainState{}

class ChangeFavoritesErrorStates extends MainState{}

class FavoritesLoadingStates extends MainState{}

class GetFavoritesSuccessStates extends MainState{}

class GetFavoritesErrorStates extends MainState{}

