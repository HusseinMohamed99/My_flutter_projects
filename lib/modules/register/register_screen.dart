import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/home_screen.dart';
import 'package:flutter_projects/modules/Chats/chats_screen.dart';
import 'package:flutter_projects/modules/register/cubit/cubit.dart';
import 'package:flutter_projects/modules/register/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';
import 'package:flutter_projects/shared/styles/icon_broken.dart';
import 'package:flutter_svg/flutter_svg.dart';



List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("Cairo"), value: "Cairo"),
    DropdownMenuItem(child: Text("Alexandria"), value: "Alexandria"),
    DropdownMenuItem(child: Text("Giza"), value: "Giza"),
    DropdownMenuItem(
        child: Text("Shubra El Kheima"), value: "Shubra El Kheima"),
    DropdownMenuItem(child: Text("Port Said"), value: "Port Said"),
    DropdownMenuItem(child: Text("Suez"), value: "Suez"),
    DropdownMenuItem(
        child: Text("El Mahalla El Kubra"), value: "El Mahalla El Kubra"),
    DropdownMenuItem(child: Text("Luxor"), value: "Luxor"),
    DropdownMenuItem(child: Text("Mansoura"), value: "Mansoura"),
    DropdownMenuItem(child: Text("Tanta"), value: "Tanta"),
    DropdownMenuItem(child: Text("Asyut"), value: "Asyut"),
    DropdownMenuItem(child: Text("Ismailia"), value: "Ismailia"),
    DropdownMenuItem(child: Text("Faiyum"), value: "Faiyum"),
    DropdownMenuItem(child: Text("Zagazig"), value: "Zagazig"),
    DropdownMenuItem(child: Text("Damietta"), value: "Damietta"),
    DropdownMenuItem(child: Text("Aswan"), value: "Aswan"),
    DropdownMenuItem(child: Text("Minya"), value: "Minya"),
    DropdownMenuItem(child: Text("Damanhur"), value: "Damanhur"),
    DropdownMenuItem(child: Text("Beni Suef"), value: "Beni Suef"),
    DropdownMenuItem(child: Text("Hurghada"), value: "Hurghada"),
    DropdownMenuItem(child: Text("Qena"), value: "Qena"),
    DropdownMenuItem(child: Text("Sohag"), value: "Sohag"),
    DropdownMenuItem(child: Text("Shibin El Kom"), value: "Shibin El Kom"),
    DropdownMenuItem(child: Text("Banha"), value: "Banha"),
    DropdownMenuItem(child: Text("Arish"), value: "EnglaArishnd"),
  ];
  return menuItems;
}

class Register_Screen extends StatefulWidget {
  @override
  State<Register_Screen> createState() => _Register_ScreenState();
}

class _Register_ScreenState extends State<Register_Screen> {
  String selectedValue = null;

  var formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var countryController = TextEditingController();

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
        create: (context) => RegisterCubit(),
        child: BlocConsumer<RegisterCubit, RegisterStates>(
            listener: (context, state) {
              if (state is CreateUserSuccessState) {
                navigateAndFinish(context, ChatsScreen());
              }
            }, builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        defaultTextFormFeild(
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          label: 'Name',
                          hint: 'name',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormFeild(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email';
                            }
                          },
                          label: 'Email_Adderss',
                          hint: 'email',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        defaultTextFormFeild(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          suffix: RegisterCubit.get(context).suffix,
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context).ChangePassword();
                          },
                          onFieldSubmitted: (value) {},
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
                        defaultTextFormFeild(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your phone';
                            }
                          },
                          label: 'Phone',
                          hint: 'phone',
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        DropdownButtonFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Text(''), //fake ,
                            filled: true,
                            isCollapsed: false,
                            fillColor: Colors.blue.withOpacity(0.2),
                            hoverColor: Colors.red.withOpacity(0.2),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              borderSide: BorderSide(
                                color: Colors.green,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            labelText: 'City',
                            labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.deepOrangeAccent,
                            ),
                            hintText: 'City',
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            focusColor: Colors.white,
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              borderSide: BorderSide(
                                color: Colors.green,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                topLeft: Radius.circular(20.0),
                              ),
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                          validator: (value) =>
                          value == null ? "Select a city" : null,
                          dropdownColor: Colors.white.withOpacity(0.5),
                          value: selectedValue,
                          onChanged: (String newValue) {
                            setState(() {
                              selectedValue = newValue;
                            });
                          },
                          items: dropdownItems,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! RegisterLoadingState,
                          builder: (context) => defaultMaterialButton(
                            function: () {
                              if (formkey.currentState.validate()) {
                                checkRegister(context);
                              }
                            },
                            text: 'Register',
                            width: 250.0,
                            radius: 20.0,
                          ),
                          fallback: (context) =>
                          const Center(child: CircularProgressIndicator()),
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  void checkRegister(BuildContext context) {
    RegisterCubit.get(context).UserRegister(
      email: emailController.text,
      password: passwordController.text,
      name: nameController.text,
      phone: phoneController.text,
    );
  }
}
