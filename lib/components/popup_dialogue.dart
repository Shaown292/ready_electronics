import 'package:flutter/material.dart';
import 'package:testing_riverpod/components/component.dart';

import 'colors.dart';

class PopupDialogue {


  static show({required BuildContext context,
  required String header,
  required String body,
  required String  footer,
  required Function() onTap}) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: RobotoText(text: header, size: 24.0, fontWeight: FontWeight.w300,
              color: custom,),
              content: RobotoText(text: body, size: 20.0, fontWeight: FontWeight.w300,
                color: Colors.black),
              actions: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 30.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: customAccent,
                    ),
                    child: Center(
                      child: RobotoText(text: footer, size: 18.0, fontWeight: FontWeight.w300,
                        color: Colors.black),
                    ),
                  ),
                ),
              ],
            ));
  }
}

// return AlertDialog(
//       title: RobotoText(text: header, size: 24.0, fontWeight: FontWeight.w300, color: custom),
//       content:  Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           Center(child: RobotoText(text: body, size: 18.0, fontWeight: FontWeight.w300, color: Colors.black)),
//         ],
//       ),
//       actions: <Widget>[
//         MaterialButton(
//           onPressed: onTap,
//           textColor: Theme.of(context).primaryColor,
//           child:  RobotoText(text: footer, size: 16.0, fontWeight: FontWeight.w300, color: custom),
//         ),
//       ],
//     );
