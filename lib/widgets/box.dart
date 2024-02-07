import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  const Box(
      {super.key,
      required this.title,
      required this.thumbnail,
      required this.desc});
  final String title;
  final String thumbnail;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        color: Colors.green[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 70,
              height: 70,
              child: Image.network(
                thumbnail,
              ),
            ),
            const SizedBox(
              width: 0,
              height: 100,
            ),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 0,
              height: 20,
            ),
            Text(desc)
          ],
        ),
      ),
    );
  }
}
