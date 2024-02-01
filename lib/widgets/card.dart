// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class card extends StatelessWidget {
  const card({Key? key, required String productName,}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.shopify),
            const Text("Item"),
            SizedBox(height: MediaQuery.of(context).size.height*0.1,
            ),
            const Text("100\$"),
          ],
        ),
      ),
    );
  }
}