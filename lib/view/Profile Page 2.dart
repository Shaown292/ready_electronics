
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing_riverpod/pages/ProfilePage.dart';
import 'package:testing_riverpod/provider%20class/Data%20Class.dart';

import '../Nav_Drawer.dart';
import '../components/CartButton.dart';
import '../components/colors.dart';
import '../components/component.dart';
import 'log in otp.dart';

class ProfilePageView extends StatefulWidget {
   const ProfilePageView({Key? key}) : super(key: key);

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const RobotoText(
          text: "My Account",
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
      body: Consumer<AddDetailsProvider>(
        builder: (BuildContext context, value, Widget? child){
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Stack(children: [
                      CircleAvatar(
                        radius: 48.0,
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/image/profile.png'),
                      ),
                      Positioned(
                        bottom: 0.0,
                        right: 0.0,
                        child: Icon(
                          Icons.cloud_upload,
                          color: custom,
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Divider(thickness: 2.0,),
                    const SizedBox(
                      height: 20.0,
                    ),

                    // const RobotoText(
                    //     text: "Full Name", size: 16.0, fontWeight: FontWeight.w300),

                    GestureDetector(
                      onTap: (){
                    userLoggedIn();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            Icon(Icons.edit_document, size: 30.0, color: custom,),
                            SizedBox(width: 5.0,),
                            RobotoText(text: "Edit", size: 24.0, fontWeight: FontWeight.w500, color: custom,),

                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Column(
                          children: [
                            Icon(Icons.person, color: custom, size: 24.0,),
                            RobotoText(text: "Name", size: 18.0, fontWeight: null, color: custom,)
                          ],
                        ),
                        const SizedBox(width: 45.0,),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 10.0,),
                                RobotoText(
                                  text: value.getName(),
                                  size: 18.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Column(
                          children: [
                            Icon(Icons.email, color: custom, size: 24.0,),
                            RobotoText(text: "E-mail", size: 18.0, fontWeight: null, color: custom,)
                          ],
                        ),
                        const SizedBox(width: 40.0,),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 10.0,),
                                RobotoText(
                                  text: value.getEmail(),
                                  size: 18.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Column(
                          children: [
                            Icon(Icons.location_on, color: custom, size: 24.0,),
                            RobotoText(text: "Address", size: 18.0, fontWeight: null, color: custom,)
                          ],
                        ),
                        const SizedBox(width: 20.0,),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(width: 10.0,),
                                RobotoText(
                                  text: value.getAddress(),
                                  size: 18.0,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ],
                            ),

                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Column(
                          children: [
                            Icon(Icons.call, color: custom, size: 24.0,),
                            RobotoText(text: "Number", size: 18.0, fontWeight: null, color: custom,)
                          ],
                        ),
                        const SizedBox(width: 20.0,),
                        Expanded(
                          child: Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        },

      ),
    );

  }

   void userLoggedIn() {
     if(NavDrawerState.KEYLOGIN == true){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProfilePage()));
     }
     else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const LogInOTP()));
       const snackDemo = SnackBar(
         content: Text('You need to log in first'),
         backgroundColor: custom,
         elevation: 10,
         behavior: SnackBarBehavior.floating,
         margin: EdgeInsets.all(5),
       );
       ScaffoldMessenger.of(context).showSnackBar(snackDemo);
     }
   }
}
