// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/Settings_util.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String userPhone = "";
  @override
  void initState() {
    super.initState();
    getUserPhoneNumber();
  }

  Future<void> getUserPhoneNumber() async {
    userPhone = await SettingsUtil.getCachedUserPhone();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const CircleAvatar(
          radius: 50,
          child: Icon(
            Icons.person,
            color: Colors.blue,
            size: 60,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Center(child: Text("User phone:$userPhone")),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[200],
            child: const ListTile(
              leading: Icon(Icons.edit),
              title: Text("Edit Profile"),
              subtitle: Text("Manage your account"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[200],
            child: const ListTile(
              leading: Icon(Icons.settings),
              title: Text("App Settings"),
              subtitle: Text("Manage your Settings"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.grey[200],
            child: const ListTile(
              leading: Icon(Icons.info),
              title: Text("About app"),
              subtitle: Text("data about developer and application"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            SettingsUtil.signOutFlow(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.grey[200],
              child: const ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Sign out"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
        ),
      ],
    );
  }
}