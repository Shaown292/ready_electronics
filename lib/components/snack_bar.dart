


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_riverpod/components/colors.dart';
import 'package:testing_riverpod/components/component.dart';

class CustomSnackBar {
  final BuildContext context;
  final String text;
  final Color color;
  CustomSnackBar({this.color=Colors.black, required this.context, required this.text})
  {
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content:  Text(text),
      backgroundColor: (custom),
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
      action: SnackBarAction(
        textColor: color,
        label: 'dismiss',
        onPressed: () {
        },
      ),
    ));
  }
}