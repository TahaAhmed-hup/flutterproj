// ignore_for_file: prefer_const_constructors, camel_case_types, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Views/Screens/WelcomePage.dart';
import 'package:flutter_application_3/widgets/app_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class login extends StatefulWidget {
  const login({super.key, });
  

  @override
  State<login> createState() => _MyLoinPageState();
}

class _MyLoinPageState extends State<login> {
  TextEditingController PhoneNumcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  String data = " ";

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipOval(
                child: SizedBox.fromSize(
                  size: Size.fromRadius(80), // Image radius
                  child: Image.asset('assets/logo.png', fit: BoxFit.cover),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: PhoneNumcontroller,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: "Phone number",
                  ),
                  validator: (value) {
                    if (value!.length > 8 && value.length < 10) {
                      return null;
                    } else {
                      return "Invalid Phone number";
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(labelText: "PassWord"),
                  validator: (value) {
                    if (value!.length < 8) {
                      return "Invalid password";
                    }
                    return null;
                  },
                ),
              ),
              AppButton(
                label: "Log in",
                color: Colors.blue[300]!,
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print("Logged in");
                    }
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => WelcomePage(
                    //               data: PhoneNumcontroller.text,
                    //             ))
                    //             );
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('user_Phone_number', PhoneNumcontroller.text);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>const WelcomePage()));
                    passwordcontroller.clear();
                  }
                },
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 25),
                child: Text("Forgot password? Noyawa. Tap me"),
              ),
              AppButton(
                label: "No Account? Sign Up",
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
