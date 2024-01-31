// ignore_for_file: file_names, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  final String data;
  const WelcomePage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to Second Page.')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Text(
              'Your phone number : ${data}',
              style: const TextStyle(fontSize: 20,
               fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
