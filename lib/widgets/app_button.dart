// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Color color;
  final void Function()? onTap;
  const AppButton({
    Key? key,
   required this.label,
   required this.color,
   this.onTap
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
                onTap: onTap,
                child: Container(
                  width: 250,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child:  Center(
                    child: Text(
                      label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
  }
}