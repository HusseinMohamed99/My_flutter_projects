import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/login.dart';
import 'package:flutter_projects/modules/login/cubit/state.dart';
import 'package:flutter_projects/shared/network/end_points.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';



class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel ;

  void UserLogin({
  @required String email ,
  @required String password ,
})
  {
    emit(LoginLoadingState());
    DioHelper.postData(
        url: LOGIN,
        data:
    {
      'email' : email,
      'password' : password,

    },).then((value)
    {
      loginModel = LoginModel.fromJson(value.data);

      emit(LoginSuccessState(loginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePassword()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    
    emit(ChangePasswordState());
  }

}