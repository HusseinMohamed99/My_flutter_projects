
abstract class LoginStates{}

class LoginInitialState extends LoginStates{}

class LoginLoadingState extends LoginStates{}

class LoginSuccessState extends LoginStates
{
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates{

  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordState extends LoginStates{}