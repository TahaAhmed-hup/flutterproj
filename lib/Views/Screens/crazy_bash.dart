// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Views/Screens/WelcomePage.dart';
import 'package:flutter_application_3/Views/Screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Crazybash extends StatefulWidget {
  const Crazybash({super.key});

  @override
  State<Crazybash> createState() => _CrazybashState();
}

class _CrazybashState extends State<Crazybash> {
  @override
  void initState() {
    super.initState();
    handlelogin();
  }

  Future<void> handlelogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? phoneNumber = prefs.getString('user_Phone_number');
    if (phoneNumber == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const login()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const WelcomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
