
import 'package:flutter_projects/models/login.dart';

abstract class RegisterStates{}

class RegisterInitialState extends RegisterStates{}

class RegisterLoadingState extends RegisterStates{}

class RegisterSuccessState extends RegisterStates{

  final LoginModel  loginModel;

  RegisterSuccessState(this.loginModel);

}

class RegisterErrorState extends RegisterStates{

  final String error;

  RegisterErrorState(this.error);
}

class ChangePasswordRegisterState extends RegisterStates{}