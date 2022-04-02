import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/login_with/google.dart';
import 'package:flutter_projects/shared/commpnents.dart';
import 'package:flutter_projects/register/cubit/cubit.dart';
import 'package:flutter_projects/register/cubit/state.dart';
import 'package:flutter_projects/shared/style/icon_broken.dart';
import 'package:flutter_svg/flutter_svg.dart';


class RegisterScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state)
        {
          if(state is CreateUserSuccessState)
          {
            // navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context,state){
          return Container(

            constraints: const BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/QD.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                ),
                backgroundColor: Colors.transparent,
                body:  Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Form(

                        key: formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text(
                                'Register',
                                style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.white)
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            defaultTextFormField(
                              controller: nameController,
                              type: TextInputType.name,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'Please Enter your Name';
                                }
                              },
                              prefix: IconBroken.User1,
                              label: 'Name',

                            ),
                              SizedBox(
                              height: 15.0,
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
                              prefix: Icons.alternate_email,
                              label: 'Email Address',
                            ),
                              SizedBox(
                              height: 15.0,
                            ),

                            defaultTextFormField(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              suffix: RegisterCubit.get(context).suffix,
                              isPassword: RegisterCubit.get(context).isPassword,
                              suffixPressed: ()
                              {
                                RegisterCubit.get(context).ChangePassword();
                              },
                              onSubmit: (value) {},
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
                              height: 15.0,
                            ),
                            defaultTextFormField(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'Please Enter your Phone';
                                }
                              },
                              prefix: IconBroken.Call,
                              label: 'Phone',
                            ),
                            const  SizedBox(
                              height: 15.0,
                            ),
                            ConditionalBuilder(
                              condition: state is! RegisterLoadingState,
                              builder: (context)=>Center(
                                child: defaultButton(
                                  width: 250.0,
                                  function: ()
                                  {
                                    if(formkey.currentState.validate())
                                    {
                                      RegisterCubit.get(context).UserRegister(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text,
                                        phone: phoneController.text,

                                      );
                                    }
                                  },
                                  text: 'Register',
                                  radius: 30.0,
                                ),
                              ),
                              fallback:(context)=> const Center(child: CircularProgressIndicator()),
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

                          ],
                        ),
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