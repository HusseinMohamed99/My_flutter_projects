import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_projects/home/cubit/cubit.dart';
import 'package:flutter_projects/home/cubit/state.dart';
import 'package:flutter_projects/shared/componnetns/components.dart';


class SettingScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state)
      {
        if(state is LoginUserSuccessStates) {}
      },
      builder: (context, state)
      {
        var model = HomeCubit.get(context).UserData;

        nameController.text = model.data.name;
        emailController.text = model.data.email;
        phoneController.text = model.data.phone;
        return  ConditionalBuilder(
          condition: HomeCubit.get(context).UserData!=null,
          builder: (context)=> Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  if(state is UpdateUserLoadingStates)
                  LinearProgressIndicator(),
                  SizedBox(
                    height: 20.0,
                  ),
                  defaultTextFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Name must not be empty';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: Icons.person,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  defaultTextFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Email_Address must not be empty';
                      }
                      return null;
                    },
                    label: 'Email_Address',
                    prefix: Icons.email_outlined,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  defaultTextFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Phone must not be empty';
                      }
                      return null;
                    },
                    label: 'Phone',
                    prefix: Icons.phone_android,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                    width: 200.0,
                      radius: 50.0,
                      function: ()
                      {
                        if(formkey.currentState.validate())
                        {
                          HomeCubit.get(context).UpdateUserData(
                            name : nameController.text,
                            email: emailController.text,
                            phone: phoneController.text,
                          );
                        }return null;

                      },
                      text: 'Update',
                  )
                ],
              ),
            ),
          ),
          fallback: (context)=> Center(child: CircularProgressIndicator()),

        );
      },

    );

  }
}
