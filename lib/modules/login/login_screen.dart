import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/home_screen.dart';
import 'package:flutter_projects/modules/login/cubit/cubit.dart';
import 'package:flutter_projects/modules/login/cubit/state.dart';
import 'package:flutter_projects/modules/register/register_screen.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
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
          if (state is LoginErrorState)
          {
            ShowToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if(state is LoginSuccessState)
          {
            CacheHelper.saveData(
              key: 'uId',
              value:state.uId,
            ).then((value)
            {
              navigateAndFinish(context, HomeScreen());
            }
            );
          }
        },
        builder:(context,state)
        {
          return Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
              ),
              child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                         Image(
                        image: AssetImage(
                            'assets/images/log.png',
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                                'Login',
                                style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black)
                            ),

                            Text(
                                'Login now to browse our hot offers',
                                style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey)
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                top: 20.0,
                                bottom: 0.0,
                                start:20.0 ,
                                end:20.0 ,
                              ),
                              child: defaultTextFormField(
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
                            ),
                            const  SizedBox(
                              height: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.only(
                                top: 0.0,
                                bottom: 10.0,
                                start:20.0 ,
                                end:20.0 ,
                              ),
                              child: defaultTextFormField(
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
                            ),
                            const   SizedBox(
                              height: 20.0,
                            ),
                            Center(
                              child: ConditionalBuilder(
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
                                  width: 250.0,
                                  height: 50.0,


                                ),
                                fallback:(context)=> const Center(child: CircularProgressIndicator()),
                              ),
                            ),
                            const   SizedBox(
                              height: 20.0,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                      '- OR -'
                                  ),
                                  Text(
                                      'Sign in with'
                                  ),

                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                      'Don\'t have an Accuont ?',
                                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.black)
                                  ),
                                  defaultTextButton(
                                    function: ()
                                    {
                                      navigateTo(context, RegisterScreen());
                                    },
                                    text: 'Sign up',
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),



                    ],
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
