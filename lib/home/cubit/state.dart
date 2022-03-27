

import 'package:flutter_projects/models/favorite.dart';
import 'package:flutter_projects/models/login.dart';

abstract class HomeStates{}

class HomeInitialStates extends HomeStates{}

class ChangeBottomNavBar extends HomeStates{}

class HomeLoadingStates extends HomeStates{}

class HomeSuccessStates extends HomeStates{}

class HomeErrorStates extends HomeStates{}

class CategoriesSuccessStates extends HomeStates{}

class CategoriesErrorStates extends HomeStates{}

class ChangeFavoritesSuccessStates extends HomeStates
{
  final  ChangeFavoritesModel model;

  ChangeFavoritesSuccessStates(this.model);

}

class ChangeFavoritesStates extends HomeStates{}

class ChangeFavoritesErrorStates extends HomeStates{}

class FavoritesLoadingStates extends HomeStates{}

class GetFavoritesSuccessStates extends HomeStates{}

class GetFavoritesErrorStates extends HomeStates{}

class LoginUserLoadingStates extends HomeStates{}

class LoginUserSuccessStates extends HomeStates
{
  final LoginModel loginModel;

  LoginUserSuccessStates(this.loginModel);
}

class LoginUserErrorStates extends HomeStates{}

class UpdateUserLoadingStates extends HomeStates{}

class UpdateUserSuccessStates extends HomeStates
{
  final LoginModel loginModel;

  UpdateUserSuccessStates(this.loginModel);
}

class UpdateUserErrorStates extends HomeStates{}