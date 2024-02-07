// ignore_for_file: file_names, unnecessary_brace_in_string_interps, unused_local_variable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_3/Views/Screens/SupScreens/Categories.dart';
import 'package:flutter_application_3/Views/Screens/SupScreens/Settings.dart';
import 'package:flutter_application_3/Views/Screens/SupScreens/home.dart';
import 'package:flutter_application_3/Views/Screens/carts_details_Screen.dart';
import 'package:flutter_application_3/core/Settings_util.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int pageIndex = 1;
  String phoneNumber = "";
  List<Widget> pages = [
    const home(),
    Categories(),
    const Settings(),
  ];

  @override
  void initState() {
    super.initState();
    getPhoneNumber();
  }

  Future<void> getPhoneNumber() async {
    phoneNumber = await SettingsUtil.getCachedUserPhone();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width * 0.7,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              height: 150,
              color: Colors.blue,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(Icons.close))
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.yellow,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      Text("User Name"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Phone: $phoneNumber")],
                  )
                ],
              ),
            ),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Profile"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.add_shopping_cart),
                  title: Text("Add product"),
                )),
            InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CartsScreen()));
                },
                child: const ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text("Cart"),
                )),
            InkWell(
                onTap: () async {},
                child: const ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                )),
            const Divider(),
            InkWell(
                onTap: () async {
                  SettingsUtil.signOutFlow(context);
                },
                child: const ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text("Sign out"),
                ))
          ],
        ),
      ),
      appBar: AppBar(),
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: pageIndex,
        onTap: onNavBarTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categoriess"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }

  void onNavBarTapped(int index) {
    pageIndex = index;
    setState(() {});
  }
}
