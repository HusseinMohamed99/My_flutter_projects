import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/register/register_screen.dart';
import 'package:flutter_projects/shared/commpnents.dart';
import 'package:flutter_projects/login/cubit/cubit.dart';
import 'package:flutter_projects/login_with/google.dart';
import 'package:flutter_projects/shared/network/local/cache.dart';
import 'package:flutter_projects/login/cubit/states.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
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
             // navigateTo(context, Widget);
            });
          }
        },
        builder: (context, state)
        {
          return  Container(
            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/QS.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Center(
                  child: Form(
                    key: formkey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: AssetImage('assets/images/8.png'),
                          ),
                          Text(
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .copyWith(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 30.0, left: 30.0, right: 30.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.orange),
                                ),

                                defaultTextFormField(
                                  controller: emailController,
                                  type: TextInputType.emailAddress,
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Email must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Email Address',
                                  prefix: Icons.alternate_email,

                                ),
                                SizedBox(
                                  height: 30.0,
                                ),
                                Text(
                                  'Password',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(color: Colors.orange),
                                ),
                                defaultTextFormField(
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
                                      return 'password must not be empty';
                                    }
                                    return null;
                                  },
                                  label: 'Password',
                                  prefix: Icons.lock_open_rounded

                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: defaultButton(
                                      width: 250.0,
                                      radius: 20.0,
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
                                      text: 'Login'),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Center(
                                  child: Text(
                                    '_- OR sign with -_',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                                Row(

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
                                           fit: BoxFit.none,

                                          ),
                                          onTap: () {
                                            signInWithGoogle();
                                          },
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
                                            'assets/icon/facebook.svg',
                                           fit: BoxFit.none,
                                          ),
                                          onTap: ()
                                          {
                                            signInWithGoogle();
                                          },
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
                                            'assets/icon/twitter.svg',
                                           fit: BoxFit.none,
                                          ),
                                          onTap: () {
                                            signInWithGoogle();
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Text('Don\'t have an Accuont ?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2
                                              .copyWith(color: Colors.white)),
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
                        ],
                      ),
                    ),
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
