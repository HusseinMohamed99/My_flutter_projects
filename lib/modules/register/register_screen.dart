import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/home_screen.dart';
import 'package:flutter_projects/modules/register/cubit/cubit.dart';
import 'package:flutter_projects/modules/register/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';
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
            navigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body:  Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const   Image(
                          width: 300.0,
                          height: 200.0,
                          image: AssetImage(
                            'assets/images/Check.png',
                          ),
                        ),
                        Text(
                            'Register',
                            style: Theme.of(context).textTheme.headline4.copyWith(color: Colors.black)
                        ),
                        Text(
                            'Register now to browse our hot offers',
                            style: Theme.of(context).textTheme.bodyText2.copyWith(color: Colors.grey)
                        ),
                        const   SizedBox(
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
                          prefix: Icons.person,
                          label: 'Name',

                        ),
                        const  SizedBox(
                          height: 15.0,
                        ),  defaultTextFormField(
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
                          prefix: Icons.phone_android,
                          label: 'Phone',
                        ),
                        const  SizedBox(
                          height: 15.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context)=>defaultButton(
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
                          fallback:(context)=> const Center(child: CircularProgressIndicator()),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
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
                      ],
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
