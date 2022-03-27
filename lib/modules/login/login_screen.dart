import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/home_screen.dart';
import 'package:flutter_projects/modules/login/cubit/cubit.dart';
import 'package:flutter_projects/modules/login/cubit/state.dart';
import 'package:flutter_projects/modules/register/register_screen.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/componnetns/constants.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';


class  LoginScreen extends StatelessWidget {

  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>
        (
        listener: (context, state)
        {
          if(state is LoginSuccessState)
          {
            if (state.loginModel.status)
            {
              print(state.loginModel.message);
              print(state.loginModel.data.token);

              CacheHelper.saveData(key: 'token', value:state.loginModel.data.token )
                  .then((value)
              {
                token = state.loginModel.data.token;
                navigateAndFinish(context, HomeScreen());
              }
              );
            }else {
              ShowToast(
                  text: state.loginModel.message,
                  state: ToastStates.ERROR,);
              print(state.loginModel.message);
            }
          }
        },
        builder:(context,state)
        {
          return Scaffold(
            backgroundColor: Colors.white,
            //backgroundColor: HexColor('#121551'),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                     const   Image(
                          image: AssetImage(
                              'assets/images/login.png'
                          ),
                        ),
                        Text(
                            'Login',
                            style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black)
                        ),

                          Text(
                            'Login now to browse our hot offers',
                            style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey)
                        ),
                     const   SizedBox(
                          height: 20.0,
                        ),

                        defaultTextFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Please Enter your Email_Address';
                            }
                          },
                          prefix: Icons.email_outlined,
                          label: 'Email Address',

                        ),
                      const  SizedBox(
                          height: 20.0,
                        ),

                        defaultTextFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: LoginCubit.get(context).suffix,
                          isPassword: LoginCubit.get(context).isPassword,
                          suffixPressed: ()
                          {
                            LoginCubit.get(context).ChangePassword();
                          },
                          onSubmit: (value)
                          {
                            if(formkey.currentState.validate())
                            {
                              LoginCubit.get(context).UserLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          validate: (String value)
                          {
                            if(value.isEmpty)
                            {
                              return 'Please Enter your Password';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.password,

                        ),
                     const   SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                            condition: state is! LoginLoadingState,
                            builder: (context)=>defaultButton(
                                function: ()
                                {
                                  if(formkey.currentState.validate())
                                  {
                                    LoginCubit.get(context).UserLogin(
                                        email: emailController.text,
                                        password: passwordController.text,

                                    );

                                  }
                                },

                                text: 'Login',
                                radius: 50.0,
                            ),
                            fallback:(context)=> const Center(child: CircularProgressIndicator()),
                        ),
                     const   SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          children: [
                            Text(
                                'Don\'t have an Accuont ?',
                                style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black)
                            ),
                            defaultTextButton(function: (){ navigateTo(context, RegisterScreen(),);}, text: 'Sign up', ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } ,
      ),
    );
  }
}
