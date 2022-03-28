import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:flutter_projects/home/home_screen.dart';
import 'package:flutter_projects/modules/login/cubit/cubit.dart';
import 'package:flutter_projects/modules/login/cubit/state.dart';
import 'package:flutter_projects/modules/register/register_screen.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            ShowToast(
              text: state.error,
              state: ToastStates.ERROR,
            );
          }
          if (state is LoginSuccessState) {
            CacheHelper.saveData(
              key: 'uId',
              value: state.uId,
            ).then((value) {
              navigateAndFinish(context, HomeScreen());
            });
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.blue.shade900,
            body: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        child: Image(
                          image: AssetImage(
                            'assets/images/M.png',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: double.infinity,
                          height: 610.0,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.95),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(65.0),
                                topRight: Radius.circular(65.0),
                              )),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text('Login',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4
                                          .copyWith(color: Colors.black)),
                                  Text(
                                    'Now',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(color: Colors.grey),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  top: 20.0,
                                  bottom: 0.0,
                                  start: 20.0,
                                  end: 20.0,
                                ),
                                child: defaultTextFormField(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter your Email_Address';
                                    }
                                  },
                                  prefix: Icons.email_outlined,
                                  label: 'Email Address',
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.only(
                                  top: 0.0,
                                  bottom: 10.0,
                                  start: 20.0,
                                  end: 20.0,
                                ),
                                child: defaultTextFormField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  suffix: LoginCubit.get(context).suffix,
                                  isPassword:
                                      LoginCubit.get(context).isPassword,
                                  suffixPressed: () {
                                    LoginCubit.get(context).ChangePassword();
                                  },
                                  onSubmit: (value) {
                                    if (formkey.currentState.validate()) {
                                      LoginCubit.get(context).UserLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter your Password';
                                    }
                                  },
                                  label: 'Password',
                                  prefix: Icons.password,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: ConditionalBuilder(
                                  condition: state is! LoginLoadingState,
                                  builder: (context) => defaultButton(
                                    function: () {
                                      if (formkey.currentState.validate()) {
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
                                  fallback: (context) => Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Center(
                                child: Column(
                                  children: [
                                    Text('- OR -'),
                                    Text('Sign in with'),
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Container(
                                        color: Colors.grey[200],
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                              InkWell(
                                                child: CircleAvatar(
                                                  child: SvgPicture.asset(
                                                    'assets/icon/google.svg',
                                                    height: 100.0,
                                                    width: 100.0,
                                                    allowDrawingOutsideViewBox: true,
                                                  ),
                                                  radius: 30.0,
                                                  backgroundColor: Colors.white24,
                                                ),
                                                onTap: (){},
                                              ),
                                              InkWell(
                                                child: CircleAvatar(
                                                  child: SvgPicture.asset(
                                                    'assets/icon/facebook.svg',
                                                    height: 100.0,
                                                    width: 100.0,
                                                    allowDrawingOutsideViewBox: true,
                                                  ),
                                                  radius: 30.0,
                                                  backgroundColor: Colors.white24,
                                                ),
                                                onTap: (){},
                                              ),
                                              InkWell(
                                                child: CircleAvatar(
                                                  child: SvgPicture.asset(
                                                    'assets/icon/twitter.svg',
                                                    height: 100.0,
                                                    width: 100.0,
                                                    allowDrawingOutsideViewBox: true,
                                                  ),
                                                  radius: 30.0,
                                                  backgroundColor: Colors.white24,
                                                ),
                                                onTap: () {},
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text('Don\'t have an Accuont ?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2
                                            .copyWith(color: Colors.black)),
                                    defaultTextButton(
                                      function: () {
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
