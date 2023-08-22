import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testing_riverpod/components/component.dart';
import 'package:testing_riverpod/pages/AddShippingAddressPage.dart';
import 'package:testing_riverpod/view/HomePage.dart';
import 'package:testing_riverpod/view/OTP%20Verification.dart';
import 'package:testing_riverpod/view/Profile%20Page%202.dart';
import 'package:testing_riverpod/view/favorite%20page.dart';
import 'package:testing_riverpod/view/log%20in%20otp.dart';
import 'package:testing_riverpod/pages/order.dart';
import 'package:testing_riverpod/view/practice.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

import 'components/colors.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  State<NavDrawer> createState() => NavDrawerState();
}

class NavDrawerState extends State<NavDrawer> {
  
  static const String KEYLOGIN = "login";

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          children: [
            const SizedBox(
              height: 20.0,
            ),

            GestureDetector(
              onTap: () {
                whereToGO();
              },
              child: const Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                          text: "Sign In",
                          size: 16.0,
                          fontWeight: FontWeight.w500,
                          color: custom)
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              height: 30.0,
              thickness: 2.0,
            ),

            //My Account
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePageView()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "My Account",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "View Account Details",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //My Orders
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const OrderPage()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.menu_book,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "My Orders",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "View previous orders",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //My Fav
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyFavoritePage()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "My Favorites",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "View all favorites",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //manage address
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AddShippingAddressPage()));
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "Manage Address",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: 'Manage your addresses',
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //Call to order
            GestureDetector(
              onTap: () {
                UrlLauncher.launch("tel:01716519826");
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.call,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "Call to order",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "01716519826",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),

            //Facebook
            GestureDetector(
              onTap: () async {
                const url = 'https://www.facebook.com/readyelectronics/';
                if (await canLaunch(url)) {
                  await launch(url,
                      forceWebView: false, enableJavaScript: true);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.facebook,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "Facebook Page",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "Find us on Facebook",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15.0),
            GestureDetector(
              onTap: () {},
              child: const Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: custom,
                    size: 30.0,
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RobotoText(
                        text: "Ready Electronics",
                        size: 16.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      RobotoText(
                        text: "About us",
                        size: 14.0,
                        fontWeight: FontWeight.w200,
                        color: Colors.black,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void whereToGO() async{
    var preference = await SharedPreferences.getInstance();
    var isLoggedIn = preference.getBool(KEYLOGIN);
    if(isLoggedIn != null){
      if(isLoggedIn){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage()));

      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInOTP()));
      }
    }
    else{
      Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInOTP()));
    }
  }
}

