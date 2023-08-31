import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../cart/screen/CartButton.dart';
import '../../../components/colors.dart';
import '../../../components/component.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const RobotoText(
          text: "Ready Electronics",
          size: 24.0,
          fontWeight: FontWeight.bold,
          color: custom,
        ),
        iconTheme: const IconThemeData(
          color: custom,
        ),
        backgroundColor: Colors.white,
        actions: const [
          Messenger(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomCart(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/image/ready_logo.png"),
                              fit: BoxFit.fill)),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Ready Electronics ',
                          style: TextStyle(fontSize: 40, color: custom),
                          children: <InlineSpan>[
                            TextSpan(
                              text:
                                  'is one of the most trusted electronic shop in mirpur',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Location: ',
                          style: TextStyle(fontSize: 20, color: custom),
                          children: <InlineSpan>[
                            TextSpan(
                              text:
                                  'House: 12, Road: 13, Rupnagot R/A, Mirpur Dhaka, Bangladesh 1216',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text.rich(
                TextSpan(
                  text: 'Copyright © \n',
                  style: TextStyle(fontSize: 16, color: custom),
                  children: <InlineSpan>[
                    TextSpan(
                      text: 'Ready Electronics All rights reserved.',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    )
                  ],
                ),
              ),
            ),

            // const RobotoText(text: "Copyright © Ready Electronics All rights reserved.", size: 16.0, fontWeight: FontWeight.w500, color: custom,)
          ],
        ),
      ),
    );
  }
}
