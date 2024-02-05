// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,),
    itemCount: 10,
     itemBuilder: (BuildContext context,int index) {
       return Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          color: Colors.blue,
          child: const Icon(Icons.tv_rounded,),
        ),
       );
     });
  }
}