import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cmoon_icons/flutter_cmoon_icons.dart';
import 'package:flutter_projects/home/home_screen.dart';
import 'package:flutter_projects/modules/Chats/chats_screen.dart';
import 'package:flutter_projects/modules/login/cubit/cubit.dart';
import 'package:flutter_projects/modules/login/cubit/state.dart';
import 'package:flutter_projects/modules/register/register_screen.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/network/local/cache_helper.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login_Screen extends StatefulWidget {
  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/99.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child:
        BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
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
              navigateAndFinish(context, ChatsScreen());
            });
          }
        }, builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      defaultTextFormFeild(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please enter your email';
                          }
                        },
                        label: 'Email_Adderss',
                        hint: 'Email',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormFeild(
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        suffix: LoginCubit.get(context).suffix,
                        isPassword: LoginCubit.get(context).isPassword,
                        suffixPressed: () {
                          LoginCubit.get(context).ChangePassword();
                        },
                        onFieldSubmitted: (value) {
                          if (formkey.currentState.validate()) {
                            checkLogin(context);
                          }
                        },
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please enter your password';
                          }
                        },
                        label: 'Password',
                        hint: 'Password',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context) => defaultMaterialButton(
                            function: () {
                              if (formkey.currentState.validate()) {
                                checkLogin(context);
                              }
                            },
                            text: 'Login',
                            width: 250.0,
                            radius: 20.0,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        "ــــــــــــــــــــــ OR Sign With ــــــــــــــــــــ",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: InkWell(
                                  child: SvgPicture.asset(
                                    'assets/icon/google.svg',
                                  ),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: InkWell(
                                  child: SvgPicture.asset(
                                      'assets/icon/facebook.svg'),
                                  onTap: () {},
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                              child: Container(
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: InkWell(
                                  child: SvgPicture.asset(
                                      'assets/icon/twitter.svg'),
                                  onTap: () {},
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
                            Text(
                              "Don\'t have an account?",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                color: Colors.white,
                              ),
                            ),
                            defaultTextButton(
                              function: () {
                                navigateTo(context, Register_Screen());
                              },
                              text: 'Register Now !',
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
        }),
      ),
    );
  }

  void checkLogin(BuildContext context) {
    LoginCubit.get(context).UserLogin(
      email: emailController.text,
      password: passwordController.text,
    );
  }
}
