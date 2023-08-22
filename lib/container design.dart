import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cont extends StatelessWidget {
  final String txt1;
  final String tex2;
  const Cont({Key? key, required this.txt1, required this.tex2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      color: Colors.red,
      child:  Column(
        children: [
          Text(txt1),
          Text(tex2),
        ],
      ),

    );
  }
}
