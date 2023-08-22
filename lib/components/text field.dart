import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final  inputType;
  const MyTextField({Key? key, @required this.controller, required this.hintText, required this.obscureText, this.inputType}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  SizedBox(
      width: 300.0,
      child: TextField(
        obscureText: obscureText ,
        decoration: InputDecoration(
          enabledBorder:  OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        keyboardType: inputType,


      ),
    );
  }
}
