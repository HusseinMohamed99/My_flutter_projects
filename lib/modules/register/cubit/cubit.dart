import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/models/login.dart';
import 'package:flutter_projects/modules/register/cubit/state.dart';
import 'package:flutter_projects/shared/network/end_points.dart';
import 'package:flutter_projects/shared/network/remote/dio_helper.dart';



class RegisterCubit extends Cubit<RegisterStates>
{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  LoginModel loginModel ;

  void UserRegister({
  @required String email ,
  @required String password ,
  @required String name ,
  @required String phone ,
})
  {
    emit(RegisterLoadingState());
    DioHelper.postData(
        url: REGISTER,
        data:
    {
      'name' : name,
      'phone' : phone,
      'email' : email,
      'password' : password,

    },).then((value)
    {
      loginModel = LoginModel.fromJson(value.data);

      emit(RegisterSuccessState(loginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(RegisterErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void ChangePassword()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    
    emit(ChangePasswordRegisterState());
  }

}