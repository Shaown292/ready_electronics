

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool readOnly ;
  final TextEditingController controller;
  final Icon? icon;
  const CustomTextField({Key? key, required this.hintText, required this.readOnly, required this.controller, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
        readOnly: readOnly,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(10.0),
          ),
          suffixIcon: icon,
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
      );

  }
}
