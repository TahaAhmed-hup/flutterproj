// ignore_for_file: must_be_immutable, non_constant_identifier_names, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Models/categorye.dart';
import 'package:flutter_application_3/widgets/box.dart';

class Categories extends StatelessWidget {
  Categories({super.key});

  CollectionReference Category =
      FirebaseFirestore.instance.collection('Categories');

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Category.get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // or any loading indicator
        }

        List<category> data = snapshot.data!.docs
            .map((doc) => category.fromjson(doc.data() as Map<String, dynamic>))
            .toList();

        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return Box(
              title: data[index].title,
              thumbnail: data[index].thumbnail,
              desc: data[index].desc,
            );
          },
        );
      },
    );
  }
}
