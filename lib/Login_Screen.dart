import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login_Screen extends StatelessWidget {
  var emailController = TextEditingController();
  var PasswordController = TextEditingController();

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                    20.0,
                  )),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Image(
                        fit: BoxFit.cover,
                        height: 250.0,
                        width: 400.0,
                        image: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbamG7dkJXndS21dBQZq02Lo566GpmlAo1dQ&usqp=CAU',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Email must not be empty';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: PasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(
                      Icons.remove_red_eye,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                    ),
                  ),
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Password must not be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                    5.0,
                  )),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60.0,
                        color: Colors.blue,
                        child: MaterialButton(
                          onPressed: () {
                            if (formkey.currentState.validate()) {
                              print(emailController.text);
                              print(PasswordController.text);
                            }
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 35.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Don\'t have an account? ',
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Register Now!'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
