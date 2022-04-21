import 'package:flutter_projects/model/cart/add_cart_model.dart';
import 'package:flutter_projects/model/favorite/favorite_model.dart';
import 'package:flutter_projects/model/login/login_model.dart';

abstract class MainStates {}

class MainInitialStates extends MainStates {}


////////////////////// User ///////////////////////////////

class UserLoginLoadingStates extends MainStates {}

class UserLoginSuccessStates extends MainStates {

  final LoginModel  loginModel;

  UserLoginSuccessStates(this.loginModel);
}

class UserLoginErrorStates extends MainStates {
  final String error;

  UserLoginErrorStates( this.error);
}

class UserUpdateLoadingStates extends MainStates {}

class UserUpdateSuccessStates  extends MainStates {
  final LoginModel  loginModel;

  UserUpdateSuccessStates(this.loginModel);
}

class UserUpdateErrorStates extends MainStates {
  final String error;

  UserUpdateErrorStates( this.error);
}

class UserChangePasswordStates extends MainStates {}

////////////////////// Home ///////////////////////////////

class HomeLoadingStates extends MainStates {}

class HomeSuccessStates extends MainStates {}

class HomeErrorStates extends MainStates {}

////////////////////// Favorites ///////////////////////////////

class FavoritesLoadingStates extends MainStates{}

class GetFavoritesSuccessStates extends MainStates{}

class GetFavoritesErrorStates extends MainStates{}

class ChangeFavoritesStates extends MainStates{}

class ChangeFavoritesSuccessStates extends MainStates
{
  final  ChangeFavoritesModel model;

  ChangeFavoritesSuccessStates(this.model);

}


class ChangeFavoritesErrorStates extends MainStates{}

////////////////////// Products_Home ///////////////////////////////

class ProductLoadingStates extends MainStates{}

class ProductSuccessStates extends MainStates {}

class ProductErrorStates extends MainStates{}

////////////////////// Category  ///////////////////////////////

class CategoriesSuccessStates extends MainStates{}

class CategoriesErrorStates extends MainStates{}

class CategoryDetailsLoadingStates extends MainStates{}

class CategoryDetailsSuccessStates extends MainStates{}

class CategoryDetailsErrorStates extends MainStates{}

////////////////////// Cart  ///////////////////////////////

class CartLoadingStates extends MainStates{}

class GetCartSuccessStates extends MainStates{}

class GetCartErrorStates extends MainStates{}

class ChangeCartStates extends MainStates{}

class ChangeCartSuccessStates extends MainStates{

  final  ChangeCartModel model;

  ChangeCartSuccessStates(this.model);

}

class ChangeCartErrorStates extends MainStates{}

class UpdateCartLoadingStates extends MainStates{}

class UpdateCartSuccessStates extends MainStates{}

class UpdateCartErrorStates extends MainStates{}

//////////////////////   ///////////////////////////////

class ChangeNavBarItem extends MainStates {}










