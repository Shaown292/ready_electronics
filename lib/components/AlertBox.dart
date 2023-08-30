
import 'package:flutter/material.dart';
import 'package:testing_riverpod/components/component.dart';

import 'colors.dart';

class PopupDialogue{


  final String header;
  final String body;
  final String footer;
  final BuildContext context;


  PopupDialogue({required this.context, required this.header, required this.body, required this.footer });


  Widget _buildPopupDialog() {
    return AlertDialog(
      title: RobotoText(text: header, size: 24.0, fontWeight: FontWeight.w300, color: custom),
      content:  Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: RobotoText(text: body, size: 18.0, fontWeight: FontWeight.w300, color: Colors.black)),
        ],
      ),
      actions: <Widget>[
        MaterialButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child:  RobotoText(text: footer, size: 16.0, fontWeight: FontWeight.w300, color: custom),
        ),
      ],
    );
  }
}

