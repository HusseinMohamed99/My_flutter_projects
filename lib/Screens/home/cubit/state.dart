
import 'package:flutter_projects/Screens/home/cubit/cubit.dart';
import 'package:flutter_projects/Screens/home/cubit/cubit.dart';
import 'package:flutter_projects/model/add_cart_model.dart';
import 'package:flutter_projects/model/cart_model.dart';
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

class AddCartLoadingState extends MainStates{}
class AddCartSuccessState extends MainStates {
  final AddCartModel addCartModel;

  AddCartSuccessState(this.addCartModel);
}
class AddCartErrorState extends MainStates{}

class CartLoadingStates extends MainStates{}

class GetCartSuccessStates extends MainStates{}

class GetCartErrorStates extends MainStates{}

class UpdateCartLoadingState extends MainStates{}

class UpdateCartSuccessState extends MainStates {}

class UpdateCartErrorState extends MainStates{}

class MinusCartItemState extends MainStates{}

class PlusCartItemState extends MainStates{}

class ProductLoadingState extends MainStates{}

class ProductSuccessState extends MainStates {}

class ProductErrorState extends MainStates{}

class CategoryDetailsLoadingState extends MainStates{}

class CategoryDetailsSuccessState extends MainStates{}

class CategoryDetailsErrorState extends MainStates{}

class ChangeIndicatorState extends MainStates{}








