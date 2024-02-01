// ignore_for_file: file_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/SupScreens/Categories.dart';
import 'package:flutter_application_3/Screens/SupScreens/Settings.dart';
import 'package:flutter_application_3/Screens/SupScreens/home.dart';
import 'package:flutter_application_3/Screens/login.dart';

class WelcomePage extends StatefulWidget {
  final String data;
  const WelcomePage({super.key, required this.data});
@override
State<WelcomePage> createState()=> _WelcomePageState();

}
class _WelcomePageState extends State<WelcomePage>{
  int pageIndex = 1;
  List<Widget> pages =[
    const home(),
    const Categories(),
    const Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 2,
        color: Colors.white,
        child: Column(children: [
          const SizedBox(
            height: 100,
          ),
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const login()));
            },
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.exit_to_app),Text("Signout")],
            ),
          )
        ]),
      ),
      appBar: AppBar(),
      body: pages [pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categoriess"),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings"),
        ],
      ),
    );
  }
  
 

  void onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {
      
    });
  }
}
