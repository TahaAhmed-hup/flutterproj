// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_application_3/widgets/card.dart';

class home extends StatefulWidget {
  const home({super.key});
  

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> productName=[
    "product",
    "mobile",
    "mobile2",
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productName.length,
      itemBuilder: (context, index) {
        return card(productName: productName[index]);
      },
      );
  }
}